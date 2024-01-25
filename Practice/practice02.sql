/*
문제1.
매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
*/
select count(manager_id) haveMngCnt
from employees;

/*
문제2. 
직원중에 최고임금(salary)과  최저임금을 "최고임금", "최저임금" 으로 출력해 보세요. 
두 임금의 차이는 얼마인가요?  "최고임금 – 최저임금"이란 타이틀로 함께 출력해 보세요.
*/
select  max(salary) 최고임금,
		min(salary) 최저임금,
        max(salary)-min(salary)
from employees;

/*
문제3.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
select date_format(max(hire_date),'%Y년 %m월 %d일') '마지막 신입사원 입사일'
from employees;

/*
문제4.
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
select department_id,
		max(salary) 최고임금,
        min(salary) 최저임금
from employees
group by department_id
order by department_id desc;

/*
문제4.
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
select  department_id,
		avg(salary) 평균임금,
		max(salary) 최고임금,
        min(salary) 최저임금
from employees
group by department_id
order by department_id desc;

/*
문제6.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2005-08-20 Saturday 
*/

select date_format(min(hire_date),'%Y-%m-%d %W') '가장 오래 근속한 직원 입사일'
from employees;

/*
문제7.
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 
평균임금, 최저임금 그리고 (평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
select  department_id,
		avg(salary) 평균임금,
        min(salary) 최저임금,
        avg(salary)-min(salary)<2000 '평균임금-최저임금'
from employees
group by department_id
order by avg(salary)-min(salary)<2000 desc;