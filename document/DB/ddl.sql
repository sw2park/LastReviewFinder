-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    userid VARCHAR2(100) PRIMARY KEY,   -- 사용자 ID
    userpw VARCHAR2(200) NOT NULL,      -- 비밀번호
    username VARCHAR2(100) UNIQUE NOT NULL,  -- 사용자 이름 (UNIQUE 제약조건)
    usergrade VARCHAR2(10) DEFAULT 'BASIC' CHECK (usergrade IN ('ADMIN', 'BASIC')),  -- 사용자 등급 (ADMIN 또는 BASIC)
    profile VARCHAR2(3000)              -- 사용자 프로필 (텍스트 최대 3000자로 설정)
);

-- MOVIE_DB 테이블 생성
CREATE TABLE MOVIE_DB (
    movie_num NUMBER(10) PRIMARY KEY,   -- 영화 고유 번호
    movie_title VARCHAR2(300) NOT NULL, -- 영화 제목
    movie_date DATE NOT NULL,                    -- 영화 개봉일
    movie_plot VARCHAR2(3000),          -- 영화 줄거리 (텍스트 최대 3000자)
    movie_genre VARCHAR2(100),          -- 영화 장르
    movie_poster VARCHAR2(4000),        -- 영화 포스터 URL (최대 4000자, 다수의 URL 허용)
    movie_still_image VARCHAR2(2000),   -- 영화 스틸컷 이미지 URL (최대 4000자)
    movie_star_rate NUMBER(10), 		-- 영화 평점
    movie_actor VARCHAR2(3000),         -- 출연 배우 목록 (큰 크기 지정)
    movie_director VARCHAR2(500),       -- 감독 정보
    movie_rate_cnt NUMBER(10) DEFAULT 0, -- 평점 수
    UNIQUE (movie_title, movie_date)	-- 유니크 조합 설정
);

-- movie_num에 사용할 시퀀스(번호)
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1
;

-- BOXOFFICE_RANK 테이블 생성
CREATE TABLE BOXOFFICE_RANK (
    movie_num NUMBER(10),               -- 영화 고유 번호
    movie_rank NUMBER(5) NOT NULL,      -- 박스오피스 순위
    boxoffice_date DATE NOT NULL,       -- 박스오피스 날짜
    PRIMARY KEY (movie_num, boxoffice_date),  -- 복합 키 설정
    FOREIGN KEY (movie_num) REFERENCES MOVIE_DB(movie_num) ON DELETE CASCADE -- 외래 키 제약조건
);

-- COMMENT 테이블 생성
CREATE TABLE "COMMENT" (
    comment_num NUMBER(10) PRIMARY KEY, -- 댓글 고유 번호
    userid VARCHAR2(100),             	-- 작성자 아이디
    username VARCHAR2(100),				-- 작성자 이름
    movie_num NUMBER(10),               -- 영화 번호
    comment_contents VARCHAR2(3000) NOT NULL, -- 댓글 내용 (텍스트 최대 3000자)
    comment_date DATE DEFAULT SYSDATE,  -- 댓글 작성 날짜
    comment_like NUMBER(10) DEFAULT 0,  -- 좋아요 수
    FOREIGN KEY (userid) REFERENCES MEMBER(userid) ON DELETE CASCADE, 
    FOREIGN KEY (username) REFERENCES MEMBER(username) ON DELETE CASCADE, 
    FOREIGN KEY (movie_num) REFERENCES MOVIE_DB(movie_num) ON DELETE CASCADE
);

CREATE SEQUENCE comment_seq
START WITH 1
INCREMENT BY 1
;

-- USER_COMMENT 테이블 생성
CREATE TABLE USER_COMMENT (
    userid VARCHAR2(100),              -- 사용자 ID
    comment_num NUMBER(10),            -- 댓글 번호
    FOREIGN KEY (userid) REFERENCES MEMBER(userid) ON DELETE CASCADE,
    FOREIGN KEY (comment_num) REFERENCES "COMMENT"(comment_num) ON DELETE CASCADE,
    PRIMARY KEY (userid, comment_num)  -- 복합 키 설정
);

-- MOVIE_WISH_LIST 테이블 생성
CREATE TABLE MOVIE_WISH_LIST  (
    userid VARCHAR2(100),              -- 사용자 ID
    movie_num NUMBER(10),               -- 영화 번호
    PRIMARY KEY (userid, movie_num),    -- 복합 키 설정
    FOREIGN KEY (userid) REFERENCES MEMBER(userid) ON DELETE CASCADE,
    FOREIGN KEY (movie_num) REFERENCES MOVIE_DB(movie_num) ON DELETE CASCADE
);

-- RECOMMEND_MOVIE 테이블 생성
CREATE TABLE recommend_movie(
	movie_num number(20) PRIMARY KEY,
	is_selected NUMBER(1) DEFAULT 0 NOT NULL,
	FOREIGN KEY (movie_num) REFERENCES movie_db(movie_num) ON DELETE CASCADE,
	CHECK (is_selected IN(0,1))
);

CREATE TABLE board (
	boardnum NUMBER(10) PRIMARY KEY,   -- 게시판 글 번호
	boardcate VARCHAR2(100) CHECK (boardcate IN ('공지', '추천', '질문')),	-- 게시판 카테고리
	username VARCHAR2(100) NOT NULL,             -- 작성자 이름
	userid VARCHAR2(100) NOT NULL,
	boardtitle VARCHAR2(500),          -- 글 제목
	boardcontents VARCHAR2(3000),      -- 글 내용 (텍스트 최대 3000자)
	boarddate DATE DEFAULT SYSDATE,    -- 작성 날짜
	adminreply VARCHAR2(3000),      -- 관리자 답변 (텍스트 최대 3000자)
	FOREIGN KEY (username) REFERENCES MEMBER(username) ON DELETE CASCADE,
    FOREIGN KEY (userid) REFERENCES MEMBER(userid) ON DELETE CASCADE
);

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
;

CREATE TABLE user_rate(
	movie_num NUMBER(10),
	userid VARCHAR2(100),
	user_star_rate NUMBER(2),
	FOREIGN KEY (movie_num) REFERENCES MOVIE_DB(movie_num) ON DELETE cascade,
	FOREIGN KEY (userid) REFERENCES MEMBER(userid),
	PRIMARY KEY (movie_num, userid)
);

CREATE INDEX movie_cnt_index ON MOVIE_DB(movie_rate_cnt);

CREATE INDEX is_num_index ON recommend_movie(is_selected);
