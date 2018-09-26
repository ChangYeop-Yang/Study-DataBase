# DATABASE
체계화된 데이터의 모임이다. 즉, 작성된 목록으로써 여러 응용 시스템들의 통합 된 정보들을 저장하여 운영할 수 있는 공용 데이터들의 묶음이다.

* 공용 데이터 (Shared Data) : 다양한 사용자들이 필요한 정보를 공동으로 이용할 목적으로 만들어진 자료이다.
* 운영 데이터 (Operational Data) : 한 조직체가 유지되고 운영되는데 필요한 모든 개체 데이터와 관계 데이터의 집합이다.
* 통합 데이터 (Integrated Data) : 데이터 집단에서 자료의 중복이나 군더더기를 제거하여 최적화시킨 데이터의 집합이다.
* 저장 데이터 (Stored Data) : 컴퓨터 시스템이 접근 가능한 저장 매체에 저당 된 데이터의 집합이다.

## ★ DATABASE Structure
* 논리적 구조 : 사용자나 응용 프로그래머가 데이터베이스를 바라보는 관점에서 데이터 배치 형태를 의미하는 것으로 논리적 레코드를 가지고 사용자나 응용 프로그래머의 상상에 따라 전개한 모양을 의미한다.
* 물리적 구조 : 데이터가 물리적 저장 장치에 배치된 형태를 의미하는 것으로 저장 레코드를 이용하여 실제 물리적 저장 장치 위에 전개한 모양을 의미한다.
 
## ★ DATABASE MANAGEMENT SYSTEM (DBMS)
* The database management system (DBMS) is the software that interacts with end users, applications, and the database itself to capture and analyze data. A general-purpose DBMS allows the definition, creation, querying, update, and administration of databases. A database is generally stored in a DBMS-specific format which is not portable, but different DBMSs can share data by using standards such as SQL and ODBC or JDBC. The sum total of the database, the DBMS and its associated applications can be referred to as a "database system". Often the term "database" is used to loosely refer to any of the DBMS, the database system or an application associated the database.

* 데이터베이스 관리 시스템(영어: database management system, DBMS)은 **다수의 사용자들이 데이터베이스 내의 데이터를 접근할 수 있도록 해주는 소프트웨어 도구의 집합**이다. DBMS은 **사용자 또는 다른 프로그램의 요구를 처리하고 적절히 응답하여 데이터를 사용할 수 있도록 해준다.**

|DBMS Function|Explanation|
|:-----------:|:---------:|
|정의|데이터에 대한 형식, 구조, 제약조건들을 명세하는 기능이다. 이때 데이터베이스에 대한 정의 및 설명은 카탈로그나 사전의 형태로 저장된다.|
|구축|DBMS가 관리하는 기억 장치에 데이터를 저장하는 기능이다.|
|조작|특정한 데이터를 검색하기 위한 질의, 데이터베이스의 갱신, 보고서 생성 기능 등을 포함한다.|
|공유|여러 사용자와 프로그램이 데이터베이스에 동시에 접근하도록 하는 기능이다.|
|보호|하드웨어나 소프트웨어의 오동작 또는 권한이 없는 악의적인 접근으로부터 시스템을 보호한다.|
|유지보수|시간이 지남에 따라 변화하는 요구사항을 반영할 수 있도록 하는 기능이다.|

#### # DBMS Interfaces
• Embeded Aproach: e.g embeded SQL (for C, C++, etc.), SQLJ (for java)
• Procedure Cal Aproach: e.g. JDBC for Java, ODBC (Open Databse Conectivity) for other programming languages as API’s (aplication programming interfaces)
• Database Programming Language Aproach: e.g. ORACLE has PL/SQL, a programming language based on SQL; language incorporates SQL and its data types as integral components
• Scripting Languages: PHP (client-side scripting) and

## ★ DATABASE Language

#### # DML (Data Manipulation Language) - SELECT, INSERT, UPDATE, DELETE
데이터 조작 언어(영어: Data Manipulation Language, DML)은 **데이터베이스 사용자 또는 응용 프로그램 소프트웨어가 컴퓨터 데이터베이스에 대해 데이터 검색, 등록, 삭제, 갱신을 위한, 데이터베이스 언어 또는 데이터베이스 언어 요소**이다.

