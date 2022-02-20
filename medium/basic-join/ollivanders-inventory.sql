select wd.id, p.age, wd.coins_needed, wd.power
from
  (select code, power, min(coins_needed) as min_coins
  from wands
  group by code, power) m
  inner join wands wd 
    on m.code = wd.code and m.power = wd.power and m.min_coins = wd.coins_needed
  inner join wands_property p 
    on p.code = wd.code
where
  p.is_evil = 0
order by
  wd.power desc, p.age desc;
