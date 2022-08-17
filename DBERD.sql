
/* Drop Tables */

DROP TABLE affiliate_owners_sub CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE event_items CASCADE CONSTRAINTS;
DROP TABLE heart CASCADE CONSTRAINTS;
DROP TABLE image CASCADE CONSTRAINTS;
DROP TABLE jjim CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE tag CASCADE CONSTRAINTS;
DROP TABLE stores CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE point CASCADE CONSTRAINTS;
DROP TABLE subscription CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE affiliate_owners_sub
(
	store_idx  NOT NULL,
	aflt_menu varchar2(100) NOT NULL,
	aftl_other_menu  NOT NULL
);


CREATE TABLE board
(
	-- 게시판번호
	board_idx number NOT NULL,
	-- 제목
	board_title varchar2(100) NOT NULL,
	-- 내용
	board_content varchar2(2000) NOT NULL,
	-- 유저id
	mem_id varchar2(30) NOT NULL,
	-- 작성일
	-- 
	board_postdate date DEFAULT sysdate NOT NULL,
	-- 조회수
	board_visitcount number NOT NULL,
	board_flag varchar2(5) NOT NULL,
	PRIMARY KEY (board_idx)
);


CREATE TABLE comments
(
	cmnts_idx number NOT NULL,
	review_idx number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	cmnts_content varchar2(500) NOT NULL,
	cmnts_postdate date DEFAULT sysdate NOT NULL,
	cmnts_group number NOT NULL,
	cmnts_step number NOT NULL,
	cmnts_depth number NOT NULL,
	PRIMARY KEY (cmnts_idx)
);


CREATE TABLE event
(
	event_idx number NOT NULL,
	event_name varchar2(50) NOT NULL,
	event_explanation varchar2(3000) NOT NULL,
	event_img varchar2(0) NOT NULL,
	PRIMARY KEY (event_idx)
);


CREATE TABLE event_items
(
	event_itemts_num number NOT NULL,
	event_idx number NOT NULL,
	event_items_name varchar2(50) NOT NULL,
	event_items_prbbl number NOT NULL,
	event_item_ratio number NOT NULL,
	event_items_result number NOT NULL,
	PRIMARY KEY (event_itemts_num)
);


CREATE TABLE heart
(
	-- PK
	mem_id varchar2(30) NOT NULL,
	review_idx number NOT NULL,
	like_flag number NOT NULL,
	like_postdate date NOT NULL
);


CREATE TABLE image
(
	image_idx number NOT NULL,
	review_idx number DEFAULT 0 NOT NULL,
	-- PK
	store_idx number DEFAULT 0 NOT NULL,
	image_origin varchar2(200) NOT NULL,
	image_save varchar2(200) NOT NULL,
	image_postdate date DEFAULT sysdate NOT NULL,
	-- 구현하려면 사용할 것 0.기본 1.대표(메인이미지)
	image_rprsn number DEFAULT 0 NOT NULL,
	PRIMARY KEY (image_idx)
);


CREATE TABLE jjim
(
	jjim_idx number NOT NULL,
	-- PK
	store_idx number NOT NULL,
	mem_id varchar2(0) NOT NULL,
	jjim_flag number,
	jjim_postdate date DEFAULT sysdate,
	PRIMARY KEY (jjim_idx)
);


CREATE TABLE member
(
	-- PK
	mem_id varchar2(30) NOT NULL,
	-- 멤버분류 - 1,고객, 2.제휴점주, 3.일반점주, 4.관리자
	mem_case number NOT NULL,
	-- 패스워드
	mem_pw varchar2(100) NOT NULL,
	mem_name varchar2(50) NOT NULL,
	mem_nickname varchar2(50) NOT NULL,
	mem_phone varchar2(30) NOT NULL,
	mem_email varchar2(50) NOT NULL,
	mem_gender varchar2(10) NOT NULL,
	mem_regidate date DEFAULT sysdate NOT NULL,
	mem_point number DEFAULT 0 NOT NULL,
	-- 보유구독권의 정보 혹은 일련번호
	mem_sub varchar2(30) DEFAULT '''''' NOT NULL,
	-- 등록시 파일이름변경만
	mem_img varchar2(200) DEFAULT '''''' NOT NULL,
	-- (실버,골드,다이아) 구현여부 미정
	mem_level varchar2(20) DEFAULT '''''' NOT NULL,
	PRIMARY KEY (mem_id)
);


CREATE TABLE payment
(
	pay_idx number NOT NULL,
	sub_idx number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	pay_postdate date NOT NULL,
	pay_endday date NOT NULL,
	pay_key varchar2(200) NOT NULL,
	PRIMARY KEY (pay_idx)
);


CREATE TABLE point
(
	point_idx number NOT NULL,
	point_entry_exit number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	-- postdate
	point_postdate date NOT NULL,
	point_sources varchar2(5) NOT NULL,
	PRIMARY KEY (point_idx)
);


