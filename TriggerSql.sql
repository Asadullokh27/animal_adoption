-- Creating Archive
create table Archives(
	id serial,
	changed_on text
)


CREATE OR REPLACE FUNCTION myfunc_for_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF OLD.Full_name <> NEW.Full_name THEN
		 INSERT INTO Archives(id,changed_on)
		 VALUES(OLD.id,now());
	END IF;

	RETURN NEW;
END;
$$




CREATE OR REPLACE FUNCTION myfunc_for_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
-- 	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO Archives(id,changed_on)
		 VALUES(OLD.id,now());
-- 	END IF;

	RETURN OLD;
END;
$$



create trigger trigger_for_Student_with_after
before update
on Students
for each row
execute procedure myfunc_for_trigger();



create or replace trigger_for_Students_with_delete
after delete
on Students
for each row
execute procedure myfunc_for_trigger();



-- Update
update Students
set full_name = 'Asadulloh',
age = 20
where age = 17

-- Delete
delete from Students
where age = 19

-- Selecting
select * from Students
select * from Subject
select * from Archives

















