import { BadRequestException, Injectable } from "@nestjs/common";
import { PrismaService } from "src/prisma/v1/prisma.service";
import { AttributesDto } from "../dto/attributes.dto";

import { Prisma } from '@prisma/client';
import { PreferencesDto } from "../dto/preferences.dto";
import { AccessoryDto } from "../dto/accessory.dto";

type findUserByEmail= { userId:string }
@Injectable()
export class UsersRepository {
  constructor(private prismaService: PrismaService) {}

  async validateUser(userId:string){
    const user = await this.prismaService.user.findUnique({
        where: {
          id: userId, 
        }
      });
  
      if (!user) {
        throw new BadRequestException('User not found');
      }
      return true;
  }
  async findUserIdByAuth(authId: string) :Promise<findUserByEmail | undefined> {
        
    const user = await this.prismaService.user.findFirst({
        where:{
            authId: authId
        }
    })

    if (!user) {
        return undefined;
    }

    return {
        userId: user.id,
    }
}
  

    async AddUserAttributes(input: AttributesDto){
        
        await this.validateUser(input.userId);
      
        await this.prismaService.userAttributes.create({
            data:{
                userId: input.userId,
                age: input.age,
                height:input.height,
                weight:input.weight,
                sizeTop: input.sizeTop,
                sizeBottom: input.sizeBottom
            }
        });
        return 'user preferences created';
    }

    async AddUserPreferences(input: PreferencesDto){
        await this.validateUser(input.userId);
        
        await this.prismaService.userPreference.create({
            data:{
                userId: input.userId,
                preferedColor: input.color,
                type: input.type,
            }
        });
        return 'user preferences created for userId'+ input.userId ;
    }

    async AddAccessory(input: AccessoryDto){
        await this.validateUser(input.userId);
        const data = await this.prismaService.accessory.create({
            data:{
                userId: input.userId,
                accessoryName: input.accessoryName,
                imageUrl: input.imageUrl,
                accessoryType: input.accessoryType,
                accessoryColor: input.accessoryColor,
                accessorySize: input.accessorySize
            }
        });
        return 'accessory added with id'+ data.id;
    }

}