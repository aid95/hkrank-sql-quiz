select
    name
from
    students
where
    75 < marks
order by
    substr(name, -3), id asc;
