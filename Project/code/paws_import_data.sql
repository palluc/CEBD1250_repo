
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\breed_labels.csv' 
INTO TABLE breed 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\color_labels.csv' 
INTO TABLE color
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lookup.csv' 
INTO TABLE lookup 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\state_labels.csv' 
INTO TABLE state
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\state_labels.csv' 
INTO TABLE rescue
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(rescue_ID,shelter_name,address1,city,state,zip_code,hours,phone,location,pets_inhouse,space_avail,comments) 
;
#(title,@expired_date,amount)
#SET expired_date = STR_TO_DATE(@expired_date, '%m/%d/%Y');



LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pet_rescues.csv' 
INTO TABLE pet
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ptype,name,age,breed1,breed2,gender,color1,color2,color3,
maturitysize,fulllength, @dummy, @dummy, @dummy, @dummy, quantity,fee,state,rescue_ID,videoAmt,description,pet_ID,photoAmt)
SET enter_date = SYSDATE();

