use hrdb;
/***************************
select문   (조회)
****************************/
# ■  select ~ from 절
# 테이블 전체(*) 조회하기
select * from employees;
select * from departments;
select * from locations;
select * from countrie;
select * from regions;

select first_name, salary 
from employees;

-- 모든 직원의 직원아이디(employees_id), 이름(first_name),성(last_name)
-- 을 줄력하세요

select  employee_id, 
		first_name, 
        last_name
from employees;

select  first_name, 
		phone_number, 
        hire_date, 
        salary
from employees;

#모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select  first_name, 
		last_name, 
		salary, 
        phone_number, 
        email, 
        hire_date
from employees;

#직원아이디, 이름, 월급을 출력하세요. 
#단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select  employee_id as empNO, #컬럼명 뒤에 as 키워드 사용 후 별명을 쓰는 방식
		fitrst_name as 'f-name', #컬럼명 뒤에 공백을 주고(as 생략) 별명을 쓰는 방식(생략가능)
		salary as '월 급' #별명에 공백, 특수문자 등이 필요한 경우 ' '(홑 따옴표)로 감싸줌." "도 되지만 ' ' 추천
from employees;

#별명에 공백, 특수문자 등이 필요한 경우 ' '(홑 따옴표)로 감싸줌   " "도 되지만 ' ' 추천
select  first_name 이름,
		phone_number 전화번호,
        hire_date 입사일,
        salary 월급
from employees;

#직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select  employee_id '사 번',
		first_name 이름,
        last_name 성,
        salary 월급,
        phone_number 전화번호,
        email 이메일,
        hire_date 입사일
from employees;

# ■ 산술 연산자 사용하기
select  first_name,
		salary 월급,
        salary-100 '월급-식대',
        salary*12 연봉,
        salary*12+500 보너스포함,
        salary/30 일급,
        employee_id%3 '워크샵 팀'
from employees;

# ■ 문자열은 0으로 처리 -> 오류가 나지 않으므로 확인이 안될 수 있다.
select job_id*12
from employees;

# ■ 컬럼 합치기
select  first_name,
		last_name,
		concat(first_name, last_name) as name, # 같은컬럼
		concat(first_name,' ', last_name) '이름 성',# 같은컬럼 (중간띄기)
        concat(first_name,' ', last_name,'hire date is', hire_date) 입사일
from employees;

#예제-전체직원의 정보를 다음과 같이 출력하세요
select  concat(first_name,'-',last_name) 성명,
		salary 월급,
        salary*12 연봉,
        salary*12+5000 보너스,
        phone_number 전화번호
from employees;

# ■ 테이블의 컬럼명테이블의 데이터,  문자열,숫자는 그대로 출력 
select  first_name,
		salary*12 연봉,
        '(주)개발자' company,
        3 상태
from employees;

# ■ 테이블 명 생략
select now()
from employees;

select 3+5;
select '(주)개발자' company;

-- -------------------------------------------
# ■ where 절
select first_name
from employees
where department_id = 10;

#예제-연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  first_name 이름,
		salary 월급
from  employees
where salary >= 15000;

#예제-07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name 이름,
		hire_date 입사일
from  employees
where hire_date > '2007/01/01'; #날짜는 문자열로 입력해야 함

#예제-이름이 Lex인 직원의 이름과 월급을 출력하세요
select  first_name 이름,
		salary 월급
from employees
where first_name ='lex';
-- where binary first_name = 'Lex'; 대소문자 구분하고 싶을 때

 # ■ 조건이 2개이상 일때 한꺼번에 조회하기
select  first_name 이름,
		salary 월급
from employees
where salary >= 14000
and salary <= 17000;

#예제-월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select  first_name 이름,
		salary 월급
from employees
where salary <=14000 # and는 두조건 다 만족. or는 두조건중 한개만 만족해도 됨.
or salary >=17000;

#예제-입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select  first_name 이름,
		hire_date 입사일
from employees
where hire_date > 20040101
and   hire_date < 20051231;

# ■ BETWEEN 연산자로 특정구간 값 출력하기
select  first_name 이름,
		salary 월급
from employees
where salary between 14000 and 17000; #경계값을 포함하는 경우에만 사용(작은숫자부터 쓰기)
-- where salary >= 14000 
-- and   salary <= 17000;

# ■ IN 연산자로 여러 조건을 검사하기 - Neena, Lex, John 의 이름, 성, 월급을 구하시오
select  first_name 이름,
		last_name 성,
        salary 월급 
from employees
where first_name in('neena','lex','john');
-- or first_name = 'neena'
-- or first_name = 'lex'
-- or first_name = 'john';

#예제-월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select  first_name 이름,
		salary 월급
from employees
where salary in(2100,3100,4100,5100);