CREATE TABLE report
(
	review_idx number NOT NULL,
	store_owner varchar2(50) NOT NULL,
	mem_id varchar2(100) NOT NULL,
	report_content varchar2(1000) NOT NULL
);


CREATE TABLE review
(
	review_idx number NOT NULL,
	review_content varchar2(2000) NOT NULL,
	review_postdate date DEFAULT sysdate NOT NULL,
	-- PK
	store_idx number NOT NULL,
	-- PK
	mem_id varchar2(30) NOT NULL,
	PRIMARY KEY (review_idx)
);


CREATE TABLE stores
(
	-- PK
	store_idx number NOT NULL,
	-- 점주아이디
	mem_id varchar2(30) NOT NULL,
	store_name varchar2(200) NOT NULL,
	store_owner varchar2(50) NOT NULL,
	store_phone varchar2(30) NOT NULL,
	store_LATITUDE number NOT NULL,
	store_LONGITUDE number NOT NULL,
	store_notice varchar2(2000) NOT NULL,
	-- 대표메뉴 5개정도만 입력받아서 뿌릴예정
	store_menu varchar2(0) NOT NULL,
	-- 최대 5점. 별점테이블 따로 뺼 예정
	store_star number NOT NULL,
	-- 0.일반점포, 1.제휴점포
	store_afltd number(2,0) NOT NULL,
	store_item varchar2(200) DEFAULT '''커피전문점/카페/다방''' NOT NULL,
	STORE_SIGUNGU varchar2(20),
	STORE_DONG varchar2(20),
	STORE_LOCALADDR varchar2(300),
	STORE_ROADADDR varchar2(300),
	STORE_FLOOR varchar2(20) DEFAULT '''''''''''''',
	STORE_NOTICE varchar2(2000) DEFAULT '',
	STORE_MENU varchar2(2000) DEFAULT '',
	STORE_STAR number DEFAULT 0,
	STORE_AFLTD number DEFAULT 0,
	STORE_IMG varchar2(300) DEFAULT '',
	PRIMARY KEY (store_idx)
);


CREATE TABLE subscription
(
	sub_idx number NOT NULL,
	sub_price number NOT NULL,
	sub_coffee_num number NOT NULL,
	-- 구독권등록일
	sub_regidate date DEFAULT sysdate NOT NULL,
	sub_sales number NOT NULL,
	PRIMARY KEY (sub_idx)
);


CREATE TABLE tag
(
	-- PK
	store_idx number NOT NULL,
	store_tag varchar2(0) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE heart
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
;


ALTER TABLE review
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
;


ALTER TABLE stores
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
;


ALTER TABLE comments
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE heart
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE image
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE report
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE image
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE jjim
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE review
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE tag
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;



/* Comments */

COMMENT ON COLUMN board.board_idx IS '게시판번호';
COMMENT ON COLUMN board.board_title IS '제목';
COMMENT ON COLUMN board.board_content IS '내용';
COMMENT ON COLUMN board.mem_id IS '유저id';
COMMENT ON COLUMN board.board_postdate IS '작성일
';
COMMENT ON COLUMN board.board_visitcount IS '조회수';
COMMENT ON COLUMN heart.mem_id IS 'PK';
COMMENT ON COLUMN image.store_idx IS 'PK';
COMMENT ON COLUMN image.image_rprsn IS '구현하려면 사용할 것 0.기본 1.대표(메인이미지)';
COMMENT ON COLUMN jjim.store_idx IS 'PK';
COMMENT ON COLUMN member.mem_id IS 'PK';
COMMENT ON COLUMN member.mem_case IS '멤버분류 - 1,고객, 2.제휴점주, 3.일반점주, 4.관리자';
COMMENT ON COLUMN member.mem_pw IS '패스워드';
COMMENT ON COLUMN member.mem_sub IS '보유구독권의 정보 혹은 일련번호';
COMMENT ON COLUMN member.mem_img IS '등록시 파일이름변경만';
COMMENT ON COLUMN member.mem_level IS '(실버,골드,다이아) 구현여부 미정';
COMMENT ON COLUMN point.point_postdate IS 'postdate';
COMMENT ON COLUMN review.store_idx IS 'PK';
COMMENT ON COLUMN review.mem_id IS 'PK';
COMMENT ON COLUMN stores.store_idx IS 'PK';
COMMENT ON COLUMN stores.mem_id IS '점주아이디';
COMMENT ON COLUMN stores.store_menu IS '대표메뉴 5개정도만 입력받아서 뿌릴예정';
COMMENT ON COLUMN stores.store_star IS '최대 5점. 별점테이블 따로 뺼 예정';
COMMENT ON COLUMN stores.store_afltd IS '0.일반점포, 1.제휴점포';
COMMENT ON COLUMN subscription.sub_regidate IS '구독권등록일';
COMMENT ON COLUMN tag.store_idx IS 'PK';



