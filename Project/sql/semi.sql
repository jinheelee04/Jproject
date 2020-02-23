create user gun identified by gun
default tablespace users;
grant connect, RESOURCE to gun;
-----------------------------------------------------
--회원테이블
    create table member (
    --회원번호
    member_no varchar2(20),
    --회원이메일
    member_email varchar2(30) unique,
      --회원이름
    member_name varchar2(30) not null,
    --회원패스워드
   member_password varchar2(300) not null,
   --생년월일
   memeber_birth date not null,
   --전화번호
    member_phone char(11) not null,
    --등급
    grade char(1) not null,
    --가입일
   member_enrolldate date default sysdate,
   constraint pk_member primary key(member_no)
);
--    drop table member;
create sequence seq_tbl_member_no;
--drop sequence seq_tbl_member_no;
select * from member where member_email = 'hong@naver.com';


insert into member values('gn'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_member_no.nextval,'fm0000'),'admin@admin.com','관리자','1234','0000-01-02','01012341234','A',default);
insert into member values('gn'||to_char(sysdate,'yymmdd')||'_'||to_char(seq_tbl_member_no.nextval,'fm0000'),'hong@naver.com','홍길동','1234','1999-05-02','01012341234','U',default);

commit;
----------------------------------------------------------
--관광지 카테고리 테이블
create table  tour_category(
    --카테고리아이디
    category_id varchar2(20) not null,
       --카테고리네임
    category_name varchar2(30) not null,
   constraint pk_tour_category primary key(category_id)
);
select * from tour_category;
insert into  tour_category values('T1','자연');
insert into  tour_category values('T2','공원');
insert into  tour_category values('T3','마을');
insert into  tour_category values('T4','박물관/전시관');
insert into  tour_category values('T5','문화유적');
insert into  tour_category values('T6','레저/체험');


------------------------------------------------------
--관광지 정보 테이블
create table  tour_info(
    --관광지아이디
    tour_info_id varchar2(20) not null,
    --관광지이름
    tour_info_name varchar2(30) not null unique,
   --카테고리 fk
   category_id varchar2(20) not null,
   --서비스 타입
   service_type varchar2(4) not null,
   --has_ticket
   has_ticket char(1),
   -- 어른가격
   adult_price varchar2(20) default '0',
      -- 어린이가격,
   child_price varchar2(20) default '0',
     --위도
  lat number not null,
    --경도
  long number not null,
  -- 소개 이미지 경로
  img_service_original_filename varchar2(100),
   constraint pk_tour_info_id primary key( tour_info_id),
   constraint ck_has_ticket check(has_ticket in ('Y','N')),
   constraint fk_category_id foreign key(category_id) references tour_category(category_id) on delete cascade
);

--drop sequence seq_tour_info;

select * from tour_info;
create sequence seq_tour_info;

insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '월명호수', 'T1','C', 'N',default,default,35.979715,126.695576);
insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '축성산', 'T1','M', 'N',default,default,36.006552,126.843504);
insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '해망굴', 'T1','F', 'N',default,default,35.991669,126.704232);
insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '옥구저수지', 'T1','S', 'N',default,default,35.930713,126.657638);
insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '망해산', 'T1','S', 'N',default,default,36.018098,126.839806);
insert into tour_info values('TA1'|| to_char(seq_tour_info.nextval, 'fm0000'), '선유도', 'T1','FMCS', 'N',default,default,35.810655,126.416209);

insert into tour_info values('TA2'|| to_char(seq_tour_info.nextval, 'fm0000'), '월명공원', 'T2','FMC', 'N',default,default,35.990116,126.702635);

insert into tour_info values('TA3'|| to_char(seq_tour_info.nextval, 'fm0000'), '열대자마을', 'T3','F', 'N',default,default,35.959563,126.633837);
insert into tour_info values('TA3'|| to_char(seq_tour_info.nextval, 'fm0000'), '경암도철길마을', 'T3','FMC', 'N',default,default,35.981288,126.737023);

