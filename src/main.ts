import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  const config = new DocumentBuilder()
    .setTitle('FX Main Backend')
    .setDescription('This is a api docs for FX Backend')
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const documentFactory = () => SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('docs', app, documentFactory);

  // Cors
  // if (corsConfig?.enabled) {
  //   app.enableCors({
  //     origin: true,
  //   });
  // }

  await app.listen( 8000 );
}
bootstrap();
