SELECT
    ct.NAME
FROM
    CITY ct
    LEFT JOIN COUNTRY cty ON ct.COUNTRYCODE = cty.CODE
WHERE
    cty.CONTINENT = 'Africa';
