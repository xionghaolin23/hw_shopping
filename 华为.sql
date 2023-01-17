--�û���
create table hw_shopping_user
(
  USER_ID VARCHAR2(32) not null
    primary key,
  USER_NAME VARCHAR2(20) not null
    unique,
  PASSWORD VARCHAR2(50),
  NAME VARCHAR2(20),
  EMAIL VARCHAR2(50),
  GENDER VARCHAR2(5),
  BIRTHDAY DATE,
  IS_SYS NUMBER(5) default 0,
  MOBILE NUMBER(30),
  head varchar2(200),
  register_time timestamp�� 
  login_count number(32) default 0,--������
  login_ip varchar2(32) --��¼ip
  login_last_time DATE default sysdate --���һ�ε�¼ʱ��
)
/


--�û���
create table manager_user
(
  USER_ID VARCHAR2(32) not null
    primary key,
  USER_NAME VARCHAR2(20) not null
    unique,
  PASSWORD VARCHAR2(50),
  activation NUMBER(5) default 0,
  describe VARCHAR2(255),
  create_time timestamp,
  update_time timestamp
)
/

--��ɫ��
create table manager_role
(
  ROLE_ID VARCHAR2(32) not null
    primary key,
 ROLE_NAME VARCHAR2(20) not null,
  ROLE_describe VARCHAR2(255),
  create_time timestamp,
  update_time timestamp
)
/

--�����û����� 
create sequence manager_user_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
    
    --������ɫ���� 
create sequence manager_role_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1


--��Ʒ��
create table hw_shopping_product
(
  PID VARCHAR2(32) not null
    constraint PK_hw_shopping_product_PID
      primary key,
  PNAME VARCHAR2(200),--��Ʒ����
  MARKET_PRICE NUMBER(7,2),--ԭ�۸�
  SHOP_PRICE NUMBER(7,2),--�̳Ǽ۸�
  PIMAGE VARCHAR2(200),--ͼƬ·��
  PDATE DATE default sysdate,--�����Ʒʱ��
  update_time DATE default sysdate,--������Ʒʱ��
  IS_HOT NUMBER(2),--�Ƿ�����
  p_sortT NUMBER(10),--����
  PDESC VARCHAR2(255),--��Ʒ����
  PFLAG NUMBER(3),--�ϼ� �¼�
  CID NUMBER,--��Ʒ����
  PSTOCK NUMBER(7) default 0,--��Ʒ���
  PDETAILS VARCHAR2(4000),--��Ʒ��ϸ ����ʹ��BLOB�滻  java���� java.lang.byte[];
  p_msg varchar2(100), --��ҳ-�ֻ�������Ϣ
  p_solgan varchar2(200),
  p_belong NUMBER(5),
  delete_Flag number(1) default 0--ɾ����� ��ɾ�� 0Ϊδɾ����1Ϊ��ɾ�� Ĭ��0

)
--��Ʒ�����
create table HW_SHOPPING_PRODUCT_TYPE
(
	CID NUMBER not null
		primary key,
  PARENT_TYPE_ID number(5),-- -1
	TYPE_NAME VARCHAR2(100),--�ֻ� ����
  SORT number(5), --����
   TIMAGE VARCHAR2(200),--ͼƬ·��
)
/



-- Create/Recreate primary, unique and foreign key constraints 
alter table HW_SHOPPING_PRODUCT
  add constraint FK_PRODUCT_CATEGORY_CID foreign key (CID)
  references hw_shopping_CATEGORY (CID);

--�����û����� 
create sequence hw_shopping_user_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������Ʒ���� 
create sequence hw_shopping_product_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������Ʒ�������� 
create sequence hw_shopping_product_type_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--�����ֲ�ͼ���� 
create sequence hw_shopping_carousel_seq
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������������ 
create sequence HW_SHOPPING_CART_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1 
--������������ 
create sequence  HW_SHOPPING_ORDER_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--����spu����
create sequence  HW_SHOPPING_spu_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--����sku���� 
create sequence  HW_SHOPPING_sku_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������������ 
create sequence  HW_SHOPPING_image_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--�����ջ���ַ���� 
create sequence  HW_SHOPPING_ADDRESS_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������Ʒ��ϸ����
create sequence  HW_SHOPPING_order_item_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
--������������
create sequence  HW_SHOPPING_notice_SEQ
    start with 1; --û��increment by Ĭ�ϲ���Ϊ1
    
