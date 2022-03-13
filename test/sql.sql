create database mbti default character set utf8;

create user 'kosmo'@'localhost' identified by 'kosmo'; 
create user 'kosmo'@'%' identified by 'kosmo';


grant all privileges on mbti.* To 'kosmo'@'localhost'; 
grant all privileges on mbti.* To 'kosmo'@'%';


CREATE TABLE `USER` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`NAME`	VARCHAR(255)	NOT NULL,
	`PASSWORD`	VARCHAR(255)	NOT NULL,
	`BIRTHDAY`	VARCHAR(255)	NOT NULL,
	`GENDER`	VARCHAR(255) NOT NULL,
	`LOCATION`	VARCHAR(255)	NOT NULL,
	`PHONE_NUM`	VARCHAR(255) NOT	NULL,
	`JOIN_DATE`	DATETIME	NOT NULL,
	`ADMIN`	BOOLEAN	default false,
	`PROFILE_IMAGE`	VARCHAR(255) 	NULL,
	`MODIFIED_DAY`	DATETIME	NULL,
	`USER_AVAILABLE`	BOOLEAN	default false,
	`MBTI_PATH`	VARCHAR(255) 	NULL,
	`MBTI_ID`	INT	NOT NULL,
    PRIMARY KEY(`USER_ID`)
);

 


CREATE TABLE `PARTY` (
	`PARTY_ID`	INT auto_increment	NOT NULL,
	`PARTY_TITLE`	VARCHAR(255) 	NOT NULL,
	`PARTY_CREATOR`	VARCHAR(255) 	NOT NULL,
	`PARTY_PRE_MBTI1`	VARCHAR(255) NOT NULL,
	`PARTY_PRE_MBTI2`	VARCHAR(255) 	NULL,
	`PARTY_PRE_MBTI3`	VARCHAR(255) 	NULL,
	`PARTY_PRE_MBTI4`	VARCHAR(255) 	NULL,
	`CATEGORY_NAME`	VARCHAR(255) 	NOT NULL,
	`PARTY_INTRODUCE`	VARCHAR(255) NOT NULL,
	`PARTY_LOCATION`	VARCHAR(255) 	NOT NULL,
	`PARTY_TUMB_PATH`	VARCHAR(255)   NULL,
	`PARTY_MAXIMUM`	INT	NOT NULL,
	`PARTY_RATE1`	DOUBLE	default 0,
	`PARTY_RATE2`	DOUBLE	default 0,
	`PARTY_RATE3`	DOUBLE	default 0,
	`PARTY_REG_DATE`	DATETIME DEFAULT NOW(),
	`PARTY_AVAILABLE`	BOOLEAN	default true,
    PRIMARY KEY(`PARTY_ID`)
);



CREATE TABLE `MEMBER_LIST` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    `PARTY_REQUEST` BOOLEAN DEFAULT FALSE,
    `REG_DATE` DATETIME DEFAULT NOW(),
    PRIMARY KEY(`USER_ID`,`PARTY_ID`)
);




CREATE TABLE `BOARD` (
	`ART_ID`	INT	auto_increment NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
	`ART_TITLE`	VARCHAR(255) 	NOT NULL,
	`ART_WRITER`	VARCHAR(255) 	NOT NULL,
	`ART_CONTENT`	VARCHAR(255) 	NOT NULL,
	`ART_IMG_PATH`	VARCHAR(255) 	NULL,
	`ART_VIEW_CNT`	INT	default 0,
	`ART_REG_DATE`	DATETIME	DEFAULT NOW(),
	`ART_MOD_DATE`	DATETIME	NULL,
	`ART_AVAILABLE`	BOOLEAN	default true,
	`ART_USER_NAME` VARCHAR(255)  ,
    PRIMARY KEY(`ART_ID`,`PARTY_ID`)
);


CREATE TABLE `BOARD_COMMENT` (
	`ART_COMMENT_ID`	INT	auto_increment NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
	`ART_ID`	INT	NOT NULL,
	`ART_COMMENT_USER_NAME`	VARCHAR(255) 	NOT NULL,
	`ART_COMMENT_WRITER`	VARCHAR(255) 	NOT NULL,
	`ART_COMMENT_CONTENT`	VARCHAR(255) 	NOT NULL,
	`ART_COMMENT_REG_DATE`	DATETIME	DEFAULT NOW(),
	`ART_COMMENT_MOD_DATE`	DATETIME	NULL,
	`ART_COMMENT_AVAILABLE`	BOOLEAN	default true,
     PRIMARY KEY(`ART_COMMENT_ID`,`PARTY_ID`,`ART_ID`)
);

