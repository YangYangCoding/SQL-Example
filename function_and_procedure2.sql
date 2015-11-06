-- Functions that check the questions are implemented here
set serveroutput on size 1000000
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
		return qid||'	correct';
	elsif (nexcess > 0 and nmissing > 0) then
		return qid||'	extraneous and missing tuples';
	elsif (nexcess > 0 and nmissing = 0) then
		return qid||'	extraneous tuples';
	elsif (nexcess = 0 and nmissing > 0) then
		return qid||'	missing tuples';
	end if;
end;
/


create or replace procedure check_q(qnum NUMBER)
as 
	nexcess integer;
	nmissing integer;
	count1 integer;
	count2 integer;
	ndata_type1 integer;
	ndata_type2 integer;
	q varchar(4);
	q_expected varchar(13);
	query1 varchar(100);
	query2 varchar(100);
	query3 varchar(250);
	query4 varchar(250);
	query5 varchar(100);
	query6 varchar(100);
	marked number;
begin
--	q :=UPPER(qnum);
--	q_expected := UPPER(qnum)||'_EXPECTED';
	marked := 0;
	
	query1 := 'select count(*) from ((select * from Q'||qnum||') MINUS (select * from Q'||qnum||'_EXPECTED))';
	query2 := 'select count(*) from ((select * from Q'||qnum||'_EXPECTED) MINUS (select * from Q'||qnum||'))';
	query3 := 'select count(*) from ((select data_type from user_tab_columns where table_name =''Q'||qnum||'_EXPECTED'')MINUS(select data_type from user_tab_columns where table_name= ''Q'||qnum||'''))';
	query4 := 'select count(*) from ((select data_type from user_tab_columns where table_name =''Q'||qnum||''')MINUS(select data_type from user_tab_columns where table_name= ''Q'||qnum||'_EXPECTED''))';
	query5 := 'select count(*) from Q'||qnum;
	query6 := 'select count(*) from Q'||qnum||'_EXPECTED';
--	DBMS_OUTPUT.PUT_LINE(query3);
--	DBMS_OUTPUT.PUT_LINE(query4);
	--query2 := 'select count(*) from ((select * from Q'||qnum||'_EXPECTED) MINUS (select * from Q'||qnum||'))';
	if (not ass2_view_exists('Q'||qnum)) then
		marked:=1;
		DBMS_OUTPUT.PUT_LINE(''||qnum||'	View Not Found! Did it load correctly!');
	elsif (not ass2_table_exists('Q'||qnum||'_EXPECTED')) then
		DBMS_OUTPUT.PUT_LINE(''||qnum||'	 Expected Materialized View not found. Run Solution.sql');
		marked:=1;
	else
		execute immediate query3 into ndata_type2;
		execute immediate query4 into ndata_type1;
		if(ndata_type2=0) AND (ndata_type1=0) then
--			DBMS_OUTPUT.PUT_LINE('um here');
			execute immediate query1 into nexcess;
			execute immediate query2 into nmissing;
			DBMS_OUTPUT.PUT_LINE(''||qnum|| ass2_check_result(q,nexcess,nmissing));
		else
			DBMS_OUTPUT.PUT_LINE(''||qnum||'	In correct Number of columns');
		end if;
		marked:=1;
	end if;
	if(marked=0) then
		DBMS_OUTPUT.PUT_LINE('???');
	end if;
exception
	when others then
		DBMS_OUTPUT.PUT_LINE(''||qnum||'	Something went wrong!!!');
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

exec check_all(14);






