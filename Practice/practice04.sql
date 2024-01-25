/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.
(56건)
->1. 평균월급
->2. 평균월급보다 적은 직원 몇명
*/
select avg(salary)
from employees ;

select count(salary)
from employees 
where salary<(select avg(salary)
				from employees );
  
  
/*
문제2. 
평균월급 이상, 최대월급 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 
월급의 오름차순으로 정렬하여 출력하세요 
(51건)
*/
select  employee_id,
		first_name,
        salary
from employees
where salary>(select avg(salary)
				from employees)
and salary<=(select max(salary)
			from employees)
group by employee_id
order by salary asc;


/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
->1. Steven(first_name) king(last_name)이 소속된 부서(departments)
->2. 부서의 주소
*/
select  d.location_id,
		l.street_address,
        l.postal_code,
		l.city,
        l.state_province,
        l.country_id
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and d.department_id in(select e.department_id
						from employees e
						where e.first_name = 'Steven'
						and e.last_name = 'king') 
group by location_id;


/*
문제4.
job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)
->1. job_id 가 'ST_MAN' 인 직원 월급 
->2. 1보다 작은 월급을 받는 직원의 사번,이름,월급
*/

select job_id
from jobs j , 
where job_id = 'ST_MAN';

select salary
from employees
where job_id in(select j.job_id
				from jobs j
				where j.job_id = 'ST_MAN');





select  e.employee_id,
		e.first_name,
        e.salary
from employees e, ( select j.job_id
					from jobs j
					where j.job_id = 'ST_MAN') j
where e.salary<j.salary;


/*
문제5. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
# 조건절에서 비교
select department_id,
		max(salary)
from employees
group by department_id;

select  employee_id,
		first_name,
        salary,
        department_id
from employees
where (department_id, salary) in(select department_id,
										max(salary)
								from employees
								group by department_id)
order by salary desc;
                                
#테이블에서 조인
select  e.employee_id,
		e.first_name,
        e.salary,
        e.department_id
from employees e, (select department_id,
						  max(salary) Msalary
					from employees
					group by department_id) m
where e.department_id = m.department_id
and e.salary = Msalary
order by salary desc;


/*
문제6.
각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다. 
월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오 
(19건)
*/

select  job_id,
		sum(salary)
from employees
group by job_id;

select job_title,
		ssalary
from employees e right join (select  job_id,
							sum(salary) ssalary
					from employees
					group by job_id) j 
on e.job_id = j.job_id
and e.salary=ssalary
join jobs
on j.job_id = jobs.job_id
order by ssalary desc;