select * from hw_shopping_user
select * from hw_shopping_product
select * from HW_SHOPPING_PRODUCT_TYPE

--������ͨ�û���ͼ
create or replace  view views_hw_shopping_user_ordin
as 
select USER_ID,USER_NAME, IS_SYS,PASSWORD,MOBILE,EMAIL,GENDER,BIRTHDAY,NAME,REGISTER_TIME,login_ip from HW_SHOPPING_USER where IS_SYS=0;
--��������Ա��ͼ
create or replace  view views_hw_shopping_user_admin
as 
select USER_ID,USER_NAME, IS_SYS,PASSWORD,MOBILE,EMAIL,GENDER,BIRTHDAY,NAME,REGISTER_TIME,login_ip from HW_SHOPPING_USER where IS_SYS=1;

select * from views_hw_shopping_user_ordinary;

--��ҳ�ֲ�ͼ��
create table HW_SHOPPING_carousel
(
	carousel_id varchar2(32) not null primary key,  --��ҳ�ֲ�ͼ����id
	carousel_url varchar2(100), --�ֲ�ͼ
	redirect_url varchar2(100),-- ��������ת��ַ(Ĭ�ϲ���ת)
	carousel_rank number(10),--'����ֵ(�ֶ�Խ��Խ��ǰ)',
	is_deleted number(1), --'ɾ����ʶ�ֶ�(0-δɾ�� 1-��ɾ��)',
	create_time DATE default sysdate,--����ʱ��',
	update_time  DATE default sysdate,--'�޸�ʱ��',
	update_user varchar2(32) --'�޸���id'
);

select * from HW_SHOPPING_carousel

--���ﳵ��
create table HW_SHOPPING_CART
(
	shop_cart_Id varchar2(32) not null primary key,  --����id
	user_Id varchar2(100), --�û�id
	pid varchar2(100),-- ��Ʒid
	shop_Count number(10),--��Ʒ����,
	is_Deleted number(1) default 0, --'ɾ����ʶ�ֶ�(0-δɾ�� 1-��ɾ��)',
	create_time DATE default sysdate,--����ʱ��',
	update_time  DATE default sysdate--'�޸�ʱ��',

);
--��user �� ���
alter table HW_SHOPPING_CART
  add constraint FK_USER_CART_USERID foreign key (USER_ID)
  references HW_SHOPPING_USER (USER_ID) on delete cascade;
--������
create table HW_SHOPPING_ORDER
(
	order_id varchar2(32) not null primary key,-- '����������id'
	order_no varchar(32),-- '������',
	user_id varchar2(32),-- '�û�id',
	total_price number(11,2),--'�����ܼ�',
	pay_status number(1),-- '֧��״̬:0.δ֧��,1.֧���ɹ�,-1:֧��ʧ��',
	pay_type number(1) default 0, --'0֧����֧�� 1.΢��֧��',
	pay_time DATE,-- '֧��ʱ��',
	order_status number(1) default 0,-- '����״̬:0������� 1.������ 2:����ɹ� 3.���׳ɹ� -1.�ֶ��ر� -2.��ʱ�ر� -3.�̼ҹر�',
	user_name varchar2(30),--'�ջ�������',
	user_phone varchar2(30),--'�ջ����ֻ���',
	user_address varchar2(100),--'�ջ����ջ���ַ',
  logistics varchar2(32),--������
  is_deleted number(1) default 0,--'ɾ����ʶ�ֶ�(0-δɾ�� 1-��ɾ��)',
	create_time DATE default sysdate,-- '����ʱ��',
	update_time DATE default sysdate-- '�����޸�ʱ��'
)
--��ϸ������
create table HW_SHOPPING_order_item
(
	order_item_id varchar2(32) not null primary key, -- '������������������id'
	order_id varchar2(32),-- '�������id', 
	pid varchar2(32),-- '������Ʒid',
	product_name varchar2(200),-- '�µ�ʱ��Ʒ������(��������)',
	product_cover_img varchar2(300), --'�µ�ʱ��Ʒ����ͼ(��������)',
	product_price number(7,2),-- '�µ�ʱ��Ʒ�ļ۸�(��������)',
	shop_count number(10),-- '����(��������)',
	create_time DATE default sysdate-- '����ʱ��'
)
alter table HW_SHOPPING_ORDER_ITEM
  add constraint FK_ORDER_ORSER_ITEM_ORDERID foreign key (ORDER_ID)
  references HW_SHOPPING_ORDER (ORDER_ID) on delete cascade;
  
  
