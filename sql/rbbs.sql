DROP TABLE RBBS;

CREATE TABLE RBBS
(
    RBBS_ID    NUMBER(10) NOT NULL,
    BBS_ID    NUMBER(10) NOT NULL,
    MANAGEMENT_ID    NUMBER(10) NOT NULL,
    NICKNAME    VARCHAR2(36) NOT NULL,
    CDATE    TIMESTAMP DEFAULT SYSDATE NOT NULL,
    UDATE    TIMESTAMP DEFAULT SYSDATE NOT NULL,
    BCONTENT    CLOB NOT NULL
);

COMMENT ON COLUMN RBBS.RBBS_ID IS '댓글번호';

COMMENT ON COLUMN RBBS.BBS_ID IS '게시글번호';

COMMENT ON COLUMN RBBS.MANAGEMENT_ID IS '내부관리용아이디';

COMMENT ON COLUMN RBBS.NICKNAME IS '작성자이름(별칭)';

COMMENT ON COLUMN RBBS.CDATE IS '작성일';

COMMENT ON COLUMN RBBS.UDATE IS '수정일';

COMMENT ON COLUMN RBBS.BCONTENT IS '본문내용';

COMMENT ON TABLE RBBS IS '댓글';

CREATE UNIQUE INDEX RBBS_PK ON RBBS
( RBBS_ID,BBS_ID,MANAGEMENT_ID );

ALTER TABLE RBBS
 ADD CONSTRAINT RBBS_PK PRIMARY KEY ( RBBS_ID,BBS_ID,MANAGEMENT_ID)
 USING INDEX RBBS_PK;

ALTER TABLE RBBS
ADD CONSTRAINT RBBSTB_BBS_ID_FK
FOREIGN KEY (BBS_ID)
REFERENCES BBS(BBS_ID);

ALTER TABLE RBBS
ADD CONSTRAINT RBBSTB_MANAGEMENT_ID_FK
FOREIGN KEY (MANAGEMENT_ID)
REFERENCES MEMBER(MANAGEMENT_ID);