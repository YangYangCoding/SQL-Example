-- --  COMP9311 Database Systems
-- --  Assignment 2
-- --  Written By:    Yang Yang
-- --  ID:    3431427
-- --  Date:    1st, May, 2013





-- Q1
-- print the names of all people staying in Ambassador hotel on 18-Aug-2007.
-- If a team stays in a hotel, it means all of its members stay in the hotel.
-- If a person checked-in on 18th or checked-out on 18th, we will not include his/her name.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view A(team) as
select t.name from teams t 
where t.staysAt = 'Ambassador'
and t.checkIn < '18-Aug-2007' 
and t.checkOut > '18-Aug-2007';

create or replace view Q1(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select p.name from players p,A a
where p.team = a.team
union all
select o.name from officials o 
where o.staysAt = 'Ambassador'
and o.checkIn < '18-Aug-2007'
and o.checkOut > '18-Aug-2007'
union all 
select f.name from fans f 
where f.staysAt = 'Ambassador'
and f.checkIn < '18-Aug-2007'
and f.checkOut > '18-Aug-2007'
;


--Q2
-- Find the players who are not captain of a team and has at least two fans. Here if a person likes a team, we assume that
-- he likes both of the players 


-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view B(fan,player) as
select fan, p.name from players p,favTeams ft
where p.team = ft.team
union
select * from favPlayers;

create or replace view Q2(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select player from B
group by player
having count(fan) >= 2
minus
select captain from teams
;


-- Q3
-- For each player who has lost a match in his favorite stadium, find how many times he lost in his favorite stadium


-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view C(loserteam,stadium) as
(select home,stadium from matches
where home != winner)
union all
(select away,stadium from matches
where away != winner)
;

create or replace view D(player,stadium) as
select p.name,c.stadium from players p, C c
where p.team = c.loserteam
;

create or replace view E(name,stadium) as
select fs.player,fs.stadium from favStadiums fs,D d
where fs.player = d.player
and fs.stadium = d.stadium
;

create or replace view Q3(name,lost) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select name,count(stadium) as lost from E
group by name
;


-- Q4
-- Find the names of people who have stayed for maximum number of days in some hotel.
-- If the answer includes more than one person, includ all


-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view FF(name,checkin,checkout) as
select name,checkIn,checkOut from fans
union all
select name,checkIn,checkOut from officials
union all
select p.name,t.checkIn, t.checkOut from players p,teams t
where p.team = t.name 
;
create or replace view Q4(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ff1.name from FF ff1
where ff1.name not in
(select ff1.name from FF ff1,FF ff2
where (ff1.checkOut - ff1.checkIn) < (ff2.checkOut - ff2.checkIn))
and ff1.checkIn  is not NULL
and ff1.checkOut is not NULL
;


-- Q5
-- Name of the players who have lost at least 2 matches


-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view GG(loseteam) as
(select home from matches
where home != winner)
union all
(select away from matches
where away != winner)
;

create or replace view HH(losename) as
select p.name from players p,GG gg
where p.team = gg.loseteam
;

create or replace view Q5(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select losename as name from HH
group by losename
having count(losename) >= 2
;


-- Q6
-- For all officials, print the hotel they manage and print the numbers of matches they refereed. If an official was not
-- a referee in any match, print zero. Similarly if an official is not a manager of any hotel, print '-'

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view II1(SID) as
select o.staffID  from officials o, matches m
where o.staffID = m.referee
;

create or replace view II2(SID,referee) as
select ii1.SID, count(ii1.SID) from II1 ii1
group by ii1.SID
;
 
create or replace view II3(official,hotel,staffID) as
select o.name, nvl(h.name,'-'),o.staffID from officials o left join hotels h
on o.staffID = h.manager
;

create or replace view Q6(official,hotel,matchesRefereed) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ii3.official, ii3.hotel, nvl(ii2.referee,0) from II3 ii3 left join II2 ii2
on ii2.SID = ii3.staffID
;



-- Q7
-- For each team Display the number of matches they played as home team, number of matches they played as
-- away team and number of matches they won. Place zero for NULL.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view LL1(home) as
select m.home from teams t, matches m
where t.name = m.home
;

create or replace view LL2(team, home) as
select ll1.home, count(ll1.home) from LL1 ll1
group by ll1.home
;

create or replace view LL3(away) as
select m.away from teams t, matches m
where t.name = m.away
;

create or replace view LL4(team, away) as
select ll3.away, count(ll3.away) from LL3 ll3
group by ll3.away
;

create or replace view LL5(win) as
select m.winner from teams t, matches m
where t.name = m.winner
;

create or replace view LL6(team, win) as
select ll5.win, count(ll5.win) from LL5 ll5
group by ll5.win
;

create or replace view LL7(team, home) as
select t.name, nvl(ll2.home,0) from teams t left join LL2 ll2 
on t.name = ll2.team
;

create or replace view LL8(team, home,away) as
select ll7.team, ll7.home, nvl(ll4.away,0) from LL7 ll7 left join LL4 ll4 
on ll7.team = ll4.team
;

create or replace view Q7(team,home,away,won) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ll8.team, ll8.home, ll8.away, nvl(ll6.win,0) from LL8 ll8 left join LL6 ll6 
on ll8.team = ll6.team
;

-- Q8
-- For each team that played at least one match, find the percentage of matches they lost.Any team that doesn't play any match 
-- must not be included.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view J1(lose) as
(select home from matches
where home != winner)
union all
(select away from matches
where away != winner)
; 

create or replace view J2(total) as
select home from matches
union all
select away from matches
; 

create or replace view J3(name,match) as
select j1.lose, count(j1.lose) from J1 j1
group by j1.lose
; 

create or replace view J4(name,match) as
select j2.total, count(j2.total) from J2 j2
group by j2.total
; 

create or replace view J5(name,tmatch,lmatch) as
select j4.name,j4.match,nvl(j3.match,0) from 
J4 j4 left join J3 j3
on j4.name = j3.name
;

create or replace view Q8(name,lost) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select j5.name, to_char((j5.lmatch/j5.tmatch*100),'900.00') || '%' as lost from J5 j5
order by lost
;

-- Q9
-- Find the stadiums that are liked by every team. If even one of the players in a team likes the stadium,
-- we assume that the team likes the stadium 

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view KK(team,stadium) as
select p.team, fs.stadium from players p, favStadiums fs
where p.name = fs.player
;

create or replace view KA(name,likednum) as
select kk.stadium, count(distinct(kk.team)) from KK kk
group by kk.stadium
;

create or replace view Q9(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ka.name from KA ka
where ka.likednum = 
      (select count(distinct(t.name)) from teams t)
;


-- Q10
-- Find all the matches where favorite players of "Grace" are playing opposite to each other.
-- If a fan likes a team, then both players of that team are considered his/her favorite players.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view MM(team) as
select p.team from players p, favTeams ft
where ft.fan = 'Grace'
and ft.team = p.team
union
select p.team from players p, favPlayers fp
where fp.fan = 'Grace'
and fp.player = p.name
;

create or replace view MA(matchID) as
select m.ID from matches m, MM mm
where m.home = mm.team
;

create or replace view MB(matchID) as
select m.ID from matches m, MM mm
where m.away = mm.team
;

create or replace view Q10(matchID) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ma.matchID from MA ma, MB mb
where ma.matchID = mb.matchID
;

-- Q11
-- Suppose a fan goes to see every match of his/her favorite teams or players. For each fan, find the maximum capacity of the stadiums where he/she saw some match.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view NN(fan,team) as 
select fp.fan, p.team from players p, favPlayers fp
where fp.player = p.name
union
select ft.fan, ft.team from favTeams ft
;

create or replace view NA(fan,stadium) as
select nn.fan, m.stadium from NN nn, matches m
where nn.team = m.home
or nn.team = m.away
;

create or replace view NB(fan,capacity) as
select na.fan, s.capacity from NA na, stadiums s
where na.stadium = s.name 
;

create or replace view Q11(fan,maxCapacity) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select nb.fan, max(nb.capacity) from NB nb
group by nb.fan
;

-- Q12
-- Find all matches where a referee is a person that also provides medical services to both of the teams


-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view OA(SID,referee,MID,home,away) as
select o.staffID, o.name, m.ID, m.home, m.away from officials o, matches m
where o.staffID = m.referee
;

create or replace view OB(referee,MID) as
select oa.referee, oa.MID from OA oa, medicalServices ms
where oa.SID = ms.official
and oa.home = ms.team
;

create or replace view OC(referee,MID) as
select oa.referee, oa.MID from OA oa, medicalServices ms
where oa.SID = ms.official
and oa.away = ms.team
;

create or replace view Q12(matchID,home,away,referee) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select ob.MID,m.home,m.away,ob.referee from OB ob, OC oc, matches m
where ob.referee = oc.referee
and ob.MID = oc.MID
and ob.MID = m.ID
;

-- Q13
-- Find all fan pairs x,y such that all players that x likes, person y also likes and all players that y likes person x also likes.
-- If a person x likes a team, we assume that he likes both of the players in that team. Your query should output the pair(x,y) only 
-- once. In other words, if (x,y) appears in the results the pair (y,x) must not appear in results*/

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view PA(fan,fname) as
select ft.fan, p.name from favTeams ft, players p
where ft.team = p.team
union
select fp.fan, fp.player from favPlayers fp
; 

create or replace view PB(fan,fnum) as
select pa.fan, count(pa.fan) from PA
group by pa.fan
;

create or replace view PC(fan1,fan2) as
select pb1.fan, pb2.fan from PB pb1, PB pb2
where pb1.fnum = pb2.fnum
and pb1.fan < pb2.fan
;

create or replace view PD(fan1,fname) as
select pc.fan1,pa.fname from PC pc,PA pa
where pc.fan1 = pa.fan
minus
select pc.fan1,pa.fname from PC pc,PA pa
where pc.fan2 = pa.fan
;

create or replace view Q13(fan1,fan2) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select * from PC pc
where pc.fan1 not in(select pd.fan1 from PD pd)
;

-- Q14
-- Find stadiums with four largest capacities. If two or more stadiums have same capacity we must include those in results.

-- create any other views here if you need them. Use "create or replace view" instead of "create view".
create or replace view R(name,capa) as
select s.name,s.capacity from stadiums s 
where capacity is not null
;

create or replace view RA(name,capa) as
select r.name,r.capa from R r
order by r.capa desc
;

create or replace view RB(name,capa) as
select ra.name,ra.capa from RA ra
where rownum < 5
;

create or replace view RC(sname,scapa) as
select rb.name,rb.capa from RB rb
where rb.capa = (select min(rb.capa) from RB rb)
;

create or replace view Q14(name) as -- DO NOT CHANGE ANYTHING ON THIS LINE
-- write your queries here
select rb.name from RB rb
union
select r.name from R r, RC rc
where r.name != rc.sname
and r.capa = rc.scapa
;

