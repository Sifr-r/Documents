# Spring Boot — Core

## Application Setup

```java
@SpringBootApplication
public class MyApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }
}
```

`@SpringBootApplication` combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.

## REST Controllers

```java
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping
    public List<UserDTO> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return userService.findAll(PageRequest.of(page, size));
    }

    @GetMapping("/{id}")
    public UserDTO getById(@PathVariable Long id) {
        return userService.findById(id);
    }

    @PostMapping
    public ResponseEntity<UserDTO> create(@RequestBody @Valid CreateUserRequest request) {
        UserDTO user = userService.create(request);
        URI location = URI.create("/api/users/" + user.getId());
        return ResponseEntity.created(location).body(user);
    }

    @PutMapping("/{id}")
    public UserDTO update(@PathVariable Long id, @RequestBody @Valid UpdateUserRequest request) {
        return userService.update(id, request);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        userService.delete(id);
        return ResponseEntity.noContent().build();
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleNotFound(ResourceNotFoundException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(new ErrorResponse(ex.getMessage()));
    }
}
```

### ResponseEntity

```java
ResponseEntity.ok(user);                              // 200
ResponseEntity.created(location).body(user);          // 201
ResponseEntity.noContent().build();                   // 204
ResponseEntity.badRequest().body(error);              // 400
ResponseEntity.status(HttpStatus.FORBIDDEN).build();  // 403
```

## Services and Repositories

```java
@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final EventPublisher eventPublisher;

    public UserService(UserRepository userRepository, EventPublisher eventPublisher) {
        this.userRepository = userRepository;
        this.eventPublisher = eventPublisher;
    }

    @Transactional(readOnly = true)
    public List<UserDTO> findAll(Pageable pageable) {
        return userRepository.findAll(pageable)
                .map(UserDTO::from).getContent();
    }

    public UserDTO create(CreateUserRequest request) {
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new DuplicateEmailException(request.getEmail());
        }
        User user = new User(request.getName(), request.getEmail());
        user = userRepository.save(user);
        eventPublisher.publish(new UserCreatedEvent(user.getId()));
        return UserDTO.from(user);
    }
}
```

## Spring Data JPA

### Entity

```java
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(unique = true, nullable = false)
    private String email;

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Post> posts = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "department_id")
    private Department department;

    @CreatedDate
    private LocalDateTime createdAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;
}
```

### Repository

```java
public interface UserRepository extends JpaRepository<User, Long> {

    // Derived queries
    Optional<User> findByEmail(String email);
    List<User> findByLastNameOrderByCreatedAtDesc(String lastName);
    List<User> findByRoleAndActive(Role role, boolean active);
    boolean existsByEmail(String email);
    long countByRole(Role role);
    void deleteByRole(Role role);

    // JPQL
    @Query("SELECT u FROM User u WHERE u.email LIKE %:keyword%")
    List<User> searchByEmail(@Param("keyword") String keyword);

    @Query("SELECT u FROM User u JOIN u.posts p WHERE p.published = true")
    List<User> findUsersWithPublishedPosts();

    // Native SQL
    @Query(value = "SELECT * FROM users WHERE age > :age", nativeQuery = true)
    List<User> findOlderThan(@Param("age") int age);

    // Paging
    Page<User> findByRole(Role role, Pageable pageable);

    // Modifying
    @Modifying
    @Query("UPDATE User u SET u.active = false WHERE u.lastLogin < :before")
    int deactivateUsersBefore(@Param("before") LocalDateTime before);
}
```

### Specifications (Dynamic Queries)

```java
public class UserSpecs {
    public static Specification<User> hasRole(Role role) {
        return (root, query, cb) -> role == null ? null : cb.equal(root.get("role"), role);
    }

    public static Specification<User> nameContains(String name) {
        return (root, query, cb) -> name == null ? null :
                cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
    }
}

// Usage
userRepository.findAll(Specification.where(UserSpecs.hasRole(Role.ADMIN))
        .and(UserSpecs.nameContains("john")));
```

## Dependency Injection

```java
// Constructor injection (recommended)
@Service
public class OrderService {
    private final PaymentGateway gateway;
    private final OrderRepository repository;

    public OrderService(PaymentGateway gateway, OrderRepository repository) {
        this.gateway = gateway;
        this.repository = repository;
    }
}

// @Autowired (field injection — avoid in production)
@Service
public class NotificationService {
    @Autowired
    private EmailSender emailSender;
}

// Qualifiers
@Service
public class PaymentService {
    public PaymentService(@Qualifier("stripe") PaymentGateway gateway) {
        // Uses Stripe implementation
    }
}

// Bean definition
@Configuration
public class AppConfig {
    @Bean
    @Primary
    public PaymentGateway stripeGateway(@Value("${stripe.api-key}") String apiKey) {
        return new StripeGateway(apiKey);
    }

    @Bean
    public PaymentGateway paypalGateway() {
        return new PaypalGateway();
    }
}
```