```SQL
/* MARK: - The SQL SELECT Statement */
SELECT column1, column2 FROM table_name;

/* MARK: - The SQL WHERE Clause */
SELECT column1, column2 FROM table_name WHERE condition;

/* MARK: - The SQL ORDER BY Keyword */
SELECT column1, column2 FROM table_name ORDER BY column1, column2 ASC|DESC;

/* MARK: - The SQL INSERT INTO Statement */
INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);

/* MARK: - The SQL UPDATE Statement */
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

/* MARK: - The SQL DELETE Statement */
DELETE FROM table_name WHERE condition;
```

#### # DDL (Data Definition Language) - CREATE, DROP, ALTER, TURNCATE
데이터 정의 언어(영어: Data Definition Language, DDL)는 **컴퓨터 사용자 또는 응용 프로그램 소프트웨어가 컴퓨터의 데이터를 정의하는 컴퓨터 언어 또는 컴퓨터 언어 요소**이다.

```SQL
/* MARK: - The SQL CREATE TABLE Statement */
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
);

/* MARK: -The SQL CREATE DATABASE Statement */
CREATE DATABASE databasename;

/* MARK: - The SQL DROP DATABASE Statement */
DROP DATABASE databasename;

/* MARK: - ALTER TABLE - ADD Column */
ALTER TABLE table_name ADD column_name datatype;

/* MARK: - ALTER TABLE - DROP COLUMN */
ALTER TABLE table_name DROP COLUMN column_name;

/* MARK: - ALTER TABLE - ALTER/MODIFY COLUMN */
ALTER TABLE table_name ALTER COLUMN column_name datatype;
```

#### # DCL (Data Control Language) - GRANT, REVOKE
데이터 제어 언어(영어: Data Control Language, DCL)는 **데이터베이스에서 데이터에 대한 액세스를 제어하기 위한 데이터베이스 언어 또는 데이터베이스 언어 요소**이다. 권한 부여(GRANT)와 박탈(REVOKE)이 있으며, 설정할 수 있는 권한으로는 연결(CONNECT), 질의(SELECT), 자료 삽입(INSERT), 갱신(UPDATE), 삭제(DELETE) 등이 있다.

```SQL
/* MARK: - The SQL Reovke DATABASE Statement */
REVOKE privilege_name ON object_name FROM {user_name |PUBLIC |role_name};

/* MARK: - The SQL Grant DATABASE Statement */
GRANT privilege_name ON object_name TO {user_name |PUBLIC |role_name} [WITH GRANT OPTION];
```

## ★ DATABASE Schema
데이터베이스 스키마(database schema)는 데이터베이스에서 자료의 구조, 자료의 표현 방법, 자료 간의 관계를 형식 언어로 정의한 구조이다. 데이터베이스 관리 시스템(DBMS)이 주어진 설정에 따라 데이터베이스 스키마를 생성하며, 데이터베이스 사용자가 자료를 저장, 조회, 삭제, 변경할 때 DBMS는 자신이 생성한 데이터베이스 스키마를 참조하여 명령을 수행한다.

|Schema Name|Description|
|:---------:|:---------:|
|외부 스키마(External Schema)|프로그래머나 사용자의 입장에서 데이터베이스의 모습으로 조직의 일부분을 정의한 것|
|개념 스키마(Conceptual Schema)|모든 응용 시스템과 사용자들이 필요로하는 데이터를 통합한 조직 전체의 데이터베이스 구조를 논리적으로 정의한 것|
|내부 스키마(Internal Schema)|전체 데이터베이스의 물리적 저장 형태를 기술하는 것|

## ★ DATABASE Transation
트랜잭션은 하나의 논리적 단위를 구성하는 데이터베이스 연산의 모임이다. 동시에 여러 트랜잭션이 수행되기 위해서 데이터베이스의 일관성이 보장되어야 하며 이를 위해 동시성 제어(concurrency control)와 회복 제어(recovery control)를 위한 모듈이 있으며 이 둘을 합쳐 트랜잭션 관리 모듈(transaction management module)이라고 한다. 데이터베이스 시스템은 각각의 트랜잭션에 대해 **원자성(Atomicity), 일관성(Consistency), 고립성(Isolation), 영구성(Durability)** 을 보장한다.

