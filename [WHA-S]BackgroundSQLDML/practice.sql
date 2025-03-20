-- 1. 실습용 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS sqli_lab;
USE sqli_lab;

-- 2. users 테이블 생성
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- 3. 샘플 계정 삽입 (Blind SQL Injection 실습 가능)
INSERT INTO users (username, password) VALUES 
('admin', 'P@ssw0rd'),
('test_user', 'test1234'),
('guest', 'welcome');

-- 4. Blind SQL Injection 실습용 취약한 쿼리 예제
-- (주의: 실제 환경에서는 이런 코드를 사용하면 보안 취약점이 발생합니다.)
DELIMITER $$

CREATE PROCEDURE vulnerable_login(IN user_input VARCHAR(50))
BEGIN
    SET @query = CONCAT('SELECT username FROM users WHERE username = ''', user_input, ''';');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;

-- 5. SQL Injection 공격 예시 (이진 탐색)
-- 관리자 비밀번호 첫 글자가 'P'인지 확인
SELECT * FROM users WHERE username='admin' AND ASCII(SUBSTRING(password, 1, 1)) > 79;

-- 6. SQL Injection 공격 예시 (비트 연산)
-- 첫 글자의 첫 번째 비트가 1인지 확인
SELECT * FROM users WHERE username='admin' AND SUBSTRING(BIN(ASCII(SUBSTRING(password, 1, 1))), 1, 1) = '1';

