select
  h.hacker_id, h.name, t.total_challenges
from
  (select hacker_id, count(hacker_id) as total_challenges from challenges group by hacker_id) t
  inner join hackers h on t.hacker_id = h.hacker_id
group by
  h.hacker_id, h.name
having
      t.total_challenges = (select max(v.created_num) from (select count(hacker_id) as created_num from challenges group by hacker_id) v) 
  or  t.total_challenges in (select uq.created_num
                            from (select hacker_id, count(hacker_id) as created_num from challenges group by hacker_id) uq
                            group by uq.created_num
                            having count(uq.created_num) = 1)
order by
  t.total_challenges desc, h.hacker_id;

/* memo
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
이걸 이렇게 처리할 수 있다니... 최악은 O(N)비교지만 심플
*/
