
set feedback on
prompt creating tables ...
set feedback off


create table players (
	name varchar(20) primary key,
	birthdate date,
	shirtNumber number(2),
	team varchar(20) not null
);

	

create table officials (
	staffID NUMBER(2) primary key,
	name varchar(20),
	address varchar(20),
	birthdate date,
	staysAt varchar(20) not null,
	checkIn date,
	checkOut date
);

create table hotels(
	name varchar(20) primary key,
	rooms integer check (rooms > 0),
	address varchar(20),
	manager number(2) not null
		references officials(staffID)
		initially deferred deferrable
);

create table teams (
	name varchar(20) primary key,
	staysAt varchar(20) not null
		references hotels(name),
	checkIn date,
	checkOut date,
	captain varchar(20) not null
		references players(name)
		initially deferred deferrable
);


create table stadiums(
	name varchar(20) primary key,
	capacity integer check (capacity > 0),
	city varchar(20)
);

create table fans(
	name varchar(20) primary key,
	birthdate date,
	staysAt varchar(20)
		references hotels(name),
	checkIn date,
	checkOut date
);

--set feedback on;
create table matches (
	ID integer primary key,
	datePlayed date,
	home varchar(20) not null
		references teams(name),
	away varchar(20) not null
		references teams(name),
	winner varchar(20) 
		references teams(name),
	stadium varchar(20) not null
		references stadiums(name),
	referee Number(2) not null
		references officials(staffID),
	manOfMatch varchar(20) not null
		references players(name),
	check (home <> away),
	check (winner in (home,away))
);
	

create table favStadiums(
	player varchar(20)
		references players(name),
	stadium varchar(20)
		references stadiums(name),
	primary key (player,stadium)
);



create table favTeams(
	fan varchar(20)
		references fans(name),
	team varchar(20)
		references teams(name),
	primary key (fan,team)
);


create table favPlayers(
	fan varchar(20)
		references fans(name),
	player varchar(20)
		references players(name),
	primary key (fan,player)
);

create table autographs(
	fan varchar(20)
		references fans(name),
	player varchar(20)
		references players(name),
	stadium varchar(20)
		references stadiums(name),
	dateTaken date,
	primary key (fan,player)
);

create table medicalServices(
	team varchar(20)
		references teams(name),
	official number(2)
		references officials(staffID),
	primary key (team,official)
);


Alter table players add foreign key (team) 
	references teams(name) initially deferred deferrable;

Alter table officials add foreign key (staysAt)
	references hotels(name) initially deferred deferrable;

set feedback on