--��ַ��
create table HW_SHOPPING_ADDRESS
(
    ADDRESS_ID VARCHAR2(32) not null
        primary key, -- '��ַ����id'
      USER_ID VARCHAR2(32)
        constraint FK_USER_ADDRESS_USERID
          references HW_SHOPPING_USER
            on delete cascade,
      ADDRESS varchar2(100),
      user_name varchar2(10),--�ջ���
      PHONE VARCHAR2(20),--�ֻ�
      MOREN NUMBER(1) default 0,--�Ƿ�ΪĬ�ϵ�ַ 0�� 1��
      TAG VARCHAR2(10),--��� �� ѧУ ��˾
      note varchar2(200) --��ע

)

select * from HW_SHOPPING_ADDRESS


--��ҳ�����
create table HW_SHOPPING_NOTICE
(
	n_id varchar2(32) not null primary key,-- '����������id'
  n_content varchar2(32),--��������
  release_name varchar(32),-- ������
  -- '����ʱ��'
  create_time DATE default sysdate
)


--spu��
create table HW_SHOPPING_SPU
(
	spu_id varchar2(32) not null primary key,-- '����������id'
  default_sku_id varchar2(32),--Ĭ��sku
	spu_name varchar(32),-- '��Ʒ����',spu_name+sku_name ƴ�ӳ���Ʒ����
  spu_desc varchar(32),--��Ʒ����
  spu_PRICE NUMBER(7,2),--�̳Ǽ۸�
  spu_msg varchar2(100), --��ҳ-�ֻ�������Ϣ
  spu_IMAGE VARCHAR2(200),--ͼƬ·��
  CId number(10),--����
  delete_flag number(1) default 0 ----ɾ����� ��ɾ�� 0Ϊδɾ����1Ϊ��ɾ�� Ĭ��0
)

create table HW_SHOPPING_SKU
(
	sku_id varchar2(32) not null primary key,-- '����������id'
  spu_id varchar2(32),-- 'spu id'
  --spu_name varchar2(100)��--spu name
	sku_color varchar(100),-- 'sku ��ɫ',
  sku_version varchar(100),-- 'sku�汾',
  sku_service varchar(100),-- 'sku ����',
  sku_price NUMBER(7,2),--�̳Ǽ۸�
  IS_HOT NUMBER(2),--�Ƿ�����
  sku_sort NUMBER(10),--����
  --sku_DESC VARCHAR2(255),--��Ʒ����
  sku_FLAG NUMBER(3),--�ϼ� �¼�
  --CID NUMBER,--��Ʒ����
  sku_STOCK NUMBER(7) default 0,--��Ʒ���
  sku_DETAILS VARCHAR2(4000),--��Ʒ��ϸ ����ʹ��BLOB�滻  java���� java.lang.byte[];
  deleteFlag number(1) default 0,--ɾ����� ��ɾ�� 0Ϊδɾ����1Ϊ��ɾ�� Ĭ��0
  sku_DATE DATE default sysdate,--�����Ʒʱ��
  update_time DATE default sysdate--������Ʒʱ��
)

create table HW_SHOPPING_SKU_IMAGE(

--6��ͼ
   image_id varchar2(32) not null primary key,
   sku_id varchar2(32),--��� ����ɾ��
   image_main VARCHAR2(200),
   image_one VARCHAR2(200),
   image_two VARCHAR2(200),
   image_three VARCHAR2(200),
   image_four VARCHAR2(200),
   image_five VARCHAR2(200)

)
