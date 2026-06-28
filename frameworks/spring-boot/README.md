# Spring Boot

Spring Boot 3+ is a Java application framework built on the Spring Framework. It provides auto-configuration, embedded servers, and production-ready features with minimal boilerplate. It supports REST APIs, JPA, security, and microservices.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Application setup, REST controllers, services, repositories, Spring Data JPA, DI, configuration, security, AOP, and testing |

## Quick Reference

### Project Setup

```bash
# Via Spring Initializr (start.spring.io) or CLI
spring init --dependencies=web,data-jpa,security myapp
cd myapp
./mvnw spring-boot:run
```

### REST Controller

```java
@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAll() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    public User getById(@PathVariable Long id) {
        return userService.findById(id);
    }

    @PostMapping
    public ResponseEntity<User> create(@RequestBody @Valid UserDTO dto) {
        User user = userService.create(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(user);
    }
}
```

### Service

```java
@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(Long id) {
        return userRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("User not found"));
    }
}
```

### Repository

```java
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    List<User> findByLastName(String lastName);

    @Query("SELECT u FROM User u WHERE u.age > :age")
    List<User> findOlderThan(@Param("age") int age);
}
```

### Application Properties

```yaml
# application.yml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/mydb
    username: user
    password: pass
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
server:
  port: 8080
```

### Entity

```java
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(unique = true)
    private String email;
}
```

## See Also

- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
- [Spring Boot GitHub](https://github.com/spring-projects/spring-boot)
- [Spring Data JPA](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [Spring Initializr](https://start.spring.io/)
