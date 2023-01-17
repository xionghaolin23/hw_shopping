--用户表
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
  register_time timestamp， 
  login_count number(32) default 0,--访问量
  login_ip varchar2(32) --登录ip
  login_last_time DATE default sysdate --最后一次登录时间
)
/


--用户表
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

--角色表
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

--创建用户序列 
create sequence manager_user_seq
    start with 1; --没加increment by 默认步长为1
    
    --创建角色序列 
create sequence manager_role_seq
    start with 1; --没加increment by 默认步长为1


--商品表
create table hw_shopping_product
(
  PID VARCHAR2(32) not null
    constraint PK_hw_shopping_product_PID
      primary key,
  PNAME VARCHAR2(200),--商品名称
  MARKET_PRICE NUMBER(7,2),--原价格
  SHOP_PRICE NUMBER(7,2),--商城价格
  PIMAGE VARCHAR2(200),--图片路径
  PDATE DATE default sysdate,--添加商品时间
  update_time DATE default sysdate,--更新商品时间
  IS_HOT NUMBER(2),--是否热门
  p_sortT NUMBER(10),--排序
  PDESC VARCHAR2(255),--商品描述
  PFLAG NUMBER(3),--上架 下架
  CID NUMBER,--商品大类
  PSTOCK NUMBER(7) default 0,--商品库存
  PDETAILS VARCHAR2(4000),--商品详细 或者使用BLOB替换  java类型 java.lang.byte[];
  p_msg varchar2(100), --首页-手机底下消息
  p_solgan varchar2(200),
  p_belong NUMBER(5),
  delete_Flag number(1) default 0--删除标记 假删除 0为未删除，1为已删除 默认0

)
--商品分类表
create table HW_SHOPPING_PRODUCT_TYPE
(
	CID NUMBER not null
		primary key,
  PARENT_TYPE_ID number(5),-- -1
	TYPE_NAME VARCHAR2(100),--手机 电脑
  SORT number(5), --排序
   TIMAGE VARCHAR2(200),--图片路径
)
/



-- Create/Recreate primary, unique and foreign key constraints 
alter table HW_SHOPPING_PRODUCT
  add constraint FK_PRODUCT_CATEGORY_CID foreign key (CID)
  references hw_shopping_CATEGORY (CID);

--创建用户序列 
create sequence hw_shopping_user_seq
    start with 1; --没加increment by 默认步长为1
--创建商品序列 
create sequence hw_shopping_product_seq
    start with 1; --没加increment by 默认步长为1
--创建商品类型序列 
create sequence hw_shopping_product_type_seq
    start with 1; --没加increment by 默认步长为1
--创建轮播图序列 
create sequence hw_shopping_carousel_seq
    start with 1; --没加increment by 默认步长为1
--创建购物序列 
create sequence HW_SHOPPING_CART_SEQ
    start with 1; --没加increment by 默认步长为1 
--创建订单序列 
create sequence  HW_SHOPPING_ORDER_SEQ
    start with 1; --没加increment by 默认步长为1
--创建spu序列
create sequence  HW_SHOPPING_spu_SEQ
    start with 1; --没加increment by 默认步长为1
--创建sku序列 
create sequence  HW_SHOPPING_sku_SEQ
    start with 1; --没加increment by 默认步长为1
--创建订单序列 
create sequence  HW_SHOPPING_image_SEQ
    start with 1; --没加increment by 默认步长为1
--创建收货地址序列 
create sequence  HW_SHOPPING_ADDRESS_SEQ
    start with 1; --没加increment by 默认步长为1
--创建商品明细序列
create sequence  HW_SHOPPING_order_item_SEQ
    start with 1; --没加increment by 默认步长为1
--创建公告序列
create sequence  HW_SHOPPING_notice_SEQ
    start with 1; --没加increment by 默认步长为1
    
select * from hw_shopping_user
select * from hw_shopping_product
select * from HW_SHOPPING_PRODUCT_TYPE

--创建普通用户视图
create or replace  view views_hw_shopping_user_ordin
as 
select USER_ID,USER_NAME, IS_SYS,PASSWORD,MOBILE,EMAIL,GENDER,BIRTHDAY,NAME,REGISTER_TIME,login_ip from HW_SHOPPING_USER where IS_SYS=0;
--创建管理员视图
create or replace  view views_hw_shopping_user_admin
as 
select USER_ID,USER_NAME, IS_SYS,PASSWORD,MOBILE,EMAIL,GENDER,BIRTHDAY,NAME,REGISTER_TIME,login_ip from HW_SHOPPING_USER where IS_SYS=1;

select * from views_hw_shopping_user_ordinary;

--首页轮播图表
create table HW_SHOPPING_carousel
(
	carousel_id varchar2(32) not null primary key,  --首页轮播图主键id
	carousel_url varchar2(100), --轮播图
	redirect_url varchar2(100),-- 点击后的跳转地址(默认不跳转)
	carousel_rank number(10),--'排序值(字段越大越靠前)',
	is_deleted number(1), --'删除标识字段(0-未删除 1-已删除)',
	create_time DATE default sysdate,--创建时间',
	update_time  DATE default sysdate,--'修改时间',
	update_user varchar2(32) --'修改者id'
);

select * from HW_SHOPPING_carousel

