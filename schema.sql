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


CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE
);