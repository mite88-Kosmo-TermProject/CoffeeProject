
/* Drop Tables */

DROP TABLE affiliate_owners_sub CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE coffee_coupon_log CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE event_items CASCADE CONSTRAINTS;
DROP TABLE image CASCADE CONSTRAINTS;
DROP TABLE jjim CASCADE CONSTRAINTS;
DROP TABLE likes CASCADE CONSTRAINTS;
DROP TABLE member_sub_info CASCADE CONSTRAINTS;
DROP TABLE refund CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE point_log CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE tag CASCADE CONSTRAINTS;
DROP TABLE stores CASCADE CONSTRAINTS;
DROP TABLE subscription CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE affiliate_owners_sub
(
	-- 매장일련번호
	store_idx number NOT NULL,
	-- 구독권사용메뉴
	aflt_menu varchar2(1000) NOT NULL,
	-- 메뉴추가비용
	aftl_other_menu number NOT NULL
);


CREATE TABLE board
(
	-- 게시판일련번호
	board_idx number NOT NULL,
	-- 제목
	board_title varchar2(100) NOT NULL,
	-- 내용
	board_content varchar2(3000) NOT NULL,
	-- 유저id
	mem_id varchar2(30) NOT NULL,
	-- 작성일
	board_postdate date DEFAULT sysdate NOT NULL,
	-- 조회수
	board_visitcount number NOT NULL,
	-- 게시판분류
	board_flag varchar2(10) NOT NULL,
	PRIMARY KEY (board_idx)
);


CREATE TABLE coffee_coupon_log
(
	-- 사용일련번호
	coupon_idx number NOT NULL,
	-- 구독권사용아이디
	mem_id varchar2(30) NOT NULL,
	-- 커피를 판 매장일련번호
	store_idx number NOT NULL,
	-- 판커피잔수 (무조건 1잔이면 지우고 카운트써도 될듯)
	coupon_sales number NOT NULL,
	-- 판매시간
	coupon_postdate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (coupon_idx)
);


CREATE TABLE comments
(
	-- 댓글일련번호
	cmnts_idx number NOT NULL,
	-- 리뷰일련번호
	review_idx number NOT NULL,
	-- 작성자아이디
	mem_id varchar2(100) NOT NULL,
	-- 댓글내용
	cmnts_content varchar2(500) NOT NULL,
	-- 댓글작성일
	cmnts_postdate date DEFAULT sysdate NOT NULL,
	-- 댓글그룹
	cmnts_group number NOT NULL,
	-- 댓글정렬순서
	cmnts_step number NOT NULL,
	-- 댓글깊이
	cmnts_depth number NOT NULL,
	PRIMARY KEY (cmnts_idx)
);


CREATE TABLE event
(
	-- 이벤트 일련번호
	event_idx number NOT NULL,
	-- 이벤트명
	event_name varchar2(50) NOT NULL,
	-- 이벤트설명
	event_explanation varchar2(3000) NOT NULL,
	-- 배경이미지
	event_img varchar2(500) NOT NULL,
	PRIMARY KEY (event_idx)
);


CREATE TABLE event_items
(
	-- 항목일련번호
	event_itemts_num number NOT NULL,
	-- 이벤트일련번호
	event_idx number NOT NULL,
	-- 항목명
	event_items_name varchar2(50) NOT NULL,
	-- 확률
	event_items_prbbl number NOT NULL,
	-- 비율
	event_item_ratio number NOT NULL,
	-- 항목결과
	event_items_result number NOT NULL,
	PRIMARY KEY (event_itemts_num)
);


