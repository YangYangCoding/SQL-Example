set feedback on
prompt dropping tables ...
set feedback off



drop table teams cascade constraints purge;
drop table players cascade constraints purge;
drop table officials cascade constraints purge;
drop table hotels cascade constraints purge;
drop table fans cascade constraints purge;
drop table stadiums cascade constraints purge;
drop table matches cascade constraints purge;
drop table favStadiums cascade constraints purge;
drop table favPlayers cascade constraints purge;
drop table favTeams cascade constraints purge;
drop table autographs cascade constraints purge;
drop table medicalServices cascade constraints purge;

set feedback on
