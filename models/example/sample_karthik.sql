select PLAYERID from HOCKEYDB.HOCKEY.GOALIES left join HOCKEYDB.HOCKEY.SCORING 
using(PLAYERID)
---g.PLAYERID = s.PLAYERID  
