/* 회원 */
create table members (
	member_id varchar2(50) not null, /* 회원아이디 */
	member_pw varchar2(50) not null, /* 비밀번호 */
	member_name varchar2(50) not null, /* 회원 */
	gender varchar2(4), /* 성별 */
	birth_date date, /* 생년월일 */
	email varchar2(100), /* 이메일 */
	mobile varchar2(50), /* 연락처 */
	address varchar2(200), /* 주소 */
	entry_date date, /* 가입일 */
	grade char(1),
	mileage number(6) /* 마일리지 */
);

alter table members
add constraint pk_members_memberid primary key (member_id);

/* 좌석 */
create table seats (
	seat_no number(3) not null, /* 좌석번호 */
	member_id varchar2(50) not null, /* 회원아이디 */
	condition number(1) not null, /* 상태 */
	start_time date, /* 시작시각 */
	finish_time date, /* 종료시각 */
	max_time date, /*최대 시각*/
	monitor varchar2(50), /* 모니터 */
	mainframe varchar2(50) /* 본체 */
);

alter table seats
add	constraint pk_seats_seatno primary key (seat_no);

alter table seats
add	constraint fk_seats_memberid foreign key (member_id)
references members (member_id);

	
/* 사용내역 */
create table use_lists (
	member_id varchar2(50) not null, /* 회원아이디 */
	seat_no number(3) not null, /* 좌석번호 */
	use_time number(6), /* 이용시간 */
	cost number(6), /* 이용요금 */
	pay_time date /* 결제시각 */
);

alter table use_lists
add	constraint fk_uselists_memberid	foreign key (member_id)
references members (member_id);

alter table use_lists
add constraint fk_uselists_seatno foreign key (seat_no)
references seats (seat_no);
		

/* 주문 */
create table orders (
	order_no number(6) not null, /* 주문번호 */
	member_id varchar2(50) not null, /* 회원아이디 */
	order_time date /* 주문일시 */
);

alter table orders
add	constraint pk_orders_orderno primary key (order_no);

alter table orders
add	constraint fk_orders_memberid foreign key (member_id)
references members (member_id);
		
/* 상품 */
create table products (
	product_name varchar2(50) not null, /* 상품명 */
	stock number(6), /* 재고 */
	price_buy number(6), /* 구입가격 */
	price_sell number(6), /* 판매가격 */
	category varchar2(50) /* 구분 */
);

alter table products
add constraint pk_products_productname primary key (product_name);		
		
/* 주문내역 */
create table order_lists (
	order_no number(6), /* 주문번호 */
	product_name varchar2(50), /* 상품명 */
	product_count number(6) /* 주문수량 */
);

alter table order_lists
add	constraint fk_orderlists_productname foreign key (product_name)
references products (product_name);

alter table order_lists
add constraint fk_orderlists_orderno foreign key (order_no)
references orders (order_no);

-- 회원별 주문내역 뷰
create view order_summary
as
select l.order_no 주문번호, o.member_id 회원명, l.product_name 상품명, l.product_count 주문수량, l.price 청구금액
from products p, orders o,
	(select l.*, l.product_count*p.price_sell price from products p, order_lists l
where l.product_name = p.product_name) l
where o.order_no = l.order_no
group by l.order_no, o.member_id, l.product_name, l.product_count, l.price
order by 주문번호
;
