import { Module } from '@nestjs/common';
import { AccessoryService } from './v1/accessory.service';
import { AccessoryRepository } from './v1/accessory.repository';
import { PrismaService } from 'src/prisma/v1/prisma.service';
import { AccessoryController } from './v1/accessory.controller';

@Module({
  controllers: [AccessoryController],
  providers:[AccessoryService, AccessoryRepository , PrismaService]
})
export class AccessoryModule {}
