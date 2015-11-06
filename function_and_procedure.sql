-- Functions that check the questions are implemented here
set serveroutput on
create or replace function
	ass2_table_exists(relname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from tab
	where tname=relname and TABTYPE='TABLE';
	return (chck=1);
end;
/


create or replace function
	ass2_view_exists(relname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from tab
	where relname=tname and tabtype='VIEW';
	return (chck = 1);
end;
/

create or replace function
	ass2_function_exists(funcname varchar) return boolean
as 
	chck integer := 0;
begin
	select count(*) into chck from user_objects
	where object_name=funcname and object_type='FUNCTION';
	return (chck > 0);
end;
/



create or replace function
	ass2_check_result(qid varchar, nexcess integer, nmissing integer) return varchar
as 
begin
	if (nexcess = 0 and nmissing = 0) then
		return qid||': correct';
	elsif (nexcess > 0 and nmissing > 0) then
		return qid||': extraneous *and* missing result tuples';
	elsif (nexcess > 0 and nmissing = 0) then
		return qid||': extraneous result tuples';
	elsif (nexcess = 0 and nmissing > 0) then
		return qid||': missing result tuples';
	end if;
end;
/

create or replace procedure check_q(qnum NUMBER)
as 
	nexcess integer;
	nmissing integer;
	q varchar(4);
	q_expected varchar(13);
	query1 varchar(100);
	query2 varchar(100);
	marked number;
begin
--	q :=UPPER(qnum);
--	q_expected := UPPER(qnum)||'_EXPECTED';
	marked := 0;
	query1 := 'select count(*) from ((select * from Q'||qnum||') MINUS (select * from Q'||qnum||'_EXPECTED))';
	query2 := 'select count(*) from ((select * from Q'||qnum||'_EXPECTED) MINUS (select * from Q'||qnum||'))';
	if (not ass2_view_exists('Q'||qnum)) then
		marked:=1;
		DBMS_OUTPUT.PUT_LINE('No Q'||qnum||' View; did it load correctly?');
	elsif (not ass2_table_exists('Q'||qnum||'_EXPECTED')) then
		DBMS_OUTPUT.PUT_LINE('Q_'||qnum||': No expected results! run expected.sql!');
		marked:=1;
	else
		execute immediate query1 into nexcess;
		execute immediate query2 into nmissing;
		DBMS_OUTPUT.PUT_LINE('Q'||qnum|| ass2_check_result(q,nexcess,nmissing));
		marked:=1;
	end if;
	if(marked=0) then
		DBMS_OUTPUT.PUT_LINE('???');
	end if;
end;
/


create or replace procedure check_all(qnum number)
as
begin
	for i in 1..qnum loop
		check_q(i);
	end loop;
end;
/


set serveroutput on

