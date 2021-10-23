import { Column, Entity, Index, PrimaryGeneratedColumn } from 'typeorm';

// In more advanced cases, we may want to define composite indexes that contain
// multiple columns.
// E.g. An index that contains multiple columns is defined in the array. In this case,
// we apply the @Index decorator to the class itself and pass in an array of column names.
@Index(['name', 'type'])
@Entity()
export class Event {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  type: string;

  // E.g. If a common search event is retrieving an event based on its name,
  // to help speed up this search we can define an index on the name column using
  // the @Index() decorator.
  @Index()
  @Column()
  name: string;

  @Column('json')
  payload: Record<string, any>;
}

// Indexes are special lookup tables that our database search engine can use to speed
// up data retrieval.
// You should use indexes whenever performance is vitally important for a certain entity.
