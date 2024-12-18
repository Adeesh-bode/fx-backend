import { Body, Controller, Post } from "@nestjs/common";
import { UsersService } from "./users.service";
import { ApiAcceptedResponse, ApiBody } from "@nestjs/swagger";
import { AttributesDto } from "../dto/attributes.dto";
import { PreferencesDto } from "../dto/preferences.dto";
import { AccessoryDto } from "../dto/accessory.dto";

@Controller('users')
export class UsersController{
    constructor(private userService:UsersService){}

    @ApiBody({type:AttributesDto})
    @ApiAcceptedResponse({description:'User attributes Added'})
    @Post('attributes')
    async AddUserAttributes(@Body() input:AttributesDto){
        console.log('input',input);
        return this.userService.AddUserAttributes(input);
    }
    
    @ApiBody({type:PreferencesDto})
    @ApiAcceptedResponse({description:'User Preference Added'})
    @Post('preferences')
    async AddUserPreferences(@Body() input:PreferencesDto){
        return this.userService.AddUserPreferences(input);
    }

    @ApiBody({type: AccessoryDto})
    @Post('add-accessory')
    async AddAccessory(@Body() input: AccessoryDto){
        return this.userService.AddAccessory(input);
    }
}