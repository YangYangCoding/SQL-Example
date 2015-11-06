set termout on;
set feedback off;

insert into Players  values('Bryan','24-Oct-1977',12,'Syd1');
insert into Players  values('Coelho','21-Mar-1987',11,'Syd1');
insert into Players  values('Delic','12-Sep-1974',9,'Perth1');
insert into Players  values('Greul','08-Apr-1970',1,'Perth1');
insert into Players  values('Hanley','01-Jan-1982',2,'Melb1');
insert into Players  values('Arthurs','02-Feb-1983',86,'Melb1');
insert into Players  values('Kubot',NULL,77,'Brisb1');
insert into Players  values('Santoro','16-Aug-1985',NULL,'Brisb1');
insert into Players  values('Healey','12-Dec-1988',24,'Canberra1');
insert into Players  values('Andreev','11-Oct-1976',12,'Canberra1');
insert into Players  values('Johansson','30-Nov-1983',NULL,'Adelaide1');
insert into Players  values('Dlouhy','21-Dec-1978',15,'Adelaide1');
insert into Players  values('Rochus','17-Feb-1986',11,'Syd2');
insert into Players  values('Becker','11-Apr-1980',14,'Syd2');
insert into Players  values('Friedl','4-Oct-1950',11,'Perth2');
insert into Players  values('Peya','13-Dec-1986',54,'Perth2');
insert into Players  values('Pavel','08-Mar-1983',NULL,'Melb2');
insert into Players  values('Ramirez','09-Aug-1975',11,'Melb2');
insert into Players  values('Almagro','10-sep-1980',NULL,'Brisb2');
insert into Players  values('Erlich','20-Oct-1964',14,'Brisb2');
insert into Players  values('Aspelin','11-jan-1970',NULL,'Canberra2');
insert into Players  values('Kim','25-Dec-1989',NULL,'Canberra2');
insert into Players  values('Bill','22-Mar-1985',42,'Adelaide2');
insert into Players  values('Shaun','12-Nov-1980',21,'Adelaide2');

insert into officials values(1,'James','Sydney','23-Sep-1953','Ambassador',NULL,NULL);
insert into officials values(2,'Andrew','Perth','12-Nov-1980','Albany','19-Aug-2007','22-Aug-2007');
insert into officials values(3,'Dlouhy','Canberra','09-Aug-1976','Ambassador','17-Aug-2007','19-Aug-2007');
insert into officials values(4,'Gregory','Adelaide','08-Mar-1965','Ambassador','18-Aug-2007','23-Aug-2007');
insert into officials values(5,'James','Brisbane','18-Aug-1957','Lorne','17-Aug-2007','29-Aug-2007');
insert into officials values(6,'Dlouhy','Melbourne','12-Mar-1986','Royal','16-Aug-2007','20-Aug-2007');
insert into officials values(7,'Fiacht','Sydney','11-Dec-1983','Ambassador','12-Aug-2007','17-Aug-2007');
insert into officials values(8,'Martin',NULL,'14-Apr-1976','Albany','17-Aug-2007','23-Aug-2007');

insert into hotels values('Ambassador',400,'Sydney',1);
insert into hotels values('Albany',200,'Perth',2);
insert into hotels values('Royal',150,'Sydney',3);
insert into hotels values('Lorne',250,'Sydney',4);

insert into teams values ('Syd1','Ambassador',NULL,NULL,'Coelho');
insert into teams values ('Perth1','Albany','17-Aug-2007','22-Aug,2007','Delic');
insert into teams values ('Melb1','Royal','17-Aug-2007','23-Aug,2007','Hanley');
insert into teams values ('Brisb1','Ambassador','12-Aug-2007','20-Aug,2007','Kubot');
insert into teams values ('Canberra1','Lorne','13-Aug-2007','25-Aug,2007','Andreev');
insert into teams values ('Adelaide1','Ambassador','14-Aug-2007','25-Aug,2007','Dlouhy');
insert into teams values ('Syd2','Albany','15-Aug-2007','19-Aug,2007','Rochus');
insert into teams values ('Perth2','Royal','17-Aug-2007','20-Aug,2007','Friedl');
insert into teams values ('Melb2','Ambassador','14-Aug-2007','20-Aug,2007','Pavel');
insert into teams values ('Brisb2','Ambassador','21-Aug-2007','24-Aug,2007','Erlich');
insert into teams values ('Canberra2','Lorne','16-Aug-2007','20-Aug,2007','Aspelin');
insert into teams values ('Adelaide2','Lorne','16-Aug-2007','20-Aug,2007','Shaun');


insert into fans values ('Aidan','22-Nov-2001','Ambassador','16-Aug-2007','23-Aug-2007');
insert into fans values ('Caden','12-Sep-1976','Lorne','11-Aug-2007','21-Aug-2007');
insert into fans values ('Riley','14-Mar-2972','Royal','15-Aug-2007','23-Aug-2007');
insert into fans values ('Caleb','22-Dec-1988','Ambassador','16-Aug-2007','24-Aug-2007');
insert into fans values ('Hannah','21-Mar-1998','Lorne','11-Aug-2007','23-Aug-2007');
insert into fans values ('Grace','11-Sep-1976','Royal','12-Aug-2007','23-Aug-2007');
insert into fans values ('Ella','12-mar-1982',NULL,NULL,NULL);
insert into fans values ('Cadence','11-Sep-1934',NULL,NULL,NULL);


