select
    distinct city
from
    station
where
    not (city regexp('^[aeiou]') and city regexp('[aeiou]$'));
