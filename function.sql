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
