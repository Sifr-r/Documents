# NestJS — Core

## Modules

```typescript
import { Module } from "@nestjs/common";

@Module({
  imports: [UsersModule, AuthModule],     // Import other modules
  controllers: [AppController],           // Controllers in this module
  providers: [AppService],                // Injectable services
  exports: [AppService],                  // Re-export for other modules
})
export class AppModule {}
```

### Dynamic Modules

```typescript
@Module({})
export class ConfigModule {
  static register(options: ConfigOptions): DynamicModule {
    return {
      module: ConfigModule,
      providers: [{ provide: "CONFIG", useValue: options }],
      exports: ["CONFIG"],
    };
  }
}
```

## Controllers

```typescript
import { Controller, Get, Post, Put, Delete, Param, Body, Query, HttpCode } from "@nestjs/common";

@Controller("users")
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  findAll(@Query("page") page: string): User[] {
    return this.usersService.findAll(+page || 1);
  }

  @Get(":id")
  findOne(@Param("id") id: string): User {
    return this.usersService.findOne(+id);
  }

  @Post()
  @HttpCode(201)
  create(@Body() dto: CreateUserDto): User {
    return this.usersService.create(dto);
  }

  @Put(":id")
  update(@Param("id") id: string, @Body() dto: UpdateUserDto): User {
    return this.usersService.update(+id, dto);
  }

  @Delete(":id")
  @HttpCode(204)
  remove(@Param("id") id: string): void {
    this.usersService.remove(+id);
  }
}
```

## Providers

```typescript
import { Injectable } from "@nestjs/common";

@Injectable()
export class UsersService {
  constructor(@InjectRepository(User) private repo: Repository<User>) {}

  findAll(page = 1, limit = 10): Promise<User[]> {
    return this.repo.find({ skip: (page - 1) * limit, take: limit });
  }

  findOne(id: number): Promise<User> {
    return this.repo.findOneByOrFail({ id });
  }

  create(dto: CreateUserDto): Promise<User> {
    return this.repo.save(this.repo.create(dto));
  }
}
```

### Custom Providers

```typescript
// Value provider
{ provide: "API_KEY", useValue: process.env.API_KEY }

// Factory provider
{ provide: "DATABASE", useFactory: (config: ConfigService) => createConnection(config.dbUrl), inject: [ConfigService] }

// Class provider
{ provide: "LOGGER", useClass: WinstonLogger }
```

## DTOs and Validation

```typescript
import { IsString, IsEmail, IsOptional, MinLength, IsInt, Min } from "class-validator";
import { Type } from "class-transformer";

export class CreateUserDto {
  @IsString()
  @MinLength(2)
  name: string;

  @IsEmail()
  email: string;

  @IsOptional()
  @IsString()
  bio?: string;
}

export class PaginationDto {
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page: number = 1;
}
```

### ValidationPipe

```typescript
// main.ts — enable globally
app.useGlobalPipes(new ValidationPipe({
  whitelist: true,          // Strip unknown properties
  forbidNonWhitelisted: true, // Throw on unknown properties
  transform: true,          // Auto-transform types
}));
```

## Guards

```typescript
import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";

@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  canActivate(context: ExecutionContext): boolean {
    const req = context.switchToHttp().getRequest();
    const token = req.headers.authorization?.replace("Bearer ", "");
    if (!token) return false;
    try {
      req.user = this.jwtService.verify(token);
      return true;
    } catch {
      return false;
    }
  }
}

// Usage
@Get("me")
@UseGuards(JwtAuthGuard)
getMe(@Request() req) { return req.user; }

// Global guard
app.useGlobalGuards(new JwtAuthGuard(jwtService));
```

## Pipes

```typescript
import { PipeTransform, Injectable, ArgumentMetadata, BadRequestException } from "@nestjs/common";

// Transform pipe
@Injectable()
export class ParseIntPipe implements PipeTransform<string, number> {
  transform(value: string, metadata: ArgumentMetadata): number {
    const val = parseInt(value, 10);
    if (isNaN(val)) throw new BadRequestException("Invalid number");
    return val;
  }
}

// Usage
@Get(":id")
findOne(@Param("id", ParseIntPipe) id: number) { /* ... */ }
```

## Interceptors

```typescript
import { Interceptor, CallHandler, ExecutionContext, Injectable } from "@nestjs/common";
import { map, Observable } from "rxjs";

@Injectable()
export class TransformInterceptor implements Interceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    return next.handle().pipe(
      map(data => ({ data, timestamp: Date.now() })),
    );
  }
}

// Usage
@Get()
@UseInterceptors(TransformInterceptor)
findAll() { return this.service.findAll(); }
```

## Exception Filters

```typescript
import { ExceptionFilter, Catch, ArgumentsHost, HttpException } from "@nestjs/common";

@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const res = ctx.getResponse();
    const status = exception.getStatus();

    res.status(status).json({
      statusCode: status,
      message: exception.message,
      timestamp: new Date().toISOString(),
    });
  }
}

// Usage
@UseFilters(HttpExceptionFilter)
export class AppController {}

// Global
app.useGlobalFilters(new HttpExceptionFilter());
```

## Middleware

```typescript
import { Injectable, NestMiddleware } from "@nestjs/common";
import { Request, Response, NextFunction } from "express";

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    console.log(`${req.method} ${req.url}`);
    next();
  }
}

// Register in module
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(LoggerMiddleware).forRoutes("*");
  }
}
```

## TypeORM Integration

```typescript
// app.module.ts
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: "postgres",
      host: "localhost",
      port: 5432,
      database: "mydb",
      autoLoadEntities: true,
      synchronize: true, // Dev only
    }),
    TypeOrmModule.forFeature([User]),
  ],
})
export class AppModule {}

// Entity
@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column({ unique: true })
  email: string;
}
```

## Prisma Integration

```typescript
@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() { await this.$connect(); }
}

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  findAll() { return this.prisma.user.findMany(); }
  create(dto: CreateUserDto) { return this.prisma.user.create({ data: dto }); }
}
```

## Testing

```typescript
import { Test, TestingModule } from "@nestjs/testing";

describe("UsersController", () => {
  let controller: UsersController;
  let service: UsersService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UsersController],
      providers: [{ provide: UsersService, useValue: mockUserService }],
    }).compile();

    controller = module.get(UsersController);
    service = module.get(UsersService);
  });

  it("returns users", async () => {
    jest.spyOn(service, "findAll").mockResolvedValue([{ id: 1, name: "Alice" }]);
    expect(await controller.findAll("1")).toEqual([{ id: 1, name: "Alice" }]);
  });
});
```

## WebSockets

```typescript
import { WebSocketGateway, SubscribeMessage, MessageBody, ConnectedSocket } from "@nestjs/websockets";

@WebSocketGateway({ cors: true })
export class ChatGateway {
  @SubscribeMessage("message")
  handleMessage(
    @MessageBody() data: string,
    @ConnectedSocket() client: Socket,
  ): string {
    return `Echo: ${data}`;
  }
}
```

## See Also

- [NestJS Documentation](https://docs.nestjs.com/)
- [NestJS Fundamentals](https://docs.nestjs.com/fundamentals/custom-providers)
- [NestJS GitHub](https://github.com/nestjs/nest)
- [TypeORM Documentation](https://typeorm.io/)