CREATE TABLE image
(
	-- 이미지일련번호
	image_idx number NOT NULL,
	-- 리뷰일련번호
	review_idx number DEFAULT 0 NOT NULL,
	-- 매장일련번호
	store_idx number DEFAULT 0 NOT NULL,
	-- 원본이미지
	image_origin varchar2(200) NOT NULL,
	-- 저장이미지
	image_save varchar2(200) NOT NULL,
	-- 이미지작성일
	image_postdate date DEFAULT sysdate NOT NULL,
	-- 구현하려면 사용할 것 0.기본 1.대표(메인이미지)
	image_rprsn number DEFAULT 0 NOT NULL,
	PRIMARY KEY (image_idx)
);


CREATE TABLE jjim
(
	-- 찜일련번호
	jjim_idx number NOT NULL,
	-- 매장일련번호
	store_idx number NOT NULL,
	-- 멤버아이디
	mem_id varchar2(100) NOT NULL,
	-- 찜여부
	jjim_flag number,
	-- 찜한시간
	jjim_postdate date DEFAULT sysdate,
	PRIMARY KEY (jjim_idx)
);


CREATE TABLE likes
(
	-- 좋아요일련번호
	like_idx number NOT NULL,
	-- 멤버아이디
	mem_id varchar2(30) NOT NULL,
	-- 리뷰일련번호
	review_idx number NOT NULL,
	-- 좋아요여부
	like_flag number NOT NULL,
	-- 좋아요누른시간
	like_postdate date NOT NULL,
	PRIMARY KEY (like_idx)
);


CREATE TABLE members
(
	-- PK
	mem_id varchar2(30) NOT NULL,
	-- 멤버분류 - 1,고객, 2.제휴점주, 3.일반점주, 4.관리자
	mem_case number NOT NULL,
	-- 패스워드
	mem_pw varchar2(100) NOT NULL,
	-- 이름
	mem_name varchar2(50) NOT NULL,
	-- 닉네임
	mem_nickname varchar2(50) NOT NULL,
	-- 휴대폰번호
	mem_phone varchar2(30) NOT NULL,
	-- 이메일
	mem_email varchar2(50) NOT NULL,
	-- 성별
	mem_gender varchar2(10) NOT NULL,
	-- 가입일
	mem_regidate date DEFAULT sysdate NOT NULL,
	-- 포인트
	mem_point number DEFAULT 0 NOT NULL,
	-- 보유구독권여부 혹은 일련번호
	mem_sub varchar2(30) DEFAULT '''''' NOT NULL,
	-- 등록시 파일이름변경만
	mem_img varchar2(300) DEFAULT '''''' NOT NULL,
	-- (실버,골드,다이아) 구현여부 미정
	mem_level varchar2(20) DEFAULT '''''' NOT NULL,
	PRIMARY KEY (mem_id)
);


CREATE TABLE member_sub_info
(
	-- 결제일련번호
	pay_idx number NOT NULL,
	-- 회원아이디
	mem_id varchar2(30) NOT NULL,
	-- 구독권일련번호
	sub_idx number NOT NULL,
	-- 구독권구매일
	pay_created_at date NOT NULL,
	-- 구독권만료일
	pay_expiration_date date NOT NULL,
	-- 총커피잔수
	sub_coffee_num number NOT NULL,
	-- 남은커피잔수
	sub_coffee_num_left number NOT NULL,
	-- 결제용 QR코드
	sub_qr_code varchar2(500) NOT NULL
);


CREATE TABLE payment
(
	-- 결제일련번호
	pay_idx number NOT NULL,
	-- 구독권일련번호
	sub_idx number NOT NULL,
	-- 구매한멤버아이디
	mem_id varchar2(30) NOT NULL,
	-- 결제금액
	pay_price number NOT NULL,
	-- 결제요청시간
	pay_created_at date,
	-- 결제성공시간
	pay_successed_at date NOT NULL,
	-- 사용만료일
	pay_expiration_date date NOT NULL,
	pay_next_order_day date NOT NULL,
	-- 빌링키
	pay_billing_key varchar2(300) NOT NULL,
	-- 결제상태
	pay_result_status varchar2(45) NOT NULL,
	-- 결제결과메세지
	pay_result_msg varchar2(500) NOT NULL,
	PRIMARY KEY (pay_idx)
);


