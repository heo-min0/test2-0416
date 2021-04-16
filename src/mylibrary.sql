DROP TABLE MYLIBRARY
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_WISH;

CREATE TABLE MYLIBRARY (
   MEMBERNUMFK NUMBER,
   WISHSEQ NUMBER PRIMARY KEY,
    WISHBOOK NUMBER,
    READBOOK NUMBER
);

ALTER TABLE MYLIBRARY ADD
CONSTRAINT FK_MYOFFICE1_05 FOREIGN KEY(MEMBERNUMFK) 
REFERENCES MEMBERS(MEMBERNUM)

ALTER TABLE MYLIBRARY ADD
CONSTRAINT FK_MYOFFICE1_02 FOREIGN KEY(WISHBOOK)
REFERENCES BOOK(BOOKNUM)

ALTER TABLE MYLIBRARY ADD
CONSTRAINT FK_MYOFFICE1_03 FOREIGN KEY(READBOOK)
REFERENCES BOOK(BOOKNUM)

    
CREATE SEQUENCE SEQ_WISH
START WITH 1
INCREMENT BY 1;


SELECT * FROM MYLIBRARY
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10000);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 101, 10001);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10002);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10003);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10004);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10005);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10006);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10007);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10008);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10009);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10010);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10011);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10012);
INSERT INTO MYLIBRARY(WISHSEQ, MEMBERNUM, WISHBOOK)
VALUES(SEQ_WISH.NEXTVAL, 100, 10013);

SELECT * FROM MYLIBRARY


 SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, RNUM 
 FROM (SELECT ROW_NUMBER()OVER(ORDER BY REVSEQ DESC) AS RNUM, BO.BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER 
      FROM REVIEW RE, BOOK BO 
        WHERE RE.BOOKNUM = BO.BOOKNUM
        AND RE.MEMBERNUM = 100)       
         WHERE RNUM >= 1 AND RNUM <= 3
         
UPDATE MYLIBRARY SET READBOOK=0
WHERE MEMBERNUMFK=109 AND WISHBOOK=10187

SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM,
		BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
		FROM MYLIBRARY M, BOOK B
		WHERE M.WISHBOOK = B.BOOKNUM AND B.BOOKNUM>0
		AND M.MEMBERNUMFK = 109 )
WHERE RNUM >= 1 AND RNUM <= 10

SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM,
		BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
		FROM MYLIBRARY M, BOOK B
		WHERE M.READBOOK = B.BOOKNUM AND B.BOOKNUM > 0
		AND M.MEMBERNUMFK = 109 )
WHERE RNUM >= 1 AND RNUM <= 10

SELECT COUNT(*)
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM,
		BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
		FROM MYLIBRARY M, BOOK B
		WHERE M.WISHBOOK = B.BOOKNUM
		AND M.MEMBERNUMFK = 109
		 AND B.BOOKNUM > 0)
		
SELECT COUNT(*)
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM,
		BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
		FROM MYLIBRARY M, BOOK B
		WHERE M.READBOOK = B.BOOKNUM
		AND M.MEMBERNUMFK = 109
		 AND B.BOOKNUM > 0)