CREATE TABLE `ALBUM` (
	`ALB_ID`	INT	 auto_increment NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    `ALB_WRITER` VARCHAR(255) NOT NULL,
	`USER_ID`	VARCHAR(255) NOT NULL,
	`ALB_IMG_PATH`	VARCHAR(255) NOT NULL,
	`ALB_REG_DATE`	DATETIME DEFAULT now(),
	`ALB_AVAILABLE`	BOOLEAN	default true,
    PRIMARY KEY(`ALB_ID`,`PARTY_ID`)
);

CREATE TABLE `SCHEDULE` (
	`SCH_ID`	INT auto_increment	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    `USER_ID` VARCHAR(255) NOT NULL,
	`SCH_TITLE`	VARCHAR(255) 	NOT NULL,
	`SCH_WRITER`	VARCHAR(255) 	NOT NULL,
	`SCH_CONTENT`	VARCHAR(255) 	NOT NULL,
	`SCH_LOCATION`	VARCHAR(255) 	NOT NULL,
	`SCH_NOTE`	VARCHAR(255) 	NOT NULL,
	`SCH_MEMBER_COUNT`	INT	DEFAULT 1,
	`SCH_DATE`	DATETIME	NOT NULL,
	`SCH_AVAILABLE`	BOOLEAN	default true,
    PRIMARY KEY(`SCH_ID`,`PARTY_ID`)
);


CREATE TABLE `CHAT` (
	`Key`	INT	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    PRIMARY KEY(`Key`,`PARTY_ID`)
);



CREATE TABLE `SCHEDULE_MEMBER` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`SCH_ID`	INT	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    `RATE1` INT NULL default 1,
	`RATE2` INT NULL default 1,
    `RATE3` INT NULL default 1,
    PRIMARY KEY(`USER_ID`,`SCH_ID`,`PARTY_ID`)
);


CREATE TABLE `MEMBER_FAV` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    PRIMARY KEY(`USER_ID`,`PARTY_ID`)
);


CREATE TABLE `SUBSCRIBE` (
	`PARTY_ID`	INT	NOT NULL,
	`PRICE`	INT	NOT NULL,
	`PAY_DAY`	DATETIME	NOT NULL,
	`PERIODE`	DATETIME	NOT NULL,
    PRIMARY KEY(`PARTY_ID`)
);


CREATE TABLE `REPORT_BOARD` (
	`REP_BOA_ID`	INT auto_increment	NOT NULL,
	`REP_CATEGORY_NAME`	VARCHAR(255) 	NOT NULL,
	`REP_TITLE`	VARCHAR(255) 	NOT NULL,
	`REP_BOA_WRITER`	VARCHAR(255) 	NOT NULL,
	`REP_BOA_CONTENT`	VARCHAR(255) 	NOT NULL,
	`REP_BOA_IMG_PATH`	VARCHAR(255) 	NULL,
	`REP_REG_DATE`	DATETIME	DEFAULT NOW(),
    PRIMARY KEY(`REP_BOA_ID`)
);




CREATE TABLE `REPORT_COMMENT` (
	`REP_COM_ID`	INT auto_increment	NOT NULL,
	`REP_BOA_ID`	INT	NOT NULL,
	`REP_COM_WRITER`	VARCHAR(255) 	NOT NULL,
	`REP_COM_CONTENT`	VARCHAR(255) 	NOT NULL,
	`REP_COM_BOA_REG_DATE`	DATETIME	NOT NULL,
    PRIMARY KEY(`REP_COM_ID`,`REP_BOA_ID`)
);


CREATE TABLE `LIKE_LIST` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`ALBUM_ID`	INT	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
    PRIMARY KEY(`USER_ID`,	`ALBUM_ID`,	`PARTY_ID`)
);

