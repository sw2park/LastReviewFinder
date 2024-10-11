
-- 더미 유저 생성
INSERT INTO "MEMBER" m values('test1', '1234', '이동진 평론가', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test2', '1234', '손정빈 기자', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test3', '1234', '고래112', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test4', '1234', '한서진', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test5', '1234', '김영범', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test6', '1234', '박성우', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test7', '1234', '임지수', 'BASIC', 'profile.png');
INSERT INTO "MEMBER" m values('test8', '1234', '신윤창', 'BASIC', 'profile.png');

-- 더미 코멘트 생성
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test1', '이동진 평론가', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '당혹스런 오프닝과 엔딩을 위한 엔딩 그리고 그 사이의 종종 갸웃거려지는 장면들.', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test2', '손정빈 기자', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '정말 재미있었던 인생 영화!! 강력 추천 합니다!!!', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test3', '고래112', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '범죄 영화에 ‘유튜브에 미친 사람’ 좀 그만 넣었으면…', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test4', '한서진', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '나의 정의가 반드시 옳다고만 믿는 순간, 우린 우리도 모르는 사이에 악의 편에 서있을지 모른다.', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test5', '김영범', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '베테랑말고 베를린2 좀 내놔봐요 제발...나 아직 베를린에 갇혀 살아...', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test6', '박성우', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '1. 서도철이 자신의 신념을 선택으로 보여줘야하는 순간(후반부 딜레마파트) 선택을 보여주지 않고 데우스 엑스 마키나적 상황으로 유야무야 넘어간 것.
2. 박선우가 왜 싸이코패스인지 캐릭터를 구성한 본인들도 몰라서 아무런 이유 없이 그냥 눈 동그랗게 뜨고 시도때도 없이 웃는 식으로 표현한 것.
3. 서도철이 자신의 정의를 실현할수있는 바탕에 ‘팀’이 존재한다는 얘기를 하고싶었으면 팀이 더 나와야했어야 한다는 점.
4. 사적제재와 경찰 그리고 사법제도에 대한 얘기를 하고싶었다면 오프닝을 단순히 그렇게 365mc 광고처럼 흘려보낼게 아니라 1편 이후 지난 10년 동안 이 ‘팀’이 어떤 상황 속에 지냈는지 이 사람들은 형사에 이렇게나 진심인데 왜 시민들은 사적제재에 더 환호하는지 최.소.한. 그런 얘기를 했어야 한다는 점.
5. 음악감독은 바꾸시는게 나으실거같아요. 과해요.
6. 당신은 드팔마나 박찬욱이 아닙니다.', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test7', '임지수', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '정의를 쾌락으로 왜곡하는 소비 체계에 대한 반성. 정의구현의 윤리를 다루는 (무식할 정도로 강력한) 담론', sysdate, 0);
INSERT INTO "COMMENT" c values(comment_seq.nextval, 'test8', '신윤창', (SELECT md.movie_num FROM MOVIE_DB md WHERE movie_title='베테랑2'), '액션, 메시지는 좋다!', sysdate, 0);

-- 더미 게시판 생성 / 공지 추천 질문
INSERT INTO MEMBER VALUES ('admin', '1234', '관리자', 'ADMIN', 'setting.png');
INSERT INTO BOARD b VALUES(board_seq.nextval, '공지', '관리자', 'admin', '글 작성 규칙 공지입니다.', '도배글은 금지합니다.', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '추천', '이동진 평론가', 'test1', '베놈3 올려주세요', '베놈3가 그렇게 재밌다네요.', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '추천', '손정빈 기자', 'test2', '어벤져스10 보고싶어요', '어벤져스 너무 보고싶어요.', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '질문', '고래112', 'test3', '고래밥 어디서 파나요?', '고래밥 어디서 파는지 아시나요?', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '추천', '한서진', 'test4', 'jsp2조 추천합니다.', 'jsp2조 너무 재밌어요!', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '추천', '김영범', 'test5', '리뷰 파인더 추천합니다!', '완성도가 끝내줘요!', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '질문', '박성우', 'test6', '글 작성 규칙 공지입니다.', '도배글은 금지합니다.', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '질문', '임지수', 'test7', '지금 2024년 맞죠?', '2025년인가?', sysdate, null);
INSERT INTO BOARD b VALUES(board_seq.nextval, '추천', '신윤창', 'test8', '점심 메뉴 추천합니다.', '오늘은 돈가스 드세요.', sysdate, null);



