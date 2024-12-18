import { ApiProperty } from "@nestjs/swagger";

export class AccessoryChatDto{
    @ApiProperty()
    accessoryId:string;
    @ApiProperty()
    initiateUserId:string;
    @ApiProperty()
    receiverUserId:string;
    @ApiProperty()
    message:string;
}