DROP TABLE MEMBER;

CREATE TABLE "MEMBER"(
	member_id varchar2(50),
	member_pw varchar2(50),
	member_name varchar2(50),
	member_age number(3),
	member_gender varchar2(20),
	member_email varchar2(100),
	member_zipcode varchar2(20),
	member_address varchar2(200),
	member_address_detail varchar2(200),
	member_address_etc varchar2(200),
	CONSTRAINT MEMBER_pk PRIMARY key(member_id)
);

SELECT * FROM "MEMBER";

