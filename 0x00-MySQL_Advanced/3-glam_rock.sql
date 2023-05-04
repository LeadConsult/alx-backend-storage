--This SQL query selects the band name and calculates the lifespan
-- of each metal band that has a style containing the string 'Glam rock'. 

SELECT band_name, (IFNULL(split, 2022) - formed)
AS lifespan FROM metal_bands WHERE style LIKE '%Glam rock%' ORDER BY lifespan DESC;