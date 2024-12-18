import { ApiProperty } from "@nestjs/swagger";

import { Color } from "@prisma/client";
import { Size } from "@prisma/client";
export class AccessoryDto{
    @ApiProperty()
    userId:string;
    @ApiProperty()
    accessoryName:string;
    @ApiProperty()
    imageUrl:string;
    @ApiProperty()
    accessoryType:string;
    @ApiProperty()
    accessoryColor:Color;
    @ApiProperty()
    accessorySize:Size;

}