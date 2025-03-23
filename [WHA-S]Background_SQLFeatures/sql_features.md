# [WHA-S] Background: SQL Features

## 1. SQL 개요
SQL(Structured Query Language)은 관계형 데이터베이스에서 데이터를 관리하기 위한 언어입니다.  
SQL은 **데이터 정의(DDL)**, **데이터 조작(DML)**, **데이터 제어(DCL)** 등의 다양한 기능을 제공합니다.

---

## 2. SQL의 주요 기능

### 2.1. 데이터 조작 언어 (DML)
DML은 데이터의 삽입, 조회, 수정, 삭제 등의 작업을 수행하는 명령어들로 구성됩니다.

- `SELECT` : 데이터를 조회
- `INSERT` : 데이터를 삽입
- `UPDATE` : 데이터를 수정
- `DELETE` : 데이터를 삭제

#### ✅ 예제 코드

```sql
-- SELECT 예제
SELECT * FROM users WHERE id = 1;

-- INSERT 예제
INSERT INTO users (username, password) VALUES ('admin', 'P@ssw0rd');

-- UPDATE 예제
UPDATE users SET password = 'newpass' WHERE username = 'admin';

-- DELETE 예제
DELETE FROM users WHERE username = 'admin';
```

---

### 2.2. 데이터 정의 언어 (DDL)
DDL은 테이블과 같은 데이터 구조를 정의하는 명령어들로 구성됩니다.

- `CREATE` : 새로운 테이블 또는 데이터베이스 생성
- `ALTER` : 기존 데이터 구조 수정
- `DROP` : 데이터베이스 또는 테이블 삭제

#### ✅ 예제 코드

```sql
-- CREATE 예제
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- ALTER 예제
ALTER TABLE users ADD COLUMN email VARCHAR(100);

-- DROP 예제
DROP TABLE users;
```

---

### 2.3. 데이터 제어 언어 (DCL)
DCL은 데이터베이스의 접근 권한을 제어하는 명령어입니다.

- `GRANT` : 사용 권한 부여
- `REVOKE` : 사용 권한 회수

#### ✅ 예제 코드

```sql
-- GRANT 예제
GRANT SELECT ON users TO 'user1'@'localhost';

-- REVOKE 예제
REVOKE SELECT ON users FROM 'user1'@'localhost';
```

---

## 3. SQL의 확장 기능

### 3.1. 서브쿼리 (Subquery)
하나의 SQL 문 안에서 또 다른 SQL 문을 실행하는 방식입니다.

#### ✅ 예제 코드

```sql
SELECT username FROM users WHERE id = (SELECT MIN(id) FROM users);
```

---

### 3.2. 조인 (JOIN)
두 개 이상의 테이블을 연결하여 데이터를 조회하는 방식입니다.

- **INNER JOIN** : 공통된 데이터를 기준으로 결합
- **LEFT JOIN** : 왼쪽 테이블의 모든 데이터 포함
- **RIGHT JOIN** : 오른쪽 테이블의 모든 데이터 포함

#### ✅ 예제 코드

```sql
-- INNER JOIN 예제
SELECT users.username, orders.order_id
FROM users
INNER JOIN orders ON users.id = orders.user_id;
```

---

### 3.3. UNION
여러 개의 `SELECT` 결과를 하나로 합치는 기능입니다.

#### ✅ 예제 코드

```sql
SELECT username FROM users
UNION
SELECT customer_name FROM customers;
```

---

## 4. SQL Injection 보안 고려사항
SQL Injection 공격을 방지하기 위해 보안 조치를 적용해야 합니다.

### ✅ 4.1. 준비된 문(Prepared Statements) 사용
```python
cursor.execute("SELECT * FROM users WHERE username = %s", (user_input,))
```

### ✅ 4.2. 최소 권한 부여
```sql
CREATE USER 'webapp'@'localhost' IDENTIFIED BY 'securepassword';
GRANT SELECT ON mydb.* TO 'webapp'@'localhost';
```

### ✅ 4.3. 입력값 검증
```python
import re
if not re.match("^[a-zA-Z0-9_]+$", user_input):
    print("Invalid input")
```

---

## 📌 마무리
SQL의 다양한 기능과 확장 기능을 이해하고,  
보안 조치를 적용하여 안전한 데이터베이스 관리를 수행하는 것이 중요합니다.