--购物车表
create table HW_SHOPPING_CART
(
	shop_cart_Id varchar2(32) not null primary key,  --主键id
	user_Id varchar2(100), --用户id
	pid varchar2(100),-- 商品id
	shop_Count number(10),--商品数量,
	is_Deleted number(1) default 0, --'删除标识字段(0-未删除 1-已删除)',
	create_time DATE default sysdate,--创建时间',
	update_time  DATE default sysdate--'修改时间',

);
--和user 表 外键
alter table HW_SHOPPING_CART
  add constraint FK_USER_CART_USERID foreign key (USER_ID)
  references HW_SHOPPING_USER (USER_ID) on delete cascade;
--订单表
create table HW_SHOPPING_ORDER
(
	order_id varchar2(32) not null primary key,-- '订单表主键id'
	order_no varchar(32),-- '订单号',
	user_id varchar2(32),-- '用户id',
	total_price number(11,2),--'订单总价',
	pay_status number(1),-- '支付状态:0.未支付,1.支付成功,-1:支付失败',
	pay_type number(1) default 0, --'0支付宝支付 1.微信支付',
	pay_time DATE,-- '支付时间',
	order_status number(1) default 0,-- '订单状态:0：待配货 1.配货完成 2:出库成功 3.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
	user_name varchar2(30),--'收货人姓名',
	user_phone varchar2(30),--'收货人手机号',
	user_address varchar2(100),--'收货人收货地址',
  logistics varchar2(32),--物流，
  is_deleted number(1) default 0,--'删除标识字段(0-未删除 1-已删除)',
	create_time DATE default sysdate,-- '创建时间',
	update_time DATE default sysdate-- '最新修改时间'
)
--详细订单表
create table HW_SHOPPING_order_item
(
	order_item_id varchar2(32) not null primary key, -- '订单关联购物项主键id'
	order_id varchar2(32),-- '订单外键id', 
	pid varchar2(32),-- '关联商品id',
	product_name varchar2(200),-- '下单时商品的名称(订单快照)',
	product_cover_img varchar2(300), --'下单时商品的主图(订单快照)',
	product_price number(7,2),-- '下单时商品的价格(订单快照)',
	shop_count number(10),-- '数量(订单快照)',
	create_time DATE default sysdate-- '创建时间'
)
alter table HW_SHOPPING_ORDER_ITEM
  add constraint FK_ORDER_ORSER_ITEM_ORDERID foreign key (ORDER_ID)
  references HW_SHOPPING_ORDER (ORDER_ID) on delete cascade;
  
  
--地址表
create table HW_SHOPPING_ADDRESS
(
    ADDRESS_ID VARCHAR2(32) not null
        primary key, -- '地址主键id'
      USER_ID VARCHAR2(32)
        constraint FK_USER_ADDRESS_USERID
          references HW_SHOPPING_USER
            on delete cascade,
      ADDRESS varchar2(100),
      user_name varchar2(10),--收货人
      PHONE VARCHAR2(20),--手机
      MOREN NUMBER(1) default 0,--是否为默认地址 0是 1否
      TAG VARCHAR2(10),--标记 家 学校 公司
      note varchar2(200) --备注

)

select * from HW_SHOPPING_ADDRESS


--首页公告表
create table HW_SHOPPING_NOTICE
(
	n_id varchar2(32) not null primary key,-- '订单表主键id'
  n_content varchar2(32),--公告内容
  release_name varchar(32),-- 发布者
  -- '发布时间'
  create_time DATE default sysdate
)


--spu表
create table HW_SHOPPING_SPU
(
	spu_id varchar2(32) not null primary key,-- '订单表主键id'
  default_sku_id varchar2(32),--默认sku
	spu_name varchar(32),-- '商品名称',spu_name+sku_name 拼接成商品标题
  spu_desc varchar(32),--商品描述
  spu_PRICE NUMBER(7,2),--商城价格
  spu_msg varchar2(100), --首页-手机底下消息
  spu_IMAGE VARCHAR2(200),--图片路径
  CId number(10),--大类
  delete_flag number(1) default 0 ----删除标记 假删除 0为未删除，1为已删除 默认0
)

create table HW_SHOPPING_SKU
(
	sku_id varchar2(32) not null primary key,-- '订单表主键id'
  spu_id varchar2(32),-- 'spu id'
  --spu_name varchar2(100)，--spu name
	sku_color varchar(100),-- 'sku 颜色',
  sku_version varchar(100),-- 'sku版本',
  sku_service varchar(100),-- 'sku 服务',
  sku_price NUMBER(7,2),--商城价格
  IS_HOT NUMBER(2),--是否热门
  sku_sort NUMBER(10),--排序
  --sku_DESC VARCHAR2(255),--商品描述
  sku_FLAG NUMBER(3),--上架 下架
  --CID NUMBER,--商品大类
  sku_STOCK NUMBER(7) default 0,--商品库存
  sku_DETAILS VARCHAR2(4000),--商品详细 或者使用BLOB替换  java类型 java.lang.byte[];
  deleteFlag number(1) default 0,--删除标记 假删除 0为未删除，1为已删除 默认0
  sku_DATE DATE default sysdate,--添加商品时间
  update_time DATE default sysdate--更新商品时间
)

create table HW_SHOPPING_SKU_IMAGE(

--6张图
   image_id varchar2(32) not null primary key,
   sku_id varchar2(32),--外键 级联删除
   image_main VARCHAR2(200),
   image_one VARCHAR2(200),
   image_two VARCHAR2(200),
   image_three VARCHAR2(200),
   image_four VARCHAR2(200),
   image_five VARCHAR2(200)

)
