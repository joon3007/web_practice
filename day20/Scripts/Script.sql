SELECT * FROM "MEMBER";

INSERT INTO "MEMBER" values('joon1','1234','ddd',10,'남자','dfdf','dfdf','Dfdf','dfdf','dfdd');

INSERT INTO HR."MEMBER"
(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_AGE, MEMBER_GENDER, MEMBER_EMAIL, MEMBER_ZIPCODE, MEMBER_ADDRESS, MEMBER_ADDRESS_DETAIL, MEMBER_ADDRESS_ETC)
VALUES('', '', '', 0, '', '', '', '', '', '');

ALTER TABLE "MEMBER" add(ADMIN varchar2(5) DEFAULT NULL);

UPDATE "MEMBER" 
SET ADMIN = 1
WHERE MEMBER_ID ='joon';