CREATE TABLE `ALBUM_COMMENT` (
	`ALB_COMMENT_ID`	INT auto_increment	NOT NULL,
	`PARTY_ID`	INT	NOT NULL,
	`ALB_ID`	INT	NOT NULL,
	`USER_ID`	VARCHAR(255) NOT NULL,
    `USER_NAME` VARCHAR(255) NOT NULL,
	`ALB_COMMENT_CONTENT`	VARCHAR(255) 	NOT NULL,
	`ALB_COMMENT_REG_DATE`	DATETIME DEFAULT NOW(),
	`ALB_COMMENT_MOD_DATE`	DATETIME NULL,
	`ALB_COMMENT_AVAILABLE`	BOOLEAN	default true,
    PRIMARY KEY(`ALB_COMMENT_ID`,`PARTY_ID`,`ALB_ID`)
);


CREATE TABLE `MBTI` (
	`MBTI_ID`	INT auto_increment	NOT NULL,
	`MBTI_IMG_PATH`	VARCHAR(255) 	NULL,
	`MBTI_NAME`	VARCHAR(255) 	NOT NULL,
    PRIMARY KEY(`MBTI_ID`)
);

CREATE TABLE `CATEGORY` (
	`CATEGORY_NAME`	VARCHAR(255) 	NOT NULL,
    `CATEGORY_VALUE` VARCHAR(255) NOT NULL,
	`CATEGORY_IMG_PATH`	VARCHAR(255) 	NULL,
    PRIMARY KEY(`CATEGORY_NAME`)
);


CREATE TABLE `REPORT_CATEGORY` (
	`REP_CATEGORY_NAME`	VARCHAR(255) 	NOT NULL,
    `REP_CATEGORY_VALUE`	VARCHAR(255) 	NOT NULL,
	`CATEGORY_IMG_PATH`	VARCHAR(255) 	NULL,
    PRIMARY KEY(`REP_CATEGORY_NAME`)
);


CREATE TABLE `QNA` (
	`QNA_ID`	VARCHAR(255) 	NOT NULL,
	`Question`	VARCHAR(255) 	NOT NULL,
	`Answer`	VARCHAR(255) 	NOT NULL,
    PRIMARY KEY(`QNA_ID`)
);

CREATE TABLE `registry` (
	`USER_ID`	VARCHAR(255)	NOT NULL,
	`request`	boolean	NOT NULL	DEFAULT FALSE,
    PRIMARY KEY(`USER_ID`)
);
ALTER TABLE `registry` ADD CONSTRAINT `FK_USER_TO_registry_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;


ALTER TABLE `USER` ADD CONSTRAINT `FK_MBTI_TO_USER_1` FOREIGN KEY (
	`MBTI_ID`
)
REFERENCES `MBTI` (
	`MBTI_ID`
);

ALTER TABLE `PARTY` ADD CONSTRAINT `FK_CATEGORY_TO_PARTY_1` FOREIGN KEY (
	`CATEGORY_NAME`
)
REFERENCES `CATEGORY` (
	`CATEGORY_NAME`
);





ALTER TABLE `MEMBER_LIST` ADD CONSTRAINT `FK_USER_TO_MEMBER_LIST_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;


ALTER TABLE `MEMBER_LIST` ADD CONSTRAINT `FK_PARTY_TO_MEMBER_LIST_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `BOARD` ADD CONSTRAINT `FK_PARTY_TO_BOARD_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `BOARD_COMMENT` ADD CONSTRAINT `FK_BOARD_TO_BOARD_COMMENT_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `BOARD` (
	`PARTY_ID`
);

ALTER TABLE `BOARD_COMMENT` ADD CONSTRAINT `FK_BOARD_TO_BOARD_COMMENT_2` FOREIGN KEY (
	`ART_ID`
)
REFERENCES `BOARD` (
	`ART_ID`
);

ALTER TABLE `ALBUM` ADD CONSTRAINT `FK_PARTY_TO_ALBUM_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `SCHEDULE` ADD CONSTRAINT `FK_PARTY_TO_SCHEDULE_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `CHAT` ADD CONSTRAINT `FK_PARTY_TO_CHAT_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `SCHEDULE_MEMBER` ADD CONSTRAINT `FK_USER_TO_SCHEDULE_MEMBER_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;


ALTER TABLE `SCHEDULE_MEMBER` ADD CONSTRAINT `FK_SCHEDULE_TO_SCHEDULE_MEMBER_1` FOREIGN KEY (
	`SCH_ID`
)
REFERENCES `SCHEDULE` (
	`SCH_ID`
);

ALTER TABLE `SCHEDULE_MEMBER` ADD CONSTRAINT `FK_SCHEDULE_TO_SCHEDULE_MEMBER_2` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `SCHEDULE` (
	`PARTY_ID`
);

ALTER TABLE `MEMBER_FAV` ADD CONSTRAINT `FK_USER_TO_MEMBER_FAV_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;


