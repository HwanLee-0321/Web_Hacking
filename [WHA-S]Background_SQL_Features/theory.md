# [WHA-S] Background: SQL Features | Dreamhack

## 1. SQL 개요
SQL(Structured Query Language)은 관계형 데이터베이스에서 데이터를 관리하기 위한 언어이다. 
주요 기능은 데이터 정의(DDL), 데이터 조작(DML), 데이터 제어(DCL) 등이 있다.

## 2. 주요 SQL 기능
### 1) 데이터 정의 언어(DDL)
- `CREATE` : 테이블, 인덱스, 뷰 등 데이터베이스 객체 생성.
- `ALTER` : 기존 객체 수정.
- `DROP` : 객체 삭제.

### 2) 데이터 조작 언어(DML)
- `SELECT` : 데이터 조회.
- `INSERT` : 새로운 데이터 추가.
- `UPDATE` : 기존 데이터 수정.
- `DELETE` : 데이터 삭제.

### 3) 데이터 제어 언어(DCL)
- `GRANT` : 특정 사용자에게 권한 부여.
- `REVOKE` : 특정 사용자의 권한 제거.

### 4) 트랜잭션 제어(TCL)
- `COMMIT` : 변경 사항을 확정.
- `ROLLBACK` : 변경 사항을 취소.
- `SAVEPOINT` : 특정 시점으로 복구 가능.

## 3. SQL 고급 기능
### 1) 인덱스(Index)
- 검색 속도를 높이기 위한 데이터 구조.
- `CREATE INDEX index_name ON table(column);`

### 2) 뷰(View)
- 특정 데이터를 가상의 테이블로 제공.
- `CREATE VIEW view_name AS SELECT ...`

### 3) 저장 프로시저(Stored Procedure)
- 미리 정의된 SQL 문을 저장하여 필요할 때 실행.
- `CREATE PROCEDURE procedure_name AS BEGIN ... END;`

### 4) 트리거(Trigger)
- 특정 이벤트 발생 시 자동 실행되는 SQL 문.
- `CREATE TRIGGER trigger_name BEFORE INSERT ON table ...`

## 4. SQL Injection 및 보안
### 1) SQL Injection 개요
- 공격자가 SQL 문을 조작하여 데이터베이스를 침해하는 기법.

### 2) 방어 방법
- **Prepared Statements** 사용 (`?` 또는 `$1` 등으로 파라미터 처리).
- **ORM(Object Relational Mapping) 도구** 활용.
- **입력 검증 및 화이트리스트 방식 적용**.

---

이 문서는 Dreamhack 강의 내용을 요약한 것입니다.