* 동시성제어 모듈(concurreny control module): 데이터베이스를 일관성 있게 유지하기 위하여 동시에 수행되는 트랜잭션들 사이의 상호작용을 제어한다.
* 회복제어 모듈(recovery control module): 데이터베이스를 일관성 있게 유지하기 위하여 업데이트를 하는 동안 시스템 장애에도 데이터베이스의 기존 상태가 유지된다.

### # ACID
ACID(원자성, 일관성, 고립성, 지속성)는 데이터베이스 트랜잭션이 안전하게 수행된다는 것을 보장하기 위한 성질을 가리키는 약어이다.

* **원자성(Atomicity)** : 트랜잭션과 관련된 작업들이 부분적으로 실행되다가 중단되지 않는 것을 보장하는 능력이다. 예를 들어, 자금 이체는 성공할 수도 실패할 수도 있지만 보내는 쪽에서 돈을 빼 오는 작업만 성공하고 받는 쪽에 돈을 넣는 작업을 실패해서는 안된다. 원자성은 이와 같이 중간 단계까지 실행되고 실패하는 일이 없도록 하는 것이다.
* **일관성(Consistency)** : 트랜잭션이 실행을 성공적으로 완료하면 언제나 일관성 있는 데이터베이스 상태로 유지하는 것을 의미한다. 무결성 제약이 모든 계좌는 잔고가 있어야 한다면 이를 위반하는 트랜잭션은 중단된다.
* **고립성(Isolation)** : 트랜잭션을 수행 시 다른 트랜잭션의 연산 작업이 끼어들지 못하도록 보장하는 것을 의미한다. 이것은 트랜잭션 밖에 있는 어떤 연산도 중간 단계의 데이터를 볼 수 없음을 의미한다. 은행 관리자는 이체 작업을 하는 도중에 쿼리를 실행하더라도 특정 계좌간 이체하는 양 쪽을 볼 수 없다. 공식적으로 고립성은 트랜잭션 실행내역은 연속적이어야 함을 의미한다. 성능관련 이유로 인해 이 특성은 가장 유연성 있는 제약 조건이다. 자세한 내용은 관련 문서를 참조해야 한다.
* **지속성(Durability)** : 성공적으로 수행된 트랜잭션은 영원히 반영되어야 함을 의미한다. 시스템 문제, DB 일관성 체크 등을 하더라도 유지되어야 함을 의미한다. 전형적으로 모든 트랜잭션은 로그로 남고 시스템 장애 발생 전 상태로 되돌릴 수 있다. 트랜잭션은 로그에 모든 것이 저장된 후에만 commit 상태로 간주될 수 있다.

## ★ DATABASE Feature
1. 실시간 접근성
2. 지속적인 변화
3. 동시 공유
4. 내용에 대한 참조
5. 데이터 논리적 독립성

### DATABASE Advantage
1. 데이터 중복 최소화
2. 데이터 공유
3. 일관성, 무결성, 보안성 유지
4. 최신의 데이터 유지
5. 데이터의 표준화 가능
6. 데이터의 논리적, 물리적 독립성
7. 용이한 데이터 접근
8. 데이터 저장 공간 절약

### DATABASE Disadvantage
1. 데이터베이스 전문가 필요
2. 많은 비용 부담
3. 데이터 백업과 복구가 어려움
4. 시스템의 복잡함
5. 대용량 디스크로 엑세스가 집중되면 과부하 발생

## ★ OLTP (Online transaction processing)

<p align="center">
 <img src="https://kr.clustrix.com/wp-content/uploads/2017/06/OLTP-vs-OLAP.jpg" />
</p>

**네트워크상의 여러 이용자가 실시간으로 데이터베이스의 데이터를 갱신하거나 조회하는 등의 단위 작업을 처리하는 방식**을 말한다. 주로 신용카드 조회 업무나 자동 현금 지급 등 금융 전산 관련 부문에서 많이 발생하기 때문에 ‘온라인 거래처리’라고도 한다. 이 방식의 특징은 기존 컴퓨터 통신에서 이용해 온 온라인 방식과 달리 다수의 이용자가 거의 동시에 이용할 수 있도록 송수신 자료를 트랜잭션(데이터 파일의 내용에 영향을 미치는 거래 ·입출고 ·저장 등의 단위 행위) 단위로 압축, 비어 있는 공간을 다른 사용자들이 함께 쓸 수 있도록 한 점이다.

