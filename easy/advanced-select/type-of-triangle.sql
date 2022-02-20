select
    case
        when (a + b <= c) or (a + c <= b) or (b + c <= a) then 'Not A Triangle' 
        when (a = b) AND (b = c) THEN 'Equilateral' 
        when (a = b) OR (b = c) OR (a = c) THEN 'Isosceles' 
        ELSE 'Scalene' 
    end
from triangles;
