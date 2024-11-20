import { Get, Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { UsersModule } from 'src/users/users.module';
import { JwtModule } from '@nestjs/jwt';
import { JWT_SECRET } from 'src/configs/jwt-secret';

@Module({
  providers: [AuthService],
  controllers: [AuthController],
  imports:[
    UsersModule,
    JwtModule.register({
      global: true,
      secret: JWT_SECRET, 
      signOptions: { expiresIn: '1d' }, //30s 1m 1h 1d 1w 1y
    }),
  ]
})
export class AuthModule {
  
}
