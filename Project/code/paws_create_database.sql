# Create MySQL Database Users
CREATE USER 'lpalucci'@'userhostname' IDENTIFIED BY 'project';

# Create MySQL database
CREATE IF NOT EXISTS DATABASE PAWSWARE;
Use PAWSWARE;

# Grant MySQL Database user access using privileges.
GRANT ALL PRIVILEGES ON pawsware.* TO lpalucci@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE ON pawsware.* TO lpalucci@localhost;
GRANT ALL ON *.* TO 'lpalucci'@'localhost';

# ----------------------------------------------------------------------------

-- -----------------------------------------------------
-- Schema PAWSWARE
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS PAWSWARE;
CREATE SCHEMA IF NOT EXISTS PAWSWARE DEFAULT CHARACTER SET utf8 ;
USE pawsware

# -----------------------------------------------------
# Table pawsware.breed
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.breed;

CREATE TABLE breed (
breed_ID     INT  NOT NULL primary key,
btype        INT  NOT NULL,
breedname    VARCHAR(50) NOT NULL
);

# -----------------------------------------------------
# Table pawsware.color
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.color;

CREATE TABLE color (
color_ID     INT NOT NULL primary key,
colorname    VARCHAR(50) NOT NULL
);

# -----------------------------------------------------
# Table pawsware.lookup
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.lookup;

CREATE TABLE lookup (
lookup_code VARCHAR(20) NOT NULL,
code        VARCHAR(10) NOT NULL,
value       VARCHAR(100),
UNIQUE (lookup_code, code)
);


# -----------------------------------------------------
# Table pawsware.state
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.state;

CREATE TABLE state (
state_ID     VARCHAR(10) NOT NULL primary key,
statename    VARCHAR(50) NOT NULL
);


# -----------------------------------------------------
# Table pawsware.rescue
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.rescue;

CREATE TABLE rescue (
rescue_ID      VARCHAR(50) NOT NULL primary key,
shelter_name   VARCHAR(100) NOT NULL,
address1       VARCHAR(100) NULL,
city           VARCHAR(50)  NULL,
state          VARCHAR(10)  NULL,
zip_code       VARCHAR(10)  NULL,
hours          VARCHAR(30)  NULL,
phone          VARCHAR(15)  NULL,
location       VARCHAR(20)  NULL,
pets_inhouse   INT          NULL,
space_avail    INT          NULL,
comments      VARCHAR(2000) NULL
);


# -----------------------------------------------------
# Table pawsware.pet
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.pet;

CREATE TABLE pet ( 
pet_ID         VARCHAR(10)   primary key,
ptype          VARCHAR(10)   NOT NULL,
name           VARCHAR(100)  NULL,
age            INT           NULL,
breed1         INT           NOT NULL,
breed2         INT           NULL,
gender         VARCHAR(10)   NOT NULL,
color1         INT           NOT NULL,
color2         INT           NULL,
color3         INT           NULL,
maturitysize   VARCHAR(10)   NULL,
furlength      VARCHAR(10)   NULL,
quantity       INT           NULL,
fee            FLOAT(8,2)    NULL,
state          VARCHAR(10)   NOT NULL,
rescue_ID      VARCHAR(50)   NOT NULL,
videoAmt       INT           NULL,
photoAmt       INT           NULL,
enter_date     date          NOT NULL,
adopt_date     date          NULL,
adoptionspeed  VARCHAR(10)   NULL,  
description    VARCHAR(2000) NULL,

CONSTRAINT c1_pet_pettype CHECK (ptype IN (select code from lookup where lookup_code = 'PETTYPE')),
FOREIGN KEY (breed1) REFERENCES breed (breed_ID),
FOREIGN KEY (breed2) REFERENCES breed (breed_ID),
CONSTRAINT c1_pet_gender CHECK (gender IN (select code from lookup where lookup_code = 'GENDER')),
FOREIGN KEY (color1) REFERENCES color (color_ID),
FOREIGN KEY (color2) REFERENCES color (color_ID),
FOREIGN KEY (color3) REFERENCES color (color_ID),
CONSTRAINT c1_pet_maturitysize CHECK (maturitysize IN (select code from lookup where lookup_code = 'MATURITY')),
CONSTRAINT c1_pet_furlength CHECK (furlength IN (select code from lookup where lookup_code = 'LENGTH')),
CONSTRAINT c1_pet_adoptionspeed CHECK (adoptionspeed IN (select code from lookup where lookup_code = 'ADOPTIONSPEED')),
FOREIGN KEY (state) REFERENCES state(state_id),
FOREIGN KEY (Rescue_ID) REFERENCES rescue(Rescue_ID)
);


# -----------------------------------------------------
# Table pawsware.diagnosis
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.diagnosis;

CREATE TABLE diagnosis (
pet_ID       VARCHAR(10) NOT NULL,
vaccinated   VARCHAR(10)   NULL,
dewormed     VARCHAR(10)   NULL,
sterilized   VARCHAR(10)   NULL,
health       VARCHAR(10)   NULL,
sentiment    JSON          DEFAULT NULL,
comments     VARCHAR(2000) NULL,

CONSTRAINT c1_diagnosis_vaccinated CHECK (ptype IN (select code from lookup where lookup_code = 'YESNO')),
CONSTRAINT c1_diagnosis_dewormed CHECK (ptype IN (select code from lookup where lookup_code = 'YESNO')),
CONSTRAINT c1_diagnosis_sterilized CHECK (ptype IN (select code from lookup where lookup_code = 'YESNO')),
CONSTRAINT c1_diagnosis_health CHECK (ptype IN (select code from lookup where lookup_code = 'HEALTH')),
FOREIGN KEY (pet_ID) REFERENCES pet(pet_ID)
);

# -----------------------------------------------------
# Table pawsware.image
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.image;

CREATE TABLE image (
pet_ID     VARCHAR(10)   NOT NULL ,
image_ID   VARCHAR(10)   NOT NULL primary key,
imagepath  VARCHAR(1024) NULL,
sentiment  JSON          NULL,
FOREIGN KEY (pet_ID) REFERENCES pet(pet_ID)
);

# -----------------------------------------------------
# Table pawsware.petfact  (FACT table)
# -----------------------------------------------------

DROP TABLE IF EXISTS PAWSWARE.petfact;

CREATE TABLE petfact (
pet_ID     VARCHAR(10)   NOT NULL ,
breed_ID   INT           NULL,
image_ID   VARCHAR(10)   NULL,
state      VARCHAR(10)   NULL,
enter_date     date      NOT NULL,
adopt_date     date          NULL,
adoptionspeed  VARCHAR(10)   NULL, 
time_elapsed   INT       NULL
);

