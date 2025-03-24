-- 1. 테이블 생성 (DDL)
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL
);

-- 2. 데이터 삽입 (DML)
INSERT INTO users (id, username, password) VALUES (1, 'admin', 'admin123');
INSERT INTO users (id, username, password) VALUES (2, 'guest', 'guest123');

-- 3. 데이터 조회 (DML)
SELECT * FROM users;

-- 4. 데이터 수정 (DML)
UPDATE users SET password = 'newpass123' WHERE username = 'guest';

-- 5. 데이터 삭제 (DML)
DELETE FROM users WHERE username = 'guest';

-- 6. 권한 부여 (DCL)
GRANT SELECT ON users TO some_user;

-- 7. 트랜잭션 사용 (TCL)
BEGIN;
INSERT INTO users (id, username, password) VALUES (3, 'user3', 'pw3');
SAVEPOINT save1;
UPDATE users SET password = 'pw4' WHERE id = 3;
ROLLBACK TO save1;
COMMIT;

-- 8. 인덱스 생성
CREATE INDEX idx_username ON users(username);

-- 9. 뷰 생성
CREATE VIEW active_users AS SELECT id, username FROM users;

-- 10. 트리거 생성 예시
CREATE TRIGGER log_insert
AFTER INSERT ON users
BEGIN
  INSERT INTO logs (message) VALUES ('New user inserted');
END;