insert into tour_info values('TA4'|| to_char(seq_tour_info.nextval, 'fm0000'), '근대역사박물관', 'T4','FMCS', 'Y','3000','1000',35.990779,126.712097);
insert into tour_info values('TA4'|| to_char(seq_tour_info.nextval, 'fm0000'), '호남관세박물관', 'T4','FMCS', 'Y','2000','1000',35.991061,126.711249);
insert into tour_info values('TA4'|| to_char(seq_tour_info.nextval, 'fm0000'), '(구)조선은행(근대건축관)', 'T4','M', 'Y','1000','500',35.989257,126.714172);
insert into tour_info values('TA4'|| to_char(seq_tour_info.nextval, 'fm0000'), '(구)일본18은행(근대미술관)', 'T4','FMCS', 'Y','500','200',35.989907,126.712759);
insert into tour_info values('TA4'|| to_char(seq_tour_info.nextval, 'fm0000'), '군산 3.1기념관', 'T4','C', 'Y','500','200',35.984936,126.741964);


insert into tour_info values('TA5'|| to_char(seq_tour_info.nextval, 'fm0000'), '동국사', 'T5','FMC', 'N',default,default,35.982849,126.707512);
insert into tour_info values('TA5'|| to_char(seq_tour_info.nextval, 'fm0000'), '군산신흥동일본식가옥', 'T5','FS', 'N',default,default,35.986130,126.706050);
insert into tour_info values('TA5'|| to_char(seq_tour_info.nextval, 'fm0000'), '이영춘가옥', 'T5','MS', 'N',default,default,35.970884,126.759705);
insert into tour_info values('TA5'|| to_char(seq_tour_info.nextval, 'fm0000'), '부잔교', 'T5','CS', 'N',default,default,35.991440,126.713946);

insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '신시도어촌체험마을(바지락케기 체험)', 'T6','FMCS', 'N','5000','5000',35.814059,126.452258);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '신시도어촌체험마을(낚시 체험)', 'T6','FMCS', 'N','60000',default,35.814059,126.452258);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '옥구오산마을(연꽃재배)', 'T6','FMCS', 'N','10000','5000',35.922172,126.683866);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '옥구오산마을(토속음식 체험)', 'T6','FMCS', 'N','5000','3000',35.922172,126.683866);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '승마체험', 'T6','FMCS', 'Y', '50000','25000',35.981612,126.785103);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '패러글라이딩', 'T6','FMCS', 'Y','75000','50000',35.999433,126.786499);
insert into tour_info values('TA6'|| to_char(seq_tour_info.nextval, 'fm0000'), '선유스카이 SUN라인', 'T6','FMCS', 'Y','20000','16000',35.815877,126.406784);

-------------------------------------------------------------------
--관리자staff테이블
create table tour_staff (
    tour_staff_no varchar2(20) not null,
    tour_staff_email varchar2(30) not null,
    tour_staff_name varchar(20) not null,
    tour_staff_password varchar2(30) not null,
    tour_staff_phone char(11) not null,
    tour_staff_enrolldate date default sysdate,
    tour_info_id varchar2(20),
    constraint pk_tour_staff_no primary key(tour_staff_no),
    constraint fk_tour_info_id foreign key (tour_info_id) references tour_info(tour_info_id) on delete cascade
);
create sequence seq_tbl_admin_staff_no;
insert into tour_staff values ('TA6'||'_'||to_char(seq_tbl_admin_staff_no.nextval,'fm0000'), 'admin_staff@admin.com','관리자staff','1234','01012341234',default,'TA6028');

select * from admin_staff;
drop table  admin_staff ;
drop sequence seq_tbl_admin_staff_no; 


------------------------------------------------------------------------------
--관리자 테이블
--create table admin(
--    admin_no varchar2(20),
--    admin_email varchar2(30) not null,
--    admin_name varchar(20) not null,
--    admin_password varchar2(300) not null,
--     admin_phone char(11) not null,
--    constraint pk_admin_no primary key(admin_no)
--);
--create sequence seq_tbl_admin_no;
--insert into admin values('admin'||to_char(seq_tbl_admin_no.nextval,fm0000),'admin@admin.com','관리자','1234','01012341234');
--
--select * from admin;
--
--drop table admin;

