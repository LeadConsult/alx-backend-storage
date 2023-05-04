--This SQL script selects the origin column and the sum
-- of fans for each origin from the metal_bands table.
-- The results are then grouped by origin and ordered
-- by the total number of fans in descending order.

SELECT origin, SUM(fans) as nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
