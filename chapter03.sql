-- 그룹함수

select  first_name,
		salary,
		smu(salary)
from employees;

select sum(salary)
from employees;


select  department_id,
		count(*),
        sum(salary)
from employees
group by department_id
having sum(salary)>=20000;

select first_name,
		department_id,
case when department_id between 10 and 50 then 'A-TEAM'
	 when department_id between 60 and 100 then 'B-TEAM'
     when department_id between 110 and 150 then 'C-TEAM'
     else '팀없음'
end team
from employees;


select first_name, 
em.department_id,
department_name, 
de.department_id
# from employees em
# inner join departments de
# on em.department_id = de.department_id;
from employees em, departments de
where em.department_id = de.department_id;

-- EQui join
select  first_name,
        de.department_name,
        jb.job_title
from employees em, departments de , jobs jb
where em.department_id = de.department_id
and em.job_id = jb.job_id;

-- inner join
select  em.first_name,
		de.department_name,
        jb.job_title
from  employees em
inner join departments de
		on em.department_id = de.department_id
inner join jobs jb
		on em.job_id = jb.job_id;
        

-- 연습문제
-- inner
select  first_name,
		de.department_id,
        de.department_name,
        jb.job_id,
        jb.job_title,
        lc.location_id,
        lc.city
from employees em
inner join departments de
		on em.department_id = de.department_id
inner join locations lc
		on de.location_id = lc.location_id
inner join jobs jb
		on em.job_id = jb.job_id;
-- EQ
select  first_name,
		de.department_id,
        de.department_name,
        jb.job_id,
        jb.job_title,
        lc.location_id,
        lc.city
from employees em , departments de, locations lc, jobs jb
where em.department_id = de.department_id
and	  de.location_id = lc.location_id
and	  em.job_id = jb.job_id; 


-- left outer join
(select employee_id,
		e.department_id, 
		e.first_name, 
        d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id)
union
-- right outer join
(select employee_id,
		e.department_id,
		e.first_name,
        d.department_name
from employees e
right outer join departments d
on e.department_id = d.department_id);

-- union 결과값 문제점찾기->중복값 찾기

select  employee_id,
		first_name,
        department_id
from employees; -- (107)

select  department_id,
		department_name
from departments; -- (27)

select  first_name,
		department_id,
		count(*) cnt
from employees -- (107)
group by first_name,department_id
having count(first_name)>1 ;
-- -------------------------------------