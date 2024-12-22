import { BadRequestException, Injectable } from "@nestjs/common";
import { SignupDto } from "../dto/signup.dto";
import { PrismaService } from "src/prisma/v1/prisma.service";

type SignupResult = { userId: string; email: string;};

@Injectable()
export class AuthRepository{
    constructor(private prismaService:PrismaService) {}

    async findUserAuthByEmail(email: string) : Promise<{authId:string, email:string , password:string}|undefined> {
        const userAuth = await this.prismaService.userAuth.findFirst({
            where:{
                email: email
            }
        })

        if(!userAuth){
            throw new BadRequestException('User not found');
        }

        return {
            authId: userAuth.id,
            email: userAuth.email,
            password: userAuth.password
        }
    }

    async createUser(input: SignupDto): Promise<SignupResult|undefined> {

        const userExists = await this.prismaService.userAuth.findFirst({
            where:{
                email: input.email 
            }
        })

        if(userExists){
            throw new BadRequestException("User already exists");
        }

        // Fixme: Implement hash password here
        const userAuthData = await this.prismaService.userAuth.create({
            data:{
                email: input.email,
                password: input.password
            }
        })

        const userData = await this.prismaService.user.create({
            data:{
                name:input.name,
                authId: userAuthData.id
            }
        })

        return {
            userId: userData.id ,
            email: userAuthData.email,
            // token:'fake-token'
        }
    }
}