## ★ ORM (Object-relational mapping)
데이터베이스와 객체 지향 프로그래밍 언어 간의 호환되지 않는 데이터를 변환하는 프로그래밍 기법이다. 객체 관계 매핑 라고도 부른다. 객체 지향 언어에서 사용할 수 있는 "가상" 객체 데이터베이스를 구축하는 방법이다.

## ★ DATABASE TYPE

<p align="center">
  <img src="https://www.kdnuggets.com/wp-content/uploads/sql-nosql-dbs.jpg" />
</p>

### ※ Realtional Database (관계형 데이터베이스)
* 관계형 데이터베이스(關係形 Database, Relational Database, 문화어: 관계자료기지, 관계형자료기지, RDB)는 키(key)와 값(value)들의 간단한 관계를 테이블화 시킨 매우 간단한 원칙의 전산정보 데이터베이스이다.

* 관계형 데이터베이스는 데이터 항목 간에 사전 정의된 관계가 있을 때 그러한 데이터 항목들의 모음을 가리킵니다. 이들 항목은 열과 행으로 이루어진 테이블 집합으로 구성됩니다. 테이블은 데이터베이스에 표시할 해당 객체들에 관한 정보를 수록하는 데 사용됩니다. 테이블의 각 열은 특정 종류의 데이터를 수록하며 필드는 속성의 실제 값을 저장합니다. 테이블의 행은 한 객체 또는 엔터티와 관련된 값들의 모음을 나타냅니다. 테이블의 각 행은 기본 키라고 부르는 고유 식별자로 표시할 수 있고 여러 테이블에 있는 행들은 외래 키를 사용하여 상호 연결될 수 있습니다. 이 데이터는 데이터베이스 테이블 자체를 재구성하지 않고도 여러 가지 방법으로 액세스할 수 있습니다.

* * *

### ※ NoSQL Database (Not only sql)
* NoSQL 데이터베이스는 단순 검색 및 추가 작업을 위한 매우 최적화된 키 값 저장 공간으로, 레이턴시와 스루풋과 관련하여 상당한 성능 이익을 내는 것이 목적이다. NoSQL 데이터베이스는 빅데이터와 실시간 웹 애플리케이션의 상업적 이용에 널리 쓰인다. 또, NoSQL 시스템은 SQL 계열 쿼리 언어를 사용할 수 있다는 사실을 강조한다는 면에서 "Not only SQL"로 불리기도 한다.

<p align="center">
 <img src="https://img.deusm.com/informationweek/2014/06/1269559/NoSQL-&-NewSQL.jpg" />
</p>

* NoSQL 데이터베이스는 특정 데이터 모델에 대해 특정 목적에 맞추어 구축되는 데이터베이스로서 현대적인 애플리케이션 구축을 위한 유연한 스키마를 갖추고 있습니다. NoSQL 데이터베이스는 개발의 용이성, 기능성 및 확장성을 널리 인정받고 있습니다. 문서, 그래프, 키 값, 인 메모리, 검색을 포함해 다양한 데이터 모델을 사용합니다.

#### # NoSQL CAP theory

<p align="center">
 <img src="https://media.licdn.com/dms/image/C5112AQGA-kKdKwRMTA/article-inline_image-shrink_1000_1488/0?e=1541635200&v=beta&t=gIk232eRJkR1dJJvF2qUAJ__gghOdd8A4nnmIMHffsQ" />
</p>

* 일관성(Consistency): 모든 노드가 같은 순간에 같은 데이터를 볼 수 있다.
* 가용성(Availability): 모든 요청이 성공 또는 실패 결과를 반환할 수 있다.
* 분할내성(Partition tolerance): 메시지 전달이 실패하거나 시스템 일부가 망가져도 시스템이 계속 동작할 수 있다.

> NoSQL은 AP 또는 CP의 특징을 만족한다. 데이터의 신뢰성보다는 분산에 중점을 둔 방식이므로 약간의 데이터의 유실, 변형 등이 발생하는 것을 감안한다. 하지만 빠르게 확장하여 대규모 데이터를 저장하고 핸들링 할 수 있는 구조를 갖출 수 있도록 한다. 