--------------------------------------------------------------------
--예약테이블

create table booking(
    --pk 예약번호
    booking_id varchar2(20) not null,
    --관광지 번호
    tour_info_id varchar2(20),
     --관광지 staff번호
    tour_staff_no varchar2(20) not null,
    --회원번호
    member_no varchar2(20),
--어른 인원수
    adult_amount number,
    --어린이 인원수
    children_amount number,
    --총가격
    total_price varchar2(15),
    --날짜/시간
    tour_date_time varchar2(30),
    --예매날짜
    booking_date date default sysdate,
    --결제수단
    pay char(1) not null,
    constraint pk_booking_id primary key (booking_id),
    constraint fk_member_no foreign key(member_no) references member(member_no) on delete cascade  ,
    constraint fk_tour_info_id foreign key(tour_info_id) references tour_info(tour_info_id) on delete cascade
);
    create sequence seq_booking_no;
   -- 결제 수단 'C' , 'W'
    insert into booking_table values( to_char(sysdate,'yymmdd')||'_'||to_char(seq_booking_no.nextval.nextval,'fm0000'), '2','TA6028','TA67',3,2,(select adult_price *3+child_price*2 from tourist_attraction where tourist_attraction_id = 'TA6028')
    ,sysdate||'-'||'10:00',default,'C');
    
    delete from booking_table;
    drop table booking_table;
    select * from booking_table;
    
    select adult_price *3+child_price*2 from tourist_attraction where tourist_attraction_id = 'TA6028';
    
   create table paragliding(
        tour_info_id varchar2(20),
        p_9 number,
        p_11 number,
        p_13 number,
        p_15 number,
        p_17 number,
        constraint pk_p_tour_info_id primary key( tour_info_id),
       constraint fk_p_tour_info_id foreign key( tour_info_id) references  tour_info( tour_info_id) on delete cascade
       );
       insert into paragliding values('패러글라이딩번호','20','25','20','20','15');
       
    create table horse(
        tour_info_id varchar2(20),
        h_10 number,
        h_11 number,
        h_13 number,
        h_14 number,
        h_15 number,
        h_16 number,
        constraint pk_h_tour_info_id primary key( tour_info_id),
        constraint fk_h_tour_info_id foreign key( tour_info_id) references  tour_info( tour_info_id) on delete cascade
       );
       insert into horse values('승마체험번호','20','20','20','20','20','15','10');
       
       
    create table zip_line(
        tour_info_id varchar2(20),
        z_9 number,
        z_10 number,
        z_11 number,
        z_13 number,
        z_14 number,
        z_15 number,
        z_16 number,
        constraint pk_z_tour_info_id primary key( tour_info_id),
       constraint fk_z_tour_info_id foreign key( tour_info_id) references  tour_info( tour_info_id) on delete cascade
       );
       
     insert into zip_line values('집라인체험번호','20','30','30','30','30','30','20');
     
    --------------------------------------------------------------------------
    --자유게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table free_board(
        free_board_no number,
        free_board_title varchar2(100) not null,
        free_board_writer varchar2(15) not null,
        free_board_content varchar2(2000) not null,
        free_board_original_filename varchar2(100),
        free_board_renamed_filename varchar2(100),
        free_board_date date default sysdate,
        free_board_readcount number default 0,
        constraint pk_fr_board_no primary key(free_board_no),
        constraint fk_fr_board_writer foreign key(free_board_writer) references member(member_no)
                                           on delete set null
    );
    
    create sequence seq_fr_board_no;
    
    --============================================
    --댓글 게시판
    --============================================
    --    drop table board_comment;
    --    drop sequence seq_board_comment_no;
    create table free_board_comment(
        free_board_comment_no number,
        free_board_comment_level number default 1, --댓글1, 대댓글2
        free_board_comment_writer varchar2(15),
        free_board_comment_content varchar2(2000),
        free_board_ref number,
        free_board_comment_ref number,
        free_board_comment_date date default sysdate,
        constraint pk_fr_board_comment_no primary key(free_board_comment_no),
        constraint fk_fr_board_comment_writer foreign key(free_board_comment_writer)
                                                                references member(member_no) on delete set null,
        constraint fk_fr_board_ref foreign key(free_board_ref) references  free_board(free_board_no) on delete cascade,
        constraint fk_fr_board_comment_ref foreign key(free_board_comment_ref) references free_board_comment(free_board_comment_no) on delete cascade
        );
        
        create sequence seq_fr_board_comment_no;
    
    
    --------------------------------------------------------------------------
    --------------------------------------------------------------------------
    --관광지공지사항게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table staff_board(
        staff_board_no number,
        staff_board_title varchar2(100) not null,
        staff_board_writer varchar2(15) not null,
        staff_board_content varchar2(2000) not null,
        staff_board_original_filename varchar2(100),
       staff_board_renamed_filename varchar2(100),
        staff_board_date date default sysdate,
        staff_board_readcount number default 0,
        constraint pk_st_board_no primary key(staff_board_no),
        constraint fk_st_board_writer foreign key(staff_board_writer) references tour_staff(tour_staff_no)
                                           on delete set null
    );
    
    create sequence seq_st_board_no;
    
    --============================================
    --댓글 게시판
    --댓글 작성자는 멤버, staff둘 다 가능하다.
    --============================================
    --    drop table board_comment;
    --    drop sequence seq_board_comment_no;
    create table staff_board_comment(
        staff_board_comment_no number,
        staff_board_comment_level number default 1, --댓글1, 대댓글2
        staff_board_comment_writer varchar2(15),
        staff_board_comment_content varchar2(2000),
        staff_board_ref number,
        staff_board_comment_ref number,
        staff_board_comment_date date default sysdate,
        constraint pk_st_board_comment_no primary key(staff_board_comment_no),
        constraint fk_st_board_ref foreign key(staff_board_ref) references  staff_board(staff_board_no) on delete cascade,
        constraint fk_st_board_comment_ref foreign key(staff_board_comment_ref) references staff_board_comment(staff_board_comment_no) on delete cascade
        );
        
        create sequence seq_st_board_comment_no;
    
        --------------------------------------------------------------------------
    --관리자게시판
    --=================================================
    --BOARD
    --=================================================
    --board테이블 생성
    create table admin_board(
        admin_board_no number,
        admin_board_title varchar2(100) not null,
        admin_board_writer varchar2(15) not null,
        admin_board_content varchar2(2000) not null,
        admin_board_original_filename varchar2(100),
        admin_board_renamed_filename varchar2(100),
        admin_board_date date default sysdate,
        admin_board_readcount number default 0,
        constraint pk_ad_board_no primary key(admin_board_no),
        constraint fk_ad_board_writer foreign key(admin_board_writer) references member(member_no)
                                           on delete set null
    );
    
    create sequence seq_ad_board_no;
    
    --============================================
    --댓글 게시판
    --============================================
    --    drop table board_comment;
    --    drop sequence seq_board_comment_no;
    create table admin_board_comment(
        admin_board_comment_no number,
        admin_board_comment_level number default 1, --댓글1, 대댓글2
        admin_board_comment_writer varchar2(15),
        admin_board_comment_content varchar2(2000),
        admin_board_ref number,
        admin_board_comment_ref number,
        admin_board_comment_date date default sysdate,
        constraint pk_ad_board_comment_no primary key(admin_board_comment_no),
        constraint fk_ad_board_comment_writer foreign key(admin_board_comment_writer)
                                                                references member(member_no) on delete set null,
        constraint fk_ad_board_ref foreign key(admin_board_ref) references  admin_board(admin_board_no) on delete cascade,
        constraint fk_ad_board_comment_ref foreign key(admin_board_comment_ref) references admin_board_comment(admin_board_comment_no) on delete cascade
        );
        
        create sequence seq_ad_board_comment_no;
    
    --------------------------------------------------------------------------

    
    
    
    
    
    --연습
    select p_10 - (select count(*)
                                from booking_table
                               where tourist_attraction_id = 'TA6028' and date_time like ('%10:00%'))
    from Paragliding
    where tourist_attraction_id = 'TA6028';
    
    