## Configuration

### application.yml

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/mydb
    username: ${DB_USER:admin}
    password: ${DB_PASS:secret}
    hikari:
      maximum-pool-size: 20
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
  security:
    jwt:
      secret: ${JWT_SECRET}
      expiration: 86400000

server:
  port: 8080
  servlet:
    context-path: /api

logging:
  level:
    root: INFO
    com.myapp: DEBUG
```

### @ConfigurationProperties

```java
@ConfigurationProperties(prefix = "app.mail")
public class MailProperties {
    private String host;
    private int port;
    private String from;
    private boolean enabled = true;
    // getters and setters
}

// Enable
@Configuration
@EnableConfigurationProperties(MailProperties.class)
public class MailConfig {
    @Bean
    public MailSender mailSender(MailProperties props) {
        return new SmtpMailSender(props.getHost(), props.getPort());
    }
}
```

### Profiles

```yaml
# application-dev.yml
spring.jpa.hibernate.ddl-auto: update
logging.level.com.myapp: DEBUG

# application-prod.yml
spring.jpa.hibernate.ddl-auto: validate
logging.level.com.myapp: WARN
```

```bash
java -jar app.jar --spring.profiles.active=prod
```

## Security (Spring Security)

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/auth/**").permitAll()
                .requestMatchers("/api/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
            )
            .sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)
            .build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

// JWT Filter
@Component
public class JwtAuthFilter extends OncePerRequestFilter {
    private final JwtService jwtService;
    private final UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res,
                                     FilterChain chain) throws ServletException, IOException {
        String token = extractToken(req);
        if (token != null && jwtService.isValid(token)) {
            var auth = new UsernamePasswordAuthenticationToken(
                jwtService.getUsername(token), null, jwtService.getAuthorities(token));
            SecurityContextHolder.getContext().setAuthentication(auth);
        }
        chain.doFilter(req, res);
    }
}
```

## AOP

```java
@Aspect
@Component
public class LoggingAspect {

    @Around("@annotation(org.springframework.web.bind.annotation.GetMapping)")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long duration = System.currentTimeMillis() - start;
        log.info("{} executed in {}ms", joinPoint.getSignature(), duration);
        return result;
    }
}

// Custom annotation + aspect
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Auditable {}

@Aspect
@Component
public class AuditAspect {
    @AfterReturning("@annotation(auditable)")
    public void audit(Auditable auditable) {
        log.info("Audited action by {}", SecurityContextHolder.getContext().getAuthentication().getName());
    }
}
```

## Testing

### @SpringBootTest (Integration)

```java
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class UserControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private UserRepository userRepository;

    @BeforeEach
    void setUp() {
        userRepository.deleteAll();
    }

    @Test
    void shouldCreateUser() {
        var request = new CreateUserRequest("John", "john@example.com");
        var response = restTemplate.postForEntity("/api/users", request, UserDTO.class);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.CREATED);
        assertThat(response.getBody().getName()).isEqualTo("John");
    }
}
```

### MockMvc (Controller)

```java
@WebMvcTest(UserController.class)
class UserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    @Test
    void shouldReturnUsers() throws Exception {
        when(userService.findAll(any())).thenReturn(List.of(new UserDTO(1L, "John")));

        mockMvc.perform(get("/api/users"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].name").value("John"));
    }

    @Test
    void shouldValidateInput() throws Exception {
        var request = new CreateUserRequest("", "invalid");
        mockMvc.perform(post("/api/users")
                .contentType(MediaType.APPLICATION_JSON)
                .content(toJson(request)))
                .andExpect(status().isBadRequest());
    }
}
```

### @DataJpaTest (Repository)

```java
@DataJpaTest
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void shouldFindByEmail() {
        userRepository.save(new User("John", "john@example.com"));
        Optional<User> found = userRepository.findByEmail("john@example.com");
        assertThat(found).isPresent();
        assertThat(found.get().getName()).isEqualTo("John");
    }
}
```

## See Also

- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
- [Spring Data JPA Reference](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [Spring Security Reference](https://docs.spring.io/spring-security/reference/)
- [Spring Boot GitHub](https://github.com/spring-projects/spring-boot)