CREATE TABLE point_log
(
	-- 포인트일련번호
	point_idx number NOT NULL,
	-- 입/출멤버아이디
	mem_id varchar2(30) NOT NULL,
	-- 입/출포인트
	point_entry_exit number NOT NULL,
	-- 입/출일시
	point_postdate date NOT NULL,
	-- 포인트출처
	point_sources varchar2(10) NOT NULL,
	PRIMARY KEY (point_idx)
);


CREATE TABLE refund
(
	-- 환불일련번호
	refund_idx number NOT NULL,
	-- 환불을요청한멤버아이디
	mem_id varchar2(30),
	-- 결제일련번호
	pay_idx number,
	-- 환불요청시간
	refund_created_at date,
	-- 환불완료시간
	refund_success_at date,
	-- 환불금액
	refund_price number,
	-- 환불상태
	refund_result_status varchar2(45),
	-- 환불결과메세지
	refund_result_msg varchar2(500),
	PRIMARY KEY (refund_idx)
);


CREATE TABLE report
(
	-- 신고리뷰일련번호
	review_idx number NOT NULL,
	-- 신고한점주아이디
	store_owner varchar2(50) NOT NULL,
	-- 신고당한멤버아이디
	mem_id varchar2(100) NOT NULL,
	-- 신고사유
	report_content varchar2(1000) NOT NULL
);


CREATE TABLE review
(
	-- 리뷰일련번호
	review_idx number NOT NULL,
	-- 리뷰한멤버아이디
	mem_id varchar2(100) NOT NULL,
	-- 리뷰한매장명
	review_store_name varchar2(200) NOT NULL,
	-- 리뷰내용
	review_content varchar2(2000) NOT NULL,
	-- 리뷰작성일
	review_postdate date DEFAULT sysdate NOT NULL,
	-- 좋아요일련번호 
	like_idx number NOT NULL,
	PRIMARY KEY (review_idx)
);


CREATE TABLE stores
(
	-- PK
	store_idx number NOT NULL,
	-- 점주아이디
	mem_id varchar2(30) DEFAULT '''''' NOT NULL,
	-- 매장명
	store_name varchar2(200) NOT NULL,
	-- 점주이름
	store_owner varchar2(50) DEFAULT '김점주' NOT NULL,
	-- 전화번호
	store_phone varchar2(30) DEFAULT '02-111-1111' NOT NULL,
	-- 아이템
	store_item varchar2(200) DEFAULT '커피전문점/카페/다방' NOT NULL,
	-- 시군구
	store_sigungu varchar2(20) NOT NULL,
	-- 행정동
	store_dong varchar2(20) NOT NULL,
	-- 지번주소
	store_localaddr varchar2(300) NOT NULL,
	-- 도로명주소
	store_roadaddr varchar2(300) NOT NULL,
	-- 건물층수
	store_floor varchar2(20) DEFAULT '''''' NOT NULL,
	-- 경도
	store_longitude number NOT NULL,
	-- 위도
	store_latitude number NOT NULL,
	-- 공지
	store_notice varchar2(2000) DEFAULT '''''' NOT NULL,
	-- 대표메뉴 5개정도만 입력받아서 뿌릴예정
	store_menu varchar2(2000) DEFAULT '''''' NOT NULL,
	-- 최대 5점. 별점테이블 따로 뺼 예정
	store_star number DEFAULT 0 NOT NULL,
	-- 0.일반점포, 1.제휴점포
	store_afltd number DEFAULT 0 NOT NULL,
	-- 매장메뉴판이미지
	store_menu_img varchar2(300) DEFAULT '''''' NOT NULL,
	PRIMARY KEY (store_idx)
);


