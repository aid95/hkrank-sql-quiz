select h.hacker_id, h.name, t.total_score
from
    (select sub.hid as id, sum(sub.max_score) as total_score
    from
        (select
            s.hacker_id as hid, s.challenge_id as cid, max(s.score) as max_score
        from
            submissions s
        group by hid, cid having 0 < max_score) sub
    group by sub.hid) t
    inner join hackers h on t.id = h.hacker_id
order by t.total_score desc, h.hacker_id asc;