insert into stadiums values('Acer Arena',17471,'Sydney');
insert into stadiums values('Ballymore',24000,'Brisbane');
insert into stadiums values('Canberra Stadium',24647,'Canberra');
insert into stadiums values('Exies',7500,'Griffith');
insert into stadiums values('Coopers',8000,'Adelaide');
insert into stadiums values('White City',8000,'Sydney');


insert into matches values (1,'17-Aug-2007','Syd1','Syd2','Syd1','Acer Arena',6,'Coelho');
insert into matches values (2,'18-Aug-2007','Syd2','Melb1','Syd2','Ballymore',4,'Rochus');
insert into matches values (3,'19-Aug-2007','Syd2','Melb2','Syd2','Canberra Stadium',5,'Rochus');
insert into matches values (4,'20-Aug-2007','Syd2','Canberra2','Canberra2','Coopers',7,'Rochus');
insert into matches values (5,'18-Aug-2007','Syd1','Melb1','Melb1','Exies',4,'Bryan');
insert into matches values (6,'17-Aug-2007','Melb2','Melb1','Melb1','White City',6,'Hanley');
insert into matches values (7,'19-Aug-2007','Syd1','Melb1','Melb1','Acer Arena',5,'Arthurs');
insert into matches values (8,'18-Aug-2007','Adelaide1','Melb1','Melb1','Coopers',4,'Arthurs');
insert into matches values (9,'18-Aug-2007','Canberra1','Perth1','Canberra1','Coopers',5,'Healey');
insert into matches values (10,'18-Aug-2007','Adelaide1','Adelaide2','Adelaide2','Acer Arena',4,'Bill');



insert into favStadiums values('Coelho','Coopers');
insert into favStadiums values('Delic','Coopers');
insert into favStadiums values('Hanley','Coopers');
insert into favStadiums values('Kubot','Coopers');
insert into favStadiums values('Andreev','Coopers');
insert into favStadiums values('Dlouhy','Coopers');
insert into favStadiums values('Friedl','Coopers');
insert into favStadiums values('Pavel','Coopers');
insert into favStadiums values('Erlich','Coopers');
insert into favStadiums values('Aspelin','Coopers');
insert into favStadiums values('Shaun','Coopers');
insert into favStadiums values('Rochus','Acer Arena');
insert into favStadiums values('Rochus','Ballymore');
insert into favStadiums values('Rochus','Canberra Stadium');
insert into favStadiums values('Rochus','Coopers');
insert into favStadiums values('Rochus','Exies');
insert into favStadiums values('Rochus','White City');
insert into favStadiums values('Coelho','White City');
insert into favStadiums values('Arthurs','Ballymore');
insert into favStadiums values('Arthurs','Canberra Stadium');
insert into favStadiums values('Hanley','Exies');
insert into favStadiums values('Bill','Coopers');
insert into favStadiums values('Arthurs','Coopers');
insert into favStadiums values('Shaun','White City');
insert into favStadiums values('Coelho','Exies');
insert into favStadiums values('Hanley','Acer Arena');
insert into favStadiums values('Bryan','Exies');

insert into favTeams values('Aidan','Syd1');
insert into favTeams values('Caden','Melb1');
insert into favTeams values('Caden','Canberra1');
insert into favTeams values('Caden','Perth1');
insert into favTeams values('Ella','Syd1');
insert into favTeams values('Grace','Syd1');
insert into favTeams values('Riley','Syd2');
insert into favTeams values('Caleb','Perth1');

insert into favPlayers values('Aidan','Rochus');
insert into favPlayers values('Aidan','Arthurs');
insert into favPlayers values('Riley','Rochus');
insert into favPlayers values('Riley','Coelho');
insert into favPlayers values('Hannah','Coelho');
insert into favPlayers values('Hannah','Rochus');
insert into favPlayers values('Hannah','Becker');
insert into favPlayers values('Grace','Arthurs');
insert into favPlayers values('Grace','Rochus');
insert into favPlayers values('Cadence','Hanley');
insert into favPlayers values('Cadence','Shaun');
insert into favPlayers values('Cadence','Bill');
insert into favPlayers values('Ella','Arthurs');
insert into favPlayers values('Ella','Rochus');

insert into autographs values('Aidan','Coelho','Acer Arena','17-Aug-2007');
insert into autographs values('Aidan','Rochus','Ballymore','18-Aug-2007');
insert into autographs values('Grace','Rochus','Exies','19-Aug-2007');
insert into autographs values('Cadence','Bill','Canberra Stadium','20-Aug-2007');
insert into autographs values('Cadence','Arthurs','Coopers','21-Aug-2007');
insert into autographs values('Ella','Coelho','White City','18-Aug-2007');
insert into autographs values('Caden','Rochus','White City','19-Aug-2007');

insert into medicalServices values('Syd1',4);
insert into medicalServices values('Syd2',5);
insert into medicalServices values('Syd2',3);
insert into medicalServices values('Melb1',1);
insert into medicalServices values('Melb1',4);
insert into medicalServices values('Melb2',4);
insert into medicalServices values('Canberra1',7);
insert into medicalServices values('Canberra2',8);
insert into medicalServices values('Perth1',7);
insert into medicalServices values('Perth2',5);
insert into medicalServices values('Adelaide1',6);
insert into medicalServices values('Adelaide2',8);
insert into medicalServices values('Brisb1',8);
insert into medicalServices values('Melb2',5);
insert into medicalServices values('Brisb2',8);

commit;
set feedback on;
