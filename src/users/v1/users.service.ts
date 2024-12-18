import { BadRequestException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/v1/prisma.service';
import { UsersRepository } from './users.repository';
import { AttributesDto } from '../dto/attributes.dto';
import { PreferencesDto } from '../dto/preferences.dto';
import { AccessoryDto } from '../dto/accessory.dto';

export type User = {
    // username: string;
    email: string;
    userId: string;
};

type FindUserId = { userId:string }


@Injectable()
export class UsersService {
    constructor(private userRepository:UsersRepository) {}
    async findUserIdByAuth(authId:string): Promise<FindUserId | undefined> {
        const user = await this.userRepository.findUserIdByAuth(authId);
        return user;
    }

    async AddUserAttributes(input: AttributesDto){
        return this.userRepository.AddUserAttributes(input);
    }
    
    async AddUserPreferences(input: PreferencesDto){
        return this.userRepository.AddUserPreferences(input);
    }
    
    async AddAccessory(input: AccessoryDto){
        return this.userRepository.AddAccessory(input);
    }
}