#### # NoSQL Feature
NoSQL 데이터베이스는 탁월한 사용자 경험을 제공하기 위하여 유연성과 확장성을 비롯해 고성능의 매우 기능적인 데이터베이스를 필요로 하는 모바일, 웹이나 게이밍과 같은 다양한 현대적인 애플리케이션에 적합합니다.

- 관계형 모델을 사용하지 않으며 테이블간의 조인 기능 없음
- 직접 프로그래밍을 하는 등의 비SQL 인터페이스를 통한 데이터 액세스
- 대부분 여러 대의 데이터베이스 서버를 묶어서(클러스터링) 하나의 데이터베이스를 구성
- 관계형 데이터베이스에서는 지원하는 Data처리 완결성(Transaction ACID 지원) 미보장
- 데이터의 스키마와 속성들을 다양하게 수용 및 동적 정의 (Schema-less)
- 데이터베이스의 중단 없는 서비스와 자동 복구 기능지원
- 다수가 Open Source로 제공
- 확장성, 가용성, 높은 성능 

* * *

* 유연성: NoSQL 데이터베이스는 일반적으로 유연한 스키마를 제공하여 보다 빠르고 반복적인 개발을 가능하게 해줍니다. 이같은 유연한 데이터 모델은 NoSQL 데이터베이스를 반정형 및 비정형 데이터에 이상적으로 만들어 줍니다.
* 확장성: NoSQL 데이터베이스는 일반적으로 고가의 강력한 서버를 추가하는 대신 분산형 하드웨어 클러스터를 이용해 확장하도록 설계되었습니다. 일부 클라우드 제공자들은 완전관리형 서비스로서 이런 운영 작업을 보이지 않게 처리합니다.
* 고성능: NoSQL 데이터베이스는 특정 데이터 모델(문서, 키 값, 그래프 등) 및 액세스 패턴에 대해 최적화되어 관계형 데이터베이스를 통해 유사한 기능을 충족하려 할 때보다 뛰어난 성능을 얻게 해줍니다.
* 고기능성: NoSQL 데이터베이스는 각 데이터 모델에 맞추어 특별히 구축된 뛰어난 기능의 API와 데이터 유형을 제공합니다.

#### # NoSQL Database Types
1. Key-value stores are the simplest NoSQL databases. Every single item in the database is stored as an attribute name, or key, together with its value. Examples of key-value stores are Riak and Voldemort. Some key-value stores, such as Redis, allow each value to have a type, such as "integer", which adds functionality.
2. Document databases pair each key with a complex data structure known as a document. Documents can contain many different key-value pairs, or key-array pairs, or even nested documents.
3. Wide-column stores such as Cassandra and HBase are optimized for queries over large datasets, and store columns of data together, instead of rows.
4. Graph stores are used to store information about networks, such as social connections. Graph stores include Neo4J and HyperGraphDB.

* * *

- Key Value DB : Key와 Value의 쌍으로 데이터가 저장되는 가장 단순한 형태의 솔루션으로 Amazon의 Dynamo Paper에서 유래되었습니다. Riak, Vodemort, Tokyo 등의 제품이 많이 알려져 있습니다.
- Wide Columnar Store : Big Table DB라고도 하며, Google의 BigTable Paper에서 유래되었습니다. Key Value 에서 발전된 형태의 Column Family 데이터 모델을 사용하고 있고, HBase, Cassandra, ScyllaDB 등이 이에 해당합니다.
- Document DB : Lotus Notes에서 유래되었으며, JSON, XML과 같은 Collection 데이터 모델 구조를 채택하고 있습니다. MongoDB, CoughDB가 이 종류에 해당합니다.
- Graph DB : Euler & Graph Theory에서 유래한 DB입니다. Nodes, Relationship, Key-Value 데이터 모델을 채용하고 있습니다. Neo4J, OreientDB 등의 제품이 있습니다.

## REFERENCE
* [Reference URL Site List](https://github.com/ChangYeop-Yang/Study-DataBase/issues/4) :smile:
* [Reference Book Site List](https://github.com/ChangYeop-Yang/Study-DataBase/issues/5) :smiley:
