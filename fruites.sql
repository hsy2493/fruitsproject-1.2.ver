sql
SELECT * FROM fruits_age_code fac  ;
SELECT * FROM fruits_code fc ;
SELECT * FROM fruits_gender_code fgc ;

SELECT * FROM fruits_records fr ;

DELETE FROM fruits_records WHERE id = 6;
-- 과일 중복이면 count (update), 과일 0 (insert)
-- 과일,연령, 성별의 합계
SELECT count(*) FROM fruits_records fr WHERE fr.fruit_cd = 1 AND fr.age_cd= 1 AND fr.gender_cd=1;
-- insert 구문
INSERT INTO fruits_records (fruit_cd,gender_cd,age_cd,cnt) VALUES (1,2,2,1);
-- 계산 구문 : 같은 값이 있을때 
UPDATE fruits_records fr SET cnt = cnt +1 WHERE fr.fruit_cd = 1 AND fr.age_cd= 1 AND fr.gender_cd=2;

-- 전체 과일의 합
SELECT sum(fr.cnt) FROM fruits_records fr;  
SELECT sum(fr.cnt) FROM fruits_records fr  WHERE fruit_cd =2; 

-- 해당 과일의 합
SELECT fr.fruit_cd ,sum(fr.cnt) FROM fruits_records fr GROUP BY fr.fruit_cd; 

-- 성별로 나누기 (2개)
SELECT fr.fruit_cd ,sum(fr.cnt) FROM fruits_records fr WHERE fr.gender_cd=2 GROUP BY fr.fruit_cd ;

-- 나이대로 나누기 (3개)
SELECT fr.fruit_cd ,sum(fr.cnt) FROM fruits_records fr WHERE fr.age_cd= 1 GROUP BY fr.fruit_cd ;