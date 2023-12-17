-- Data Exploration

-- Checking the data types of all the columns

SELECT column_name, data_type
FROM `Combined_tripdata_2022`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';


-- checking for null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
COUNT(*) - COUNT(started_at) started_at,
COUNT(*) - COUNT(ended_at) ended_at,
COUNT(*) - COUNT(start_station_name) start_station_name,
COUNT(*) - COUNT(start_station_id) start_station_id,
COUNT(*) - COUNT(end_station_name) end_station_name,
COUNT(*) - COUNT(end_station_id) end_station_id,
COUNT(*) - COUNT(start_lat) start_lat,
COUNT(*) - COUNT(start_lng) start_lng,
COUNT(*) - COUNT(end_lat) end_lat,
COUNT(*) - COUNT(end_lng) end_lng,
COUNT(*) - COUNT(member_casual) member_casual
FROM `Combined_tripdata_2022.combined_data`;


-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `Combined_tripdata_2022.combined_data`;


-- length of ride id

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows 
FROM `Combined_tripdata_2022.combined_data`
GROUP BY length_ride_id;


-- types of bikes

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `Combined_tripdata_2022.combined_data`
GROUP BY rideable_type;

-- started at, ended at - Timestamp -YYYY-MM-DD hh:mm::ss UTC

SELECT started_at, ended_at
FROM `Combined_tripdata_2022.combined_data`
LIMIT 10;

-- longer than a day

SELECT COUNT(*) AS longer_than_a_day
FROM `Combined_tripdata_2022.combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60
) >= 1440;

SELECT COUNT(*) AS less_than_a_minute
FROM `Combined_tripdata_2022.combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60
) <= 1;

-- start station name

SELECT DISTINCT start_station_name
FROM `Combined_tripdata_2022.combined_data`
ORDER BY start_station_name;

-- null values in station name or id

SELECT COUNT(ride_id) AS rows_with_start_station_null          -- 
FROM `Combined_tripdata_2022.combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;


SELECT DISTINCT end_station_name 
FROM `Combined_tripdata_2022.combined_data`
ORDER BY end_station_name;


SELECT COUNT(ride_id) AS rows_with_null_end_station
FROM `Combined_tripdata_2022.combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- null values in end lat or lng

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `Combined_tripdata_2022.combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL;

-- types of members

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `Combined_tripdata_2022.combined_data`
GROUP BY member_casual;
