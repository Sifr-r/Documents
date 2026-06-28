# NestJS

NestJS is a progressive Node.js framework for building efficient, scalable server-side applications with TypeScript. It uses decorators, dependency injection, and a modular architecture inspired by Angular.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Modules, controllers, providers, DTOs, guards, pipes, interceptors, exception filters, middleware, database integration, testing, and WebSockets |

## Quick Reference

### Project Setup

```bash
npm i -g @nestjs/cli
nest new my-project
cd my-project
npm run start:dev
```

### Controller

```typescript
@Controller("users")
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  findAll(): User[] {
    return this.usersService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: string): User {
    return this.usersService.findOne(+id);
  }

  @Post()
  create(@Body() dto: CreateUserDto): User {
    return this.usersService.create(dto);
  }
}
```

### Injectable Provider

```typescript
@Injectable()
export class UsersService {
  private users: User[] = [];

  findAll(): User[] { return this.users; }
  findOne(id: number): User { return this.users[id]; }
  create(dto: CreateUserDto): User { /* ... */ }
}
```

### Module

```typescript
@Module({
  imports: [TypeOrmModule.forFeature([User])],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
```

### Guard

```typescript
@Injectable()
export class AuthGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const req = context.switchToHttp().getRequest();
    return !!req.headers.authorization;
  }
}

@Get("profile")
@UseGuards(AuthGuard)
getProfile(@Request() req) { return req.user; }
```

## See Also

- [NestJS Documentation](https://docs.nestjs.com/)
- [NestJS GitHub](https://github.com/nestjs/nest)
- [NestJS Awesome List](https://github.com/juliandavidmr/awesome-nestjs)
