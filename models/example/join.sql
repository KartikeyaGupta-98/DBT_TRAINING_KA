select g.*
from hockeydb.hockey.goalies g
left join
    hockeydb.hockey.goalies  s 
on g.PLAYERID = s.PLAYERID  