ALTER TABLE `MEMBER_FAV` ADD CONSTRAINT `FK_PARTY_TO_MEMBER_FAV_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `SUBSCRIBE` ADD CONSTRAINT `FK_PARTY_TO_SUBSCRIBE_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `PARTY` (
	`PARTY_ID`
);

ALTER TABLE `REPORT_BOARD` ADD CONSTRAINT `FK_REPORT_CATEGORY_TO_REPORT_BOARD_1` FOREIGN KEY (
	`REP_CATEGORY_NAME`
)
REFERENCES `REPORT_CATEGORY` (
	`REP_CATEGORY_NAME`
);

ALTER TABLE `REPORT_BOARD` ADD CONSTRAINT `FK_USER_TO_REPORT_BOARD_1` FOREIGN KEY (
	`REP_BOA_WRITER`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;



ALTER TABLE `REPORT_COMMENT` ADD CONSTRAINT `FK_REPORT_BOARD_TO_REPORT_COMMENT_1` FOREIGN KEY (
	`REP_BOA_ID`
)
REFERENCES `REPORT_BOARD` (
	`REP_BOA_ID`
);

ALTER TABLE `LIKE_LIST` ADD CONSTRAINT `FK_USER_TO_LIKE_LIST_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
)
ON DELETE CASCADE;


ALTER TABLE `LIKE_LIST` ADD CONSTRAINT `FK_ALBUM_TO_LIKE_LIST_1` FOREIGN KEY (
	`ALBUM_ID`
)
REFERENCES `ALBUM` (
	`ALB_ID`
);

ALTER TABLE `LIKE_LIST` ADD CONSTRAINT `FK_ALBUM_TO_LIKE_LIST_2` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `ALBUM` (
	`PARTY_ID`
);

ALTER TABLE `ALBUM_COMMENT` ADD CONSTRAINT `FK_ALBUM_TO_ALBUM_COMMENT_1` FOREIGN KEY (
	`PARTY_ID`
)
REFERENCES `ALBUM` (
	`PARTY_ID`
);

ALTER TABLE `ALBUM_COMMENT` ADD CONSTRAINT `FK_ALBUM_TO_ALBUM_COMMENT_2` FOREIGN KEY (
	`ALB_ID`
)
REFERENCES `ALBUM` (
	`ALB_ID`
);

INSERT INTO `MBTI` (MBTI_NAME)
VALUES ('ISTJ'),
('ISFJ'),
('INFJ'),
('INTJ'),
('ISTP'),
('ISFP'),
('INFP'),
('INTP'),
('ESTP'),
('ESFP'),
('ENFP'),
('ENTP'),
('ESTJ'),
('ESFJ'),
('ENFJ'),
('ENTJ');

INSERT INTO `CATEGORY` (CATEGORY_NAME,CATEGORY_VALUE)
VALUES 
('인문학/책/글','liberal'),
('아웃도어/여행','outdoor'),
('업종/직무','business'),
('외국/언어','foreign'),
('문화/공연/축제','culture'),
('음악/악기','music'),
('공예/만들기','crafts'),
('댄스/무용','dance'),
('봉사활동','volunteer'),
('사교/인맥','social'),
('차/오토바이','vehicle'),
('사진/영상','media'),
('게임/오락','game'),
('요리/제조','cook'),
('반려동물','pet'),
('가족/결혼','marriage'),
('자유주제','free');

select * from category;

INSERT INTO `REPORT_CATEGORY` (REP_CATEGORY_NAME,REP_CATEGORY_VALUE)
VALUES 
('문의','inquiry'),
('신고','report');


INSERT INTO USER (USER_ID,NAME,PASSWORD,BIRTHDAY,GENDER,LOCATION,
PHONE_NUM,JOIN_DATE,ADMIN,PROFILE_IMAGE,MODIFIED_DAY,USER_AVAILABLE,
MBTI_PATH,MBTI_ID)
VALUES
('ADMIN16','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,3),
('ADMIN1','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,2),
('ADMIN2','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,3),
('ADMIN3','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,4),
('ADMIN4','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,5),
('ADMIN5','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,5),
('ADMIN6','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,6),
('ADMIN7','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,7),
('ADMIN8','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,8),
('ADMIN9','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,9),
('ADMIN10','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,10),
('ADMIN11','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,11),
('ADMIN12','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,12),
('ADMIN13','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,13),
('ADMIN14','관리자','admin123',now(),'female','Korea',01012345678,now(),true,null,null,true,null,14),
('ADMIN15','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,14);
INSERT INTO USER (USER_ID,NAME,PASSWORD,BIRTHDAY,GENDER,LOCATION,
PHONE_NUM,JOIN_DATE,ADMIN,PROFILE_IMAGE,MODIFIED_DAY,USER_AVAILABLE,
MBTI_PATH,MBTI_ID)
VALUES
('로그인미구현대체','관리자','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,1);

select * from USER join MBTI on user.MBTI_ID=mbti.MBTI_ID;

INSERT INTO USER (USER_ID,NAME,PASSWORD,BIRTHDAY,GENDER,LOCATION,
PHONE_NUM,JOIN_DATE,ADMIN,PROFILE_IMAGE,MODIFIED_DAY,USER_AVAILABLE,
MBTI_PATH,MBTI_ID)
VALUES
('로그인미구현','로그인용','admin123',now(),'male','Korea',01012345678,now(),true,null,null,true,null,1);


INSERT INTO `PARTY` (PARTY_title,PARTY_creator,PARTY_PRE_MBTI1,
CATEGORY_NAME,PARTY_INTRODUCE,
PARTY_LOCATION,PARTY_MAXIMUM,PARTY_REG_DATE)
 VALUES('테스트용 그룹','관리자','ENTP','업종/직무','열심히 코딩하는 곳입니다','한국소프트웨어인재개발원',30,now()),
 ('테스트용 그룹2','관리자','ENTP','업종/직무','열심히 코딩하는 곳입니다','한국소프트웨어인재개발원',30,now());








INSERT INTO `board` (PARTY_ID,ART_TITLE,ART_WRITER,ART_CONTENT,ART_IMG_PATH,
ART_REG_DATE)
VALUES(1,'테스트용 게시글입니다','관리자','테스트용 내용입니다.',null,now());

select g.PARTY_TITLE,b.ART_TITLE,b.ART_WRITER,b.ART_CONTENT,b.ART_IMG_PATH,
b.ART_REG_DATE from board b join `PARTY` g on b.PARTY_id=g.PARTY_id;



SELECT A.ALB_ID, A.PARTY_ID, L.USER_ID, A.USER_ID, ALB_IMG_PATH,ALB_REG_DATE,ALB_AVAILABLE, COUNT(L.USER_ID) as likeCnt FROM ALBUM a left outer join like_list l
	on a.alb_id=l.ALBUM_ID
	WHERE ALB_AVAILABLE=TRUE AND a.PARTY_ID="1"
    group by ALBUM_ID
	ORDER BY ALB_ID DESC
	LIMIT 10 OFFSET 0;
    
    SELECT * FROM ALBUM 
	WHERE ALB_AVAILABLE=TRUE AND PARTY_ID="1" 
	ORDER BY ALB_ID DESC
	LIMIT 10 OFFSET 0;

insert into member_list values ('admin2',2,1,now()),
('admin3',2,1,now()),
('admin4',2,1,now()),
('admin5',2,1,now()),
('admin6',2,1,now()),
('admin7',2,1,now()),
('admin8',2,1,now()),
('admin9',2,1,now()),
('admin10',2,1,now()),
('admin11',2,1,now()),
('admin12',2,1,now()),
('admin13',2,1,now()),
('admin14',2,1,now());

insert into member_list (USER_ID,PARTY_ID,PARTY_REQUEST) values 
('admin15',1,true),
('admin2',1,true),
('admin3',1,true),
('admin4',1,true),
('admin5',1,true),
('admin6',1,true),
('admin7',1,true),
('admin8',1,true),
('admin9',1,true),
('admin10',1,true),
('admin11',1,true),
('admin12',1,true),
('admin13',1,true),
('admin14',1,true);

