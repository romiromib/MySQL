/*
문제 1. 
전체직원의 다음 정보를 조회하세요. 정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요. 
이름(first_name last_name),  월급(salary),  전화번호(phone_number), 입사일(hire_date) 순서이고 
"이름", "월급", "전화번호", "입사일" 로 컬럼이름을 대체해 보세요. 입사일이 같으면 abc순(오름차순)으로 출력합니다.

*/
select  concat(first_name,' ', last_name) 이름, 
		salary 월급, 
        phone_number 전화번호, 
        hire_date 입사일
from employees
where hire_date = hire_date
order by hire_date, first_name ASC;

/*
문제2.
업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬하세요.
*/
select job_title,
		max_salary
from jobs
where max_salary
order by max_salary desc;

/*
문제3.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급을 월급이 많은사람부터 출력하세요.
*/

