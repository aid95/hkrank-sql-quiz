select
    city
from
    station
where
    city regexp('^[aeiou]') and city regexp('[aeiou]$');
