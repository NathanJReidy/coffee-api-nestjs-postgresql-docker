import { Controller, Get, Post } from '@nestjs/common';

@Controller('coffees')
export class CoffeesController {
  @Get('flavors')
  findAll(): string {
    return 'This action returns all coffees';
  }
}
