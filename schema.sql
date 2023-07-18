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