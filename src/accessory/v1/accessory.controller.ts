import { Body, Controller, Post } from "@nestjs/common";
import { ApiBody } from "@nestjs/swagger";
import { AccessoryChatDto } from "../dto/AccessoryChat.dto";
import { AccessoryService } from "./accessory.service";

@Controller('accessory')
export class AccessoryController{
 constructor(private accessoryService: AccessoryService){} 
    
    async AddAccessory(){
        return 'Add Accessory';
    }

    @ApiBody({type: AccessoryChatDto})
    @Post('create-accessory-chat')
    async CreateAccessoryChat(@Body() input: AccessoryChatDto){
        console.log('Create Accessory Chat');
        return this.accessoryService.CreateAccessoryChat(input);
    }
}