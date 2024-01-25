/*
■ 단일행 SubQuery
'Den' 보다 월급을 많은 사람의 이름과 월급은?
-> 1.'Den'의 월급을 구한다. 5000
-> 2.직원테이블 에서 월급이 5000보다 많은 사람을 구한다.
*/

#1.---------------------------------
select salary
from employees
where first_name = 'Den'; -- 11000
#2.---------------------------------
select *
from employees
where salary >= 11000;
#합치기-------------------------------
select *
from employees
where salary >= (select salary
from employees
where first_name = 'Den');


/*
[예제]월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
->1. 최소월급 구하기
->2. 최소월급 받는사람 구하기
*/
#1.---------------------------------
select min(salary)
from employees; -- 2100
#2.---------------------------------
select  first_name,
		salary,
		employee_id
from employees
where salary = 2100;
#합치기-------------------------------
select  first_name,
		salary,
		employee_id
from employees
where salary = (select min(salary)
				from employees);
                
                
/*
[예제]평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요.
->1. 평균월급 구하기
->2. 평균월급보다 적게받는 사람 구하기
*/

#1.---------------------------------
select avg(salary)
from employees;
#2.---------------------------------
select  first_name,
		salary
from employees
where salary<6461.831776;
#합치기-------------------------------
select  first_name,
		salary
from employees
where salary<(select avg(salary)
			  from employees);
              
              
/*
■ 다중행 SubQuery [IN]
부서번호가 110인 직원의 급여와 같은 월급을 받는
모든 직원의 사번, 이름, 급여를 출력하세요.
->1. 부서번호가 110인 직원의 급여구하기
->2. 110인 직원의 급여와 같은 급여를 받는 직원구하기
*/

#1.---------------------------------
select salary
from employees
where department_id=110;
#2.---------------------------------
select  employee_id,
		first_name,
        salary
from employees
where salary = 12008
or salary = 8300;
-- where salary in (12008, 8300);
#합치기-------------------------------
select  employee_id,
		first_name,
        salary
from employees
where salary in( select salary
				from employees
				where department_id=110);


/*
[예제] 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요(IN의 확장)
->1. 각 부서별(group by) 최고급여
->2. 사원의 이름과 월급
*/
#1.---------------------------------
select  department_id,
		max(salary)
from employees
group by department_id;
#2.---------------------------------
select  first_name,
		salary
from employees;
#합치기-------------------------------
select  first_name,
		salary
from employees
where (department_id, salary)in(select  department_id,
										 max(salary)
								from employees
								group by department_id);
-- where (department_id, salary) = ((10,4400),(20,13000),(30,11000),...);


/*
[연습] 각 부서별 월급이 최저인 직원의 월급 과 이름
->1. 각 부서별 최저월급
->2. 사원의 이름과 월급
*/

select  department_id,
		min(salary)
from employees
group by department_id;

select  first_name,
		salary
from employees
where (department_id, salary) in(select department_id,
									   min(salary)
								from employees
								group by department_id);
       
       
/*
■ 다중행 SubQuery ['부등호' + ANY(or)]
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
*or는 둘중에 한가지 조건만 만족해도 됨*
->1. 부서번호가 110인 직원의 급여구하기
->2. 110인 직원의 급여보다 큰 급여를 받는 직원구하기
*/

#1.---------------------------------
select department_id,
		salary
from employees
where department_id = 110;
#2.---------------------------------
select first_name,
		salary
from employees
where salary > 830
or salary > 12008;
#합치기-------------------------------
select first_name,
		salary
from employees
where salary > any (select salary
					from employees
					where department_id = 110);
                    
/*
■ 다중행 SubQuery ['부등호' + ALL(and)]
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
*and 는 두가지 조건 다 만족해야 함*
->1. 부서번호가 110인 직원의 급여구하기
->2. 110인 직원의 급여보다 큰 급여를 받는 직원구하기
*/
                    
#1.---------------------------------
select department_id,
		salary
from employees
where department_id = 110;
#2.---------------------------------
select first_name,
		salary
from employees
where salary > 830
and   salary > 12008;
#합치기-------------------------------
select first_name,
		salary
from employees
where salary > all (select salary
					from employees
					where department_id = 110);       
         
         
/*
■ 조건절에서 비교 vs 테이블에서 조인
각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
->1. 각 부서별(group by) 최고급여
->2. 사원의 이름과 월급
*/    
     
# [조건절에서 비교]         
#1.---------------------------------
select  department_id,
		max(salary)
from employees
group by department_id;
#2.---------------------------------
select  first_name,
		salary
from employees;
#합치기-------------------------------
select  first_name,
		salary
from employees
where (department_id, salary)in(select  department_id,
										 max(salary)
								from employees
								group by department_id);
			
# [테이블에서 조인]
#1.---------------------------------
select  department_id,
		max(salary)
from employees
group by department_id;
#2.---------------------------------
select  first_name,
		salary
from employees;
#합치기-------------------------------
select  e.first_name,
		e.salary
from employees e , (select  department_id,
							max(salary) 'Msalary'-- 별명지어줘야함
					from employees
					group by department_id) ms
where e.department_id = ms.department_id
and e.salary = ms.Msalary;


/*
■ limit
순서대로 요청해야 하므로 우선 정렬을 해야함
*/

select *
from employees
order by employee_id asc
limit 0,5; -- 1번부터 5개

/*
[예제]07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
->1. 07년에 입사한 직원
->2. 급여가 많은 직원순서
->3. 3~7등의 직원
*/

select  first_name,
		salary,
        hire_date
from employees
where hire_date >= 070101
and hire_date <= 071231
order by salary desc
limit 2,5;


                    