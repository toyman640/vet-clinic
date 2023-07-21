/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN;
  UPDATE animals
  set species = 'digimon'
  where name like '%mon';
  update animals
  set species = 'pokemon'
  where species not like = '%mon';
  select * from animals;
COMMIT;
select * from animals;


BEGIN;
 DELETE FROM animals;
 ROLLBACK;
COMMIT;

BEGIN;
  DELETE FROM animals
  WHERE date_of_birth > '2022-01-01';
  SAVEPOINT sp_first;
  UPDATE animals
  SET weight_kg = weight_kg * 1;
  ROLLBACK TO sp_first;
  UPDATE animals
  SET weight_kg = weight_kg * 1
  WHERE weight_kg < 0;
COMMIT;


select count(*) as total_animals from animals;
select count(*) as non_escape_animals from animals where escape_attempts = 0;
select avg(weight_kg) as average_weight from animals;
select neutered, sum(escape_attempts) as total_escapes from animals group by neutered order by total_escapes desc limit 1;
select species, min(weight_kg) as min_weight, max(weight_kg) as max_weight from animals group by species;
select species, avg(escape_attempts) as avg_escapes from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;


SELECT animals.name as animal_name FROM animals JOIN owners on animals.owner_id = owners_id WHERE owners_full_name = 'Melody Pond';
SELECT animals.name as animal_name FROM animals JOIN species on animals.species_id = species_id WHERE species.name = 'Pokemon';
select owners.full_name, animals.name as animal_name from owners left join animals on owners.id = animals.owner_id;
select species.name, count(animals.id) as animal_count from species left join animals on species.id = animals.species_id group by species.name;
select animals.name as jennifer_animals from animals join owners on animals.owner_id = owners.id join species on animals.species_id = species.id where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';
select animals.name as dean_animals_no_escape from animals join owners on animals.owner_id = owners.id where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;
select owners.full_name, count(animals.id) as most_animals from owners left join animals on owners.id = animals.owner_id group by owners.full_name order by most_animals desc limit 1;
.