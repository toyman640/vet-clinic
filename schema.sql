/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(225),     
  date_of_birth date,  
  escape_attempts int,
  neutered boolean,    
  weight_kg decimal
);

ALTER table animals ADD COLUMN species VARCHAR(255) DEFAULT 'unspecified';


ALTER table animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER table animals DROP COLUMN species;
ALTER table animals ADD COLUMN species_Id int references species(id);
ALTER table animals ADD COLUMN owner_Id int references owners(id);