DROP TABLE IF EXISTS `Combined_tripdata_2022.combined_data`;

CREATE TABLE IF NOT EXISTS`Combined_tripdata_2022.combined_data` AS(
  SELECT * FROM `Combined_tripdata_2022.Jan`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.Feb`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.March`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.April`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.May`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.June`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.July`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.August`
  UNION ALL
   SELECT * FROM `Combined_tripdata_2022.September`
  UNION ALL
  SELECT * FROM `Combined_tripdata_2022.October`
  UNION ALL
  SELECT * FROM `Combined_tripdata_2022.November`
  UNION ALL
  SELECT * FROM `Combined_tripdata_2022.December`
);


SELECT COUNT(*)
FROM `Combined_tripdata_2022.combined_data`;