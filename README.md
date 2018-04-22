# mongoDB_JPA_Start03
Spring Data MongoDB + JSP + WebSocket(SockJS 활용) 간단한 채팅 메시징 처리 구현

## Issues
- MongoDB에서 Document 간의 관계성을 @DBRef 어노테이션을 이용해서 보장을 하는 연습을 진행합니다.
- WebSocket에 대한 개념을 SockJS를 기반으로 하여 공부를 진행합니다.
- STOMP를 기반으로 실시간으로 메시지를 전송하여 데이터베이스와 연동해서 결과를 반환해 채팅 시스템을 구현하는 연습을 진행합니다.

## Study Docs
스터디 자료는 현재 프로젝트의 `src > doc` 파일에 PDF 파일로 제공을 하였습니다.
 
스터디 자료는 향시에 수정이 될 수 있으니 이 점 참고하시길 바라겠습니다.

[스터디 자료 참고하기](https://github.com/tails5555/mongoDB_JPA_Start03/blob/master/src/doc/MongoDB%2BSpringJPA_04_MongoDB_SockJS_%EC%A0%91%EB%AA%A9.pdf)

## Maven pom.xml
`pom.xml` 를 기반으로 Maven Dependency를 구성하여 Update Maven은 필수입니다

```
<dependencies>
	<!-- 1. Spring Boot Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	<!-- 2. Spring WebSocket Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-websocket</artifactId>
	</dependency>
	<!-- 3. Spring Data MongoDB Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-data-mongodb</artifactId>
	</dependency>
	<!-- 4. Tomcat Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-tomcat</artifactId>
		<scope>provided</scope>
	</dependency>
	<!-- 5. Spring Test Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-test</artifactId>
		<scope>test</scope>
	</dependency>
	<!-- 6. Lombok Project -->
	<!-- Lombok은 각 인스턴스들에 대해서 getter, setter, toString, equals, hashCode 등의 구현을 자동으로 해 주는 프로젝트이다. -->
	<dependency>
		<groupId>org.projectlombok</groupId>
		<artifactId>lombok</artifactId>
		<version>1.16.20</version>
	</dependency>
</dependencies>
```

## application.properties 설정
- src > main > resources > application.properties에 현존하는 설정을 아래와 같은 방식으로 작성해서 이용하시면 됩니다.

```
spring.data.mongodb.host=[호스트 입력. localhost는 127.0.0.1입니다.]
spring.data.mongodb.port=[포트 번호 입력. 대부분 27017를 적용하지만, 클러스터링에 따라 27018, 27019 등을 쓸 수도 있습니다.]
spring.data.mongodb.database=[데이터베이스 입력]
spring.data.mongodb.username=[사용자 이름 입력]
spring.data.mongodb.password=[비밀번호 입력]
```

## Screenshot
![example04_result01](/src/doc/example04_result01.jpg "example04_result01")

작동 이후에 사용자 이름을 입력하고 난 이후에 접속하기 버튼을 클릭하면 우측과 같이 SockJS WebSocket를 통해 접속이 완료되었음을 안내합니다.

![example04_result02](/src/doc/example04_result02.jpg "example04_result02")

현재 사용자와 타 사용자 끼리 채팅을 하는 장면[1]

![example04_result03](/src/doc/example04_result03.jpg "example04_result03")

현재 사용자와 타 사용자 끼리 채팅을 하는 장면[2]

![example04_result04](/src/doc/example04_result04.jpg "example04_result04")

현재 사용자와 타 사용자 끼리 채팅한 내용들이 MongoDB에 저장되는 장면입니다.

## Author
- [강인성](https://github.com/tails5555)