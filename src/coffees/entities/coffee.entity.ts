import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Flavor } from './flavor.entity';

// Each entity class represents a SQL table.
// By default, typeORM will name the SQL table based on our class name
// in lowercase. So in this example, the SQL table generated will be 'coffee', in lowercase.
// If you want to use a different table name for your entity, you can
// pass a string into the @Entity() decorator. E.g. @Entity('coffees').
@Entity()
export class Coffee {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  brand: string;

  @JoinTable()
  @ManyToMany((type) => Flavor, (flavor) => flavor.coffees, {
    cascade: true, // ['insert']
  })
  flavors: Flavor[];
}
