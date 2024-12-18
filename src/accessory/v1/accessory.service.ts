import { Injectable } from "@nestjs/common";
import { AccessoryChatDto } from "../dto/AccessoryChat.dto";
import { AccessoryRepository } from "./accessory.repository";

@Injectable()
export class AccessoryService{
    constructor(private accessoryRepository : AccessoryRepository){}

    async AddAccessory(){
        return 'Add Accessory';
    }

    async CreateAccessoryChat(input: AccessoryChatDto){
        console.log('Create Accessory Chat');
        return this.accessoryRepository.createAccessoryChat(input);
    }
}