CREATE TABLE subscription
(
	-- 구독권일련번호
	sub_idx number NOT NULL,
	-- 구독권가격
	sub_price number NOT NULL,
	-- 한달커피잔
	sub_coffee_num number NOT NULL,
	PRIMARY KEY (sub_idx)
);


CREATE TABLE tag
(
	-- 매장일련번호
	store_idx number NOT NULL,
	-- 태그명
	store_tag varchar2(3000) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE coffee_coupon_log
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE likes
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE member_sub_info
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE payment
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE point_log
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE refund
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE member_sub_info
	ADD FOREIGN KEY (pay_idx)
	REFERENCES payment (pay_idx)
;


ALTER TABLE refund
	ADD FOREIGN KEY (pay_idx)
	REFERENCES payment (pay_idx)
;


ALTER TABLE comments
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE likes
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE report
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
;


ALTER TABLE affiliate_owners_sub
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE coffee_coupon_log
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE jjim
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE tag
	ADD FOREIGN KEY (store_idx)
	REFERENCES stores (store_idx)
;


ALTER TABLE member_sub_info
	ADD FOREIGN KEY (sub_idx)
	REFERENCES subscription (sub_idx)
;


ALTER TABLE payment
	ADD FOREIGN KEY (sub_idx)
	REFERENCES subscription (sub_idx)
;



/* Comments */

COMMENT ON COLUMN affiliate_owners_sub.store_idx IS '매장일련번호';
COMMENT ON COLUMN affiliate_owners_sub.aflt_menu IS '구독권사용메뉴';
COMMENT ON COLUMN affiliate_owners_sub.aftl_other_menu IS '메뉴추가비용';
COMMENT ON COLUMN board.board_idx IS '게시판일련번호';
COMMENT ON COLUMN board.board_title IS '제목';
COMMENT ON COLUMN board.board_content IS '내용';
COMMENT ON COLUMN board.mem_id IS '유저id';
COMMENT ON COLUMN board.board_postdate IS '작성일';
COMMENT ON COLUMN board.board_visitcount IS '조회수';
COMMENT ON COLUMN board.board_flag IS '게시판분류';
COMMENT ON COLUMN coffee_coupon_log.coupon_idx IS '사용일련번호';
COMMENT ON COLUMN coffee_coupon_log.mem_id IS '구독권사용아이디';
COMMENT ON COLUMN coffee_coupon_log.store_idx IS '커피를 판 매장일련번호';
COMMENT ON COLUMN coffee_coupon_log.coupon_sales IS '판커피잔수 (무조건 1잔이면 지우고 카운트써도 될듯)';
COMMENT ON COLUMN coffee_coupon_log.coupon_postdate IS '판매시간';
COMMENT ON COLUMN comments.cmnts_idx IS '댓글일련번호';
COMMENT ON COLUMN comments.review_idx IS '리뷰일련번호';
COMMENT ON COLUMN comments.mem_id IS '작성자아이디';
COMMENT ON COLUMN comments.cmnts_content IS '댓글내용';
COMMENT ON COLUMN comments.cmnts_postdate IS '댓글작성일';
COMMENT ON COLUMN comments.cmnts_group IS '댓글그룹';
COMMENT ON COLUMN comments.cmnts_step IS '댓글정렬순서';
COMMENT ON COLUMN comments.cmnts_depth IS '댓글깊이';
COMMENT ON COLUMN event.event_idx IS '이벤트 일련번호';
COMMENT ON COLUMN event.event_name IS '이벤트명';
COMMENT ON COLUMN event.event_explanation IS '이벤트설명';
COMMENT ON COLUMN event.event_img IS '배경이미지';
COMMENT ON COLUMN event_items.event_itemts_num IS '항목일련번호';
COMMENT ON COLUMN event_items.event_idx IS '이벤트일련번호';
COMMENT ON COLUMN event_items.event_items_name IS '항목명';
COMMENT ON COLUMN event_items.event_items_prbbl IS '확률';
COMMENT ON COLUMN event_items.event_item_ratio IS '비율';
COMMENT ON COLUMN event_items.event_items_result IS '항목결과';
COMMENT ON COLUMN image.image_idx IS '이미지일련번호';
COMMENT ON COLUMN image.review_idx IS '리뷰일련번호';
COMMENT ON COLUMN image.store_idx IS '매장일련번호';
COMMENT ON COLUMN image.image_origin IS '원본이미지';
COMMENT ON COLUMN image.image_save IS '저장이미지';
COMMENT ON COLUMN image.image_postdate IS '이미지작성일';
COMMENT ON COLUMN image.image_rprsn IS '구현하려면 사용할 것 0.기본 1.대표(메인이미지)';
COMMENT ON COLUMN jjim.jjim_idx IS '찜일련번호';
COMMENT ON COLUMN jjim.store_idx IS '매장일련번호';
COMMENT ON COLUMN jjim.mem_id IS '멤버아이디';
COMMENT ON COLUMN jjim.jjim_flag IS '찜여부';
COMMENT ON COLUMN jjim.jjim_postdate IS '찜한시간';
COMMENT ON COLUMN likes.like_idx IS '좋아요일련번호';
COMMENT ON COLUMN likes.mem_id IS '멤버아이디';
COMMENT ON COLUMN likes.review_idx IS '리뷰일련번호';
COMMENT ON COLUMN likes.like_flag IS '좋아요여부';
COMMENT ON COLUMN likes.like_postdate IS '좋아요누른시간';
COMMENT ON COLUMN members.mem_id IS 'PK';
COMMENT ON COLUMN members.mem_case IS '멤버분류 - 1,고객, 2.제휴점주, 3.일반점주, 4.관리자';
COMMENT ON COLUMN members.mem_pw IS '패스워드';
COMMENT ON COLUMN members.mem_name IS '이름';
COMMENT ON COLUMN members.mem_nickname IS '닉네임';
COMMENT ON COLUMN members.mem_phone IS '휴대폰번호';
COMMENT ON COLUMN members.mem_email IS '이메일';
COMMENT ON COLUMN members.mem_gender IS '성별';
COMMENT ON COLUMN members.mem_regidate IS '가입일';
COMMENT ON COLUMN members.mem_point IS '포인트';
COMMENT ON COLUMN members.mem_sub IS '보유구독권여부 혹은 일련번호';
COMMENT ON COLUMN members.mem_img IS '등록시 파일이름변경만';
COMMENT ON COLUMN members.mem_level IS '(실버,골드,다이아) 구현여부 미정';
COMMENT ON COLUMN member_sub_info.pay_idx IS '결제일련번호';
COMMENT ON COLUMN member_sub_info.mem_id IS '회원아이디';
COMMENT ON COLUMN member_sub_info.sub_idx IS '구독권일련번호';
COMMENT ON COLUMN member_sub_info.pay_created_at IS '구독권구매일';
COMMENT ON COLUMN member_sub_info.pay_expiration_date IS '구독권만료일';
COMMENT ON COLUMN member_sub_info.sub_coffee_num IS '총커피잔수';
COMMENT ON COLUMN member_sub_info.sub_coffee_num_left IS '남은커피잔수';
COMMENT ON COLUMN member_sub_info.sub_qr_code IS '결제용 QR코드';
COMMENT ON COLUMN payment.pay_idx IS '결제일련번호';
COMMENT ON COLUMN payment.sub_idx IS '구독권일련번호';
COMMENT ON COLUMN payment.mem_id IS '구매한멤버아이디';
COMMENT ON COLUMN payment.pay_price IS '결제금액';
COMMENT ON COLUMN payment.pay_created_at IS '결제요청시간';
COMMENT ON COLUMN payment.pay_successed_at IS '결제성공시간';
COMMENT ON COLUMN payment.pay_expiration_date IS '사용만료일';
COMMENT ON COLUMN payment.pay_billing_key IS '빌링키';
COMMENT ON COLUMN payment.pay_result_status IS '결제상태';
COMMENT ON COLUMN payment.pay_result_msg IS '결제결과메세지';
COMMENT ON COLUMN point_log.point_idx IS '포인트일련번호';
COMMENT ON COLUMN point_log.mem_id IS '입/출멤버아이디';
COMMENT ON COLUMN point_log.point_entry_exit IS '입/출포인트';
COMMENT ON COLUMN point_log.point_postdate IS '입/출일시';
COMMENT ON COLUMN point_log.point_sources IS '포인트출처';
COMMENT ON COLUMN refund.refund_idx IS '환불일련번호';
COMMENT ON COLUMN refund.mem_id IS '환불을요청한멤버아이디';
COMMENT ON COLUMN refund.pay_idx IS '결제일련번호';
COMMENT ON COLUMN refund.refund_created_at IS '환불요청시간';
COMMENT ON COLUMN refund.refund_success_at IS '환불완료시간';
COMMENT ON COLUMN refund.refund_price IS '환불금액';
COMMENT ON COLUMN refund.refund_result_status IS '환불상태';
COMMENT ON COLUMN refund.refund_result_msg IS '환불결과메세지';
COMMENT ON COLUMN report.review_idx IS '신고리뷰일련번호';
COMMENT ON COLUMN report.store_owner IS '신고한점주아이디';
COMMENT ON COLUMN report.mem_id IS '신고당한멤버아이디';
COMMENT ON COLUMN report.report_content IS '신고사유';
COMMENT ON COLUMN review.review_idx IS '리뷰일련번호';
COMMENT ON COLUMN review.mem_id IS '리뷰한멤버아이디';
COMMENT ON COLUMN review.review_store_name IS '리뷰한매장명';
COMMENT ON COLUMN review.review_content IS '리뷰내용';
COMMENT ON COLUMN review.review_postdate IS '리뷰작성일';
COMMENT ON COLUMN review.like_idx IS '좋아요일련번호 ';
COMMENT ON COLUMN stores.store_idx IS 'PK';
COMMENT ON COLUMN stores.mem_id IS '점주아이디';
COMMENT ON COLUMN stores.store_name IS '매장명';
COMMENT ON COLUMN stores.store_owner IS '점주이름';
COMMENT ON COLUMN stores.store_phone IS '전화번호';
COMMENT ON COLUMN stores.store_item IS '아이템';
COMMENT ON COLUMN stores.store_sigungu IS '시군구';
COMMENT ON COLUMN stores.store_dong IS '행정동';
COMMENT ON COLUMN stores.store_localaddr IS '지번주소';
COMMENT ON COLUMN stores.store_roadaddr IS '도로명주소';
COMMENT ON COLUMN stores.store_floor IS '건물층수';
COMMENT ON COLUMN stores.store_longitude IS '경도';
COMMENT ON COLUMN stores.store_latitude IS '위도';
COMMENT ON COLUMN stores.store_notice IS '공지';
COMMENT ON COLUMN stores.store_menu IS '대표메뉴 5개정도만 입력받아서 뿌릴예정';
COMMENT ON COLUMN stores.store_star IS '최대 5점. 별점테이블 따로 뺼 예정';
COMMENT ON COLUMN stores.store_afltd IS '0.일반점포, 1.제휴점포';
COMMENT ON COLUMN stores.store_menu_img IS '매장메뉴판이미지';
COMMENT ON COLUMN subscription.sub_idx IS '구독권일련번호';
COMMENT ON COLUMN subscription.sub_price IS '구독권가격';
COMMENT ON COLUMN subscription.sub_coffee_num IS '한달커피잔';
COMMENT ON COLUMN tag.store_idx IS '매장일련번호';
COMMENT ON COLUMN tag.store_tag IS '태그명';



