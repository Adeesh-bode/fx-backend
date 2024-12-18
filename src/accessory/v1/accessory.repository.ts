import { BadRequestException } from "@nestjs/common";
import { AccessoryChatDto } from "../dto/AccessoryChat.dto";
import { PrismaService } from "src/prisma/v1/prisma.service";

export class AccessoryRepository {
    constructor(private prismaService: PrismaService) {}

    // async createAccessory(accessoryDto) {
    //     return accessoryDto;
    // }
    // async getAccessoryById(accessoryId) {
    //     return accessoryId;
    // }
    // async getAccessoryByUserId(userId) {
    //     return userId;
    // }
    // async deleteAccessory(accessoryId) {
    //     return accessoryId;
    // }
    // async updateAccessory(accessoryId, accessoryDto) {
    //     return accessoryDto;
    // }
    // async getAccessoryChatById(accessoryChatId) {
    //     return accessoryChatId;
    // }
    async createAccessoryChat(input:AccessoryChatDto) {
        console.log("Input Data: ", input);
        console.log("OK");

        // const accessory = await this.prismaService.accessory.findUnique({
        //     where: { id: input.accessoryId }
        // });
    
        // const user1 = await this.prismaService.user.findUnique({
        //     where: { id: input.initiateUserId }
        // });
    
        // const user2 = await this.prismaService.user.findUnique({
        //     where: { id: input.receiverUserId }
        // });
    
        // if (!accessory || !user1 || !user2) {
        //     throw new BadRequestException('Invalid accessory or user ID');
        // }
    

        try{
            const data = await this.prismaService.accessoryChat.create({
                data:{
                    accessoryId: input.accessoryId,
                    intiateUserId: input.initiateUserId,
                    receivedUserId: input.receiverUserId,
                    message: input.message
                }
            });
            return data;
        } catch (error) {
            console.log("Error: ", error);
        }
        return 'Unsuccessful';
    }
    // async deleteAccessoryChat(accessoryChatId) {
    //     return accessoryChatId;
    // }
    // async updateAccessoryChat(accessoryChatId, accessoryChatDto) {
    //     return accessoryChatDto;
    // }
}