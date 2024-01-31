-- Task 1

select * from course where dept_name = 'Comp. Sci.' and credits = 3

select distinct student.ID from student join takes using(ID) join teaches using(course_id,sec_id,semester,year)  join instructor on teaches.id = instructor.id where instructor.name != 'Einstein'

select max(salary) from instructor

select ID,name from instructor where salary = (select max(salary) from instructor)

select course_id,sec_id,  count(Id) from section join takes using(course_id,sec_id,semester,year) where section.semester = 'Autumn' and section.year = 2009 group by course_id,sec_id

select max(enrollment) from (select count(ID) as enrollment from section join takes using(course_id,sec_id,semester,year)where section.semester = 'Autumn' and section.year = 2009 group by course_id,sec_id)

-- Task 2

update instructor set salary = salary * 0.10 where dept_name = 'Comp.Sci.'

delete from course where course_id not in (select course_id from section)

insert into instructor (ID,name,dept_name, salary) select ID,name,dept_name, 10000 from student where tot_cred > 100
