/*
 Navicat Premium Data Transfer

 Source Server         : asusOracle
 Source Server Type    : Oracle
 Source Server Version : 100200
 Source Host           : 10.10.2.234:1521
 Source Schema         : XHL

 Target Server Type    : Oracle
 Target Server Version : 100200
 File Encoding         : 65001

 Date: 11/01/2021 17:49:39
*/


-- ----------------------------
-- Table structure for HW_SHOPPING_ADDRESS
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_ADDRESS";
CREATE TABLE "XHL"."HW_SHOPPING_ADDRESS" (
  "ADDRESS_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "USER_ID" VARCHAR2(32 BYTE) ,
  "PHONE" VARCHAR2(20 BYTE) ,
  "MOREN" NUMBER(1) DEFAULT 0 ,
  "TAG" VARCHAR2(10 BYTE) ,
  "ADDRESS" VARCHAR2(100 BYTE) ,
  "USER_NAME" VARCHAR2(10 BYTE) ,
  "NOTE" VARCHAR2(200 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_ADDRESS
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_ADDRESS" VALUES ('61', '101', '15676354203', '1', '家', '广西桂林理工大学', 'xhl', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ADDRESS" VALUES ('21', '101', '15676374033', '0', '默认地址', '广西桂林市雁山区桂林理工大学雁山校区', '熊浩淋', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ADDRESS" VALUES ('41', '141', '15676374103', '0', '学校', '广西桂林市理工大学', '测试', '发中通');

-- ----------------------------
-- Table structure for HW_SHOPPING_CAROUSEL
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_CAROUSEL";
CREATE TABLE "XHL"."HW_SHOPPING_CAROUSEL" (
  "CAROUSEL_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "CAROUSEL_URL" VARCHAR2(100 BYTE) ,
  "REDIRECT_URL" VARCHAR2(100 BYTE) ,
  "CAROUSEL_RANK" NUMBER(10) ,
  "IS_DELETED" NUMBER(1) ,
  "CREATE_TIME" DATE DEFAULT sysdate ,
  "UPDATE_TIME" DATE DEFAULT sysdate ,
  "UPDATE_USER" VARCHAR2(32 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_CAROUSEL
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('54', '/upload/carousel/b3a8acb5-c87e-4dcf-8a6e-a38c3036ff42.jpg', '/upload/carousel/b3a8acb5-c87e-4dcf-8a6e-a38c3036ff42.jpg', '2', NULL, TO_DATE('2020-04-11 12:07:41', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-04 00:04:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('55', '/upload/carousel/687a1dfa-72a0-4129-bcfd-3e1dcffa549a.jpg', '/upload/carousel/687a1dfa-72a0-4129-bcfd-3e1dcffa549a.jpg', '3', NULL, TO_DATE('2020-04-11 12:07:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-11 12:07:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('56', '/upload/carousel/7e28121e-68dc-47b9-a9cb-014d29e87950.jpg', '/upload/carousel/7e28121e-68dc-47b9-a9cb-014d29e87950.jpg', '4', NULL, TO_DATE('2020-04-11 12:08:06', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-11 12:08:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('57', '/upload/carousel/4b37baf2-9e7c-4461-a174-c269b39ecf40.jpg', '/upload/carousel/4b37baf2-9e7c-4461-a174-c269b39ecf40.jpg', '5', NULL, TO_DATE('2020-04-11 12:14:06', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-11 12:14:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('61', '/upload/carousel/e228080c-2dd9-485a-8e2c-07a3244638e2.jpg', '/upload/carousel/e228080c-2dd9-485a-8e2c-07a3244638e2.jpg', '8', NULL, TO_DATE('2020-04-19 12:13:05', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-05 11:14:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('62', '/upload/carousel/b7711fed-ab7a-4c12-98b7-88f1935e895b.jpg', '/upload/carousel/b7711fed-ab7a-4c12-98b7-88f1935e895b.jpg', '6', NULL, TO_DATE('2020-04-19 12:13:21', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-19 12:13:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('83', '/upload/carousel/db8ac6e2-3452-4a58-a6d0-cf57a70358f6.jpg', '/upload/carousel/db8ac6e2-3452-4a58-a6d0-cf57a70358f6.jpg', '6', NULL, TO_DATE('2020-05-16 16:25:18', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-16 16:25:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('81', '/upload/carousel/936eb43e-14cf-473d-a886-fbd41fec0030.jpg', '/upload/carousel/936eb43e-14cf-473d-a886-fbd41fec0030.jpg', '6', NULL, TO_DATE('2020-05-16 16:24:47', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-16 16:24:47', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "XHL"."HW_SHOPPING_CAROUSEL" VALUES ('82', '/upload/carousel/d4346c0c-b3a7-4e13-9660-c20f6a1bf7d7.jpg', '/upload/carousel/d4346c0c-b3a7-4e13-9660-c20f6a1bf7d7.jpg', '6', NULL, TO_DATE('2020-05-16 16:25:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-16 16:25:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for HW_SHOPPING_CART
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_CART";
CREATE TABLE "XHL"."HW_SHOPPING_CART" (
  "SHOP_CART_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "USER_ID" VARCHAR2(100 BYTE) ,
  "PID" VARCHAR2(100 BYTE) ,
  "SHOP_COUNT" NUMBER(10) ,
  "IS_DELETED" NUMBER(1) DEFAULT 0 ,
  "CREATE_TIME" DATE DEFAULT sysdate ,
  "UPDATE_TIME" DATE DEFAULT sysdate
 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for HW_SHOPPING_NOTICE
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_NOTICE";
CREATE TABLE "XHL"."HW_SHOPPING_NOTICE" (
  "N_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "N_CONTENT" VARCHAR2(32 BYTE) ,
  "RELEASE_NAME" VARCHAR2(32 BYTE) ,
  "CREATE_TIME" DATE DEFAULT sysdate
 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_NOTICE
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_NOTICE" VALUES ('22', '联想小新13Pro2020版发布了', 'xhll', TO_DATE('2020-05-16 16:15:19', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_NOTICE" VALUES ('23', '荣耀智慧屏路由新品预约抽奖公告', 'xhll', TO_DATE('2020-05-16 16:15:24', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_NOTICE" VALUES ('24', '一加8Pro发布了，144HZ屏幕', 'xhll', TO_DATE('2020-05-16 16:15:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_NOTICE" VALUES ('25', '小米11重磅来袭', 'xhll', TO_DATE('2020-05-16 16:16:06', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for HW_SHOPPING_ORDER
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_ORDER";
CREATE TABLE "XHL"."HW_SHOPPING_ORDER" (
  "ORDER_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "ORDER_NO" VARCHAR2(32 BYTE) ,
  "USER_ID" VARCHAR2(32 BYTE) ,
  "TOTAL_PRICE" NUMBER(11,2) ,
  "PAY_STATUS" NUMBER(1) ,
  "PAY_TYPE" NUMBER(1) DEFAULT 0 ,
  "PAY_TIME" DATE DEFAULT NULL ,
  "ORDER_STATUS" NUMBER(1) DEFAULT 0 ,
  "IS_DELETED" NUMBER(1) DEFAULT 0 ,
  "CREATE_TIME" DATE DEFAULT sysdate ,
  "UPDATE_TIME" DATE DEFAULT NULL ,
  "USER_NAME" VARCHAR2(30 BYTE) ,
  "USER_PHONE" VARCHAR2(30 BYTE) ,
  "USER_ADDRESS" VARCHAR2(100 BYTE) ,
  "ORDER_CONTENT" VARCHAR2(100 BYTE) ,
  "LOGISTICS" VARCHAR2(32 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_ORDER
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('182', '1827813910243', '101', '2098', '0', '0', TO_DATE('2020-06-07 14:23:37', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', TO_DATE('2020-06-07 14:23:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'xhl', '15676354203', '广西桂林理工大学', '【订金】荣耀 Play4T 大内存大电池 4800万AI摄影 全网通 6GB+......', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('201', '1658486679244', '101', '5899', '0', '0', NULL, '0', '0', TO_DATE('2020-06-12 23:54:33', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', 'HUAWEI Mate 30 Pro 5G 全网通 8GB+128GB 麒麟9......', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('181', '1275242693431', '101', '1199', '0', '0', TO_DATE('2020-06-07 12:54:41', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', TO_DATE('2020-06-07 12:54:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', '【订金】荣耀 Play4T 大内存大电池 4800万AI摄影 全网通 6GB+......', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('221', '1624146772791', '101', '5899', '1', '0', TO_DATE('2020-06-24 09:21:57', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', TO_DATE('2020-06-24 09:21:22', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', 'HUAWEI Mate 30 Pro 5G 全网通 8GB+128GB 麒麟9......', NULL);
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('167', '1120042809890', '101', '1899', '0', '0', TO_DATE('2020-06-06 22:11:52', 'SYYYY-MM-DD HH24:MI:SS'), '2', '0', TO_DATE('2020-06-06 22:11:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', 'HUAWEI MatePad 平板电脑10.4英寸系列 4GB+64GB Wi......', '773040489377218');
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('166', '1244903490205', '101', '3199', '1', '0', TO_DATE('2020-06-06 22:03:21', 'SYYYY-MM-DD HH24:MI:SS'), '2', '0', TO_DATE('2020-05-06 22:02:13', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', '荣耀30 50倍超稳远摄 超感光高清夜拍 40W超级快充全网通 6GB+128......', '611159244265674');
INSERT INTO "XHL"."HW_SHOPPING_ORDER" VALUES ('183', '1639789626467', '101', '1199', '0', '0', NULL, '0', '0', TO_DATE('2020-06-07 15:39:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '熊浩淋', '15676374033', '广西桂林市雁山区桂林理工大学雁山校区', '【订金】荣耀 Play4T 大内存大电池 4800万AI摄影 全网通 6GB+......', NULL);

-- ----------------------------
-- Table structure for HW_SHOPPING_ORDER_ITEM
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_ORDER_ITEM";
CREATE TABLE "XHL"."HW_SHOPPING_ORDER_ITEM" (
  "ORDER_ITEM_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "ORDER_ID" VARCHAR2(32 BYTE) ,
  "PID" VARCHAR2(32 BYTE) ,
  "PRODUCT_NAME" VARCHAR2(200 BYTE) ,
  "PRODUCT_COVER_IMG" VARCHAR2(300 BYTE) ,
  "PRODUCT_PRICE" NUMBER(7,2) ,
  "SHOP_COUNT" NUMBER(10) ,
  "CREATE_TIME" DATE DEFAULT sysdate
 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_ORDER_ITEM
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('182', '182', '85', '荣耀Play 4T', '/upload/products/358a764e-7176-48aa-8728-8168321aee22.png', '1199', '1', TO_DATE('2020-06-07 14:23:04', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('183', '182', '122', 'FreeBuds3 无线耳机有线充版', '/upload/products/0143c428-d7a2-45ab-bf81-d11c9565cbdd.png', '899', '1', TO_DATE('2020-06-07 14:23:04', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('221', '221', '84', 'HUAWEI Mate30 5G', '/upload/products/623e9124-c078-4567-b9a2-d0c32d903310.png', '5899', '1', TO_DATE('2020-06-24 09:21:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('181', '181', '85', '荣耀Play 4T', '/upload/products/358a764e-7176-48aa-8728-8168321aee22.png', '1199', '1', TO_DATE('2020-06-07 12:54:09', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('201', '201', '84', 'HUAWEI Mate30 5G', '/upload/products/623e9124-c078-4567-b9a2-d0c32d903310.png', '5899', '1', TO_DATE('2020-06-12 23:54:33', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('166', '166', '83', '荣耀 30', '/upload/products/8e939624-6a19-4b06-bdc8-7ac491520b0b.png', '3199', '1', TO_DATE('2020-06-06 22:02:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('167', '167', '151', 'HUAWEI MatePad', '/upload/products/99d499ef-7e5f-45f9-ba82-0233c198b50f.png', '1899', '1', TO_DATE('2020-06-06 22:11:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_ORDER_ITEM" VALUES ('184', '183', '85', '荣耀Play 4T', '/upload/products/358a764e-7176-48aa-8728-8168321aee22.png', '1199', '1', TO_DATE('2020-06-07 15:39:21', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for HW_SHOPPING_PRODUCT
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_PRODUCT";
CREATE TABLE "XHL"."HW_SHOPPING_PRODUCT" (
  "PID" VARCHAR2(32 BYTE) NOT NULL ,
  "PNAME" VARCHAR2(200 BYTE) ,
  "MARKET_PRICE" NUMBER(7,2) ,
  "SHOP_PRICE" NUMBER(7,2) ,
  "PIMAGE" VARCHAR2(200 BYTE) ,
  "PDATE" DATE DEFAULT sysdate ,
  "IS_HOT" VARCHAR2(10 BYTE) ,
  "PDESC" VARCHAR2(255 BYTE) ,
  "PFLAG" VARCHAR2(5 BYTE) ,
  "CID" NUMBER ,
  "PSTOCK" NUMBER(7) DEFAULT 0 ,
  "PDETAILS" VARCHAR2(4000 BYTE) ,
  "P_SORT" NUMBER(10) DEFAULT 0 ,
  "P_MSG" VARCHAR2(100 BYTE) ,
  "UPDATE_TIME" DATE DEFAULT sysdate ,
  "DELETE_FLAG" NUMBER(1) DEFAULT 0 ,
  "P_SOLGAN" VARCHAR2(200 BYTE) ,
  "P_BELONG" NUMBER(5) ,
  "P_VERSION" VARCHAR2(100 BYTE) ,
  "P_COLOR" VARCHAR2(100 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_PRODUCT
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('86', '荣耀X9', '1499', '1299', '/upload/products/488931d1-57b2-40a6-b8e3-0e2154003a30.png', TO_DATE('2020-04-15 17:06:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍 6.59英寸升降全面屏 全网通 6GB+64GB（魅海蓝）', '上架', '46', '300', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086729721708"><div id="kindPicture-10086729721708"><p><img alt="整点购赠耳机.png" src="https://res.vmallres.com/pimages/detailImg/2020/03/31/C5DD1B1DC6325A2EC815F94E201B14D12D86C154DC36C13A.png"></p><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/DAC64050DA8B768490C456B26D079151D2C6794804D150A0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/AF8B22F7F63958FE9FCF50F7DC57B6A97A16D631B30F5D79.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/0F8A09AF8FDBB4F6CD65E923CA9671B0EC915E9156188A8A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/17F55D51CD5669F67391FCFFB0710274073A8AEB123EEA93.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/22DB0CD39AEE22F412B52C249D45C843A20654C189C9F50B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/5CE7EDC6470829B90079C2F2CA9C55CB0EE9363AF55807D8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/4DDF4ABD3E74E9E3D83D609569D3F55037E35CF619E487F4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/8271DC7C54AC07E8333805DF8B1992B7BE7FE5101DFBE0F0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/717BBE19A1BFCE2FB9A78C15FCE15D99F63CE28B44C2EEF2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/A7EDA5B0E7CF6BE2FC9BE03689421A91AE46149FEEB3BE4D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/48EF619C089927C2B8779B4D279404130890C2D0C0738F49.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/8FC7C1A84F1EEA2FA1F030198C56A62522B7088D6BA95A8B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/030B43F66FF32E6BC6D6812C91C886764D78B9FD5538B52E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/7A8D47F917A1FCCEC3BEEA9E15D2C24FBC00189170E1E1DA.jpg"></p></div></div></div></div></div></div></div></div></div></div>', '2', '最高优惠300', TO_DATE('2020-04-15 18:58:40', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '0', '全网通6GB+64GB', '魅海蓝');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('87', '荣耀20S', '1499', '1499', '/upload/products/15796350-aea0-4b33-9589-359dfc395415.png', TO_DATE('2020-04-15 17:13:04', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀20S 3200万人像超级夜景 4800万超广角AI三摄 麒麟810旗舰级芯片 全网通版6GB+128GB 蝶羽白', '上架', '46', '298', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/06/02/DB806D00B276AD828E056DAA87A81C497026064ADFC0EA9D.jpg"></p><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086578260728"><div id="kindPicture-10086578260728"><p><a href="https://www.vmall.com/product/10086595752282.html"><img alt="PC banner-24期.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/06/05/1FFEC2DF74D16C5B5754C8B1E830CDCCD8F63664AD0AF279.jpg"></a></p><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/6D22BCCE5790B5B564139869054F804F9A7F0EB7F7E2FE71.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/AC93C9D516591CCF7925F411D677BDBE4495F2A9C55F5225.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/905E0EB6DB951EBE85DCA5C9FA3B480E2800CA59B0FE30ED.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/201D11797D54FFF2F48C04B6D71738B4270980BCEBB11E87.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/8C3313D31EB5828DA20DB497E51F8F327EA3C9CBED92FEF8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/4A048CE0FE284CB1055669534D117E3D94E005A0C1E0C51B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/141E83443141731A63966346C406491B73BA060EDA0B27DB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/D450934299097FF862EC35951FDD59FA73C5448FA44E793A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/5028E877AF94B7639BAA4DACC1F94D1A08BDAB3DA477A543.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/7DD2252CE1387FE82F6A4D8B803529FEDCA0A8CE36E3C161.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/D2FDD7F7D4B152B290E39710C88AA49AE34183B94C7F47FF.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/49484B20341EA5C34BBD4688BFE5607A33C129B0C5EAFBF2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/4B75A8F24C0E2E44DEA631E68808493087156EB6CB7432BD.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/4410C477C966E48D32BB7E1769EBFF4009DF99450B9B2011.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/53B6550F6D14DFA6AEF8FB292BED024AC84C6C6FF824959D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/71B1AF006643A31121188CC325EFDEDB06930A1848735103.jpg"></p></div></div></div></div></div></div></div></div></div></div></div></div></div></div>', '1', '最高优惠400', TO_DATE('2020-06-05 13:01:53', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【荣耀618 到手价1499！整点购机赠好礼】①支付赢5000元旅游基金！②晒单赢10000份自拍杆！（荣耀部分手机型号共享）！', '2', '全网通版6GB+128GB', '蝶羽白');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('90', 'HUAWEI MateBook X Pro 2020款', '9199', '8999', '/upload/products/a1a4218b-d291-48f1-833d-b0b9668120ba.png', TO_DATE('2020-04-16 17:27:54', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【新品】HUAWEI MateBook X Pro 2020款 独显 深空灰 i5-10210U 16G 512G 13.9英寸3K触控全面屏超轻薄华为笔记本电脑', '上架', '50', '500', '<div id="product-tab"><div id="layoutRelative"><p><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086005152054"><div id="kindPicture-10086005152054"><p><img alt="6大卖点1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/04/03/FBCD2DFFE38D80A89C52631E06775D95C8FBF95F192A12A8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/56E9101376D72C785F3413E619F1FAC1AEEBF8041093363F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/6F9044C363F4D3591389777E3D40BDCB80EA6B62C8C53178.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/31FB2C30956FE29FFFF87B8CB4545860C32FCEDAAE16484B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/E379E9B398277132077D1A3E537BC5AEC72860FB433F2778.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/CDE9E09E054A3E416F05D199B13E076F48E1BFB93D285908.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/230601C9D36E7460775E86C924CBFC4FDB8B9E9633883BA7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/EB36543395A70056105057090DDE0533259C74B0A0E0C328.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/7E563CA326C2FCE2C75114A1AA8DC6E7C70C1B2226F79C92.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/7322B24E8929BF567E197F07FD779516896210942FE7895D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/DF57A3F0A0803FCF18368864824636C0E8A9CE5E1B2EC311.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/1A501FBDC13DB2C3039DEB04CB6DF9A00B459B09A39C021D.jpg"></p></div></div></div></div>', '3', '赠鼠标+6期免息', TO_DATE('2020-05-11 18:49:09', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '0', 'i5|16G|512G', '深空灰');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('83', '荣耀 30', '3399', '3199', '/upload/products/8e939624-6a19-4b06-bdc8-7ac491520b0b.png', TO_DATE('2020-04-15 16:41:49', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀30 50倍超稳远摄 超感光高清夜拍 40W超级快充全网通 6GB+128GB 双模5G', '上架', '46', '298', '<div id="product-tab"><div id="layoutRelative"><p><br></p><div></div></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086106856203"><div id="kindPicture-10086106856203"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/7CD952A4CDB5FC9AB79BA20531283C91977E93171C14557A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/75CDCD42EB89EB635F8933E226C1C664F8460606994DC9A0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/69E2D6C8262D8E91582FF24F45005F8ADCFBCF9F6E4E39E9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/A2AE812307FEEDDDFE4AE0AB46433E9ADBA8D64D07505875.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/90F8E8AAEC9A108322066CE969525B43322986029AF732F4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/4B82175CE2DA344FAE04111AB54185C7C9EFADDBFEFE69CE.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/D80B5F171B948B75560748BD526EBA3C8056F6740095AFD8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/E45C04D2D785658F46A8046EBB2EA067D98897441575F0C1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/15ABBD8119DA82835C5FDCE240C150DD6EBCD79145DE0F8E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/4C8C654DD65F4E277255B00F5C6ACF98AC53085E2E47D357.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/D80B5F32EDC482CA406F11CA273311ED304457ADC7FB3004.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/7BC72C6D5A5ACF911432D1349B3EBCE9CAA373A79839845E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/64D93F85F635E629CBF883385CFF565B1792C01F35A1DBBB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/F720D38C3A9673589DA99BDF742949A653E098D6721356E8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/D5B8E459BA5301CD41C77AB50C39AFC920913E7C81BC460B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/14/DA8D9CAFECFF383B9A58C8385E7E4A1C15171715471562DD.jpg"></p><p><br></p></div></div></div></div><div id="hr60Detail"></div><div id="productParameter"><div id="product-parameter-main"><h2 id="productParameterId">规格参数</h2><div id="main-parameter-content-10086106856203"><h2>主要参数</h2><ul><li><label>传播名</label>荣耀30</li><li><label>后置摄像头</label>后置四摄：4000万像素超感光摄像头（广角，f/1.8光圈）+800万像素超广角摄像头（超广角，f/2.4光圈）+800万像素长焦摄像头（f/3.4光圈，支持OIS）+200万像素微距摄像头（f/2.4光圈）<div>备注：不同拍照模式的照片像素可能有差异，请以实际为准。</div></li><li><label>电池容量</label>4000mAh（典型值）<div>备注：电池额定容量为 3900mAh</div></li><li><label>前置摄像头</label>前置单摄： 3200万像素，f/2.0光圈<div>备注：不同拍照模式的照片像素可能有差异，请以实际为准。</div></li><li><label>上市时间</label>2020年4月</li><li><label>屏幕尺寸</label>6.53英寸<div>备注：显示屏采用圆角设计，按照标准矩形测量时，屏幕的对角线长度是 6.53 英寸（实际可视区域略小）</div></li><li><label>屏幕色彩</label>1670万色，DCI-P3广色域</li><li><label>运行内存（RAM）</label>6GB<div>备注：可使用的内存容量小于此值，因为手机软件占用部分空间</div></li><li><label>机身内存（ROM）</label>128GB<div>备注：可使用的内存容量小于此值，因为手机软件占用部分空间</div></li><li><label>分辨率</label>FHD+ 2400*1080 像素<div>备注：该分辨率对应标准矩形，实际屏幕有效像素略少。</div></li><li><label>CPU型号</label>HUAWEI Kirin 985（麒麟985）</li><li><label>CPU核数</label>八核</li><li><label>双卡</label>双卡双待<div>备注：同时可支持如下场景下的双通功能：* 一卡VoLTE通话中，另一张卡VoLTE可来电，可选择接听新来电挂断原通话。* 副卡VoLTE通话中，默认移动数据主卡可同时4G上网（如果主卡为电信卡，需开通VOLTE）。</div></li></ul></div></div></div>', '3', '24期免息', TO_DATE('2020-04-16 09:24:06', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '0', '全网通 6GB+128GB', '钛空银');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('103', 'HUAWEI Mate 30', '3699', '3699', '/upload/products/0eba5cbe-6dab-4a63-b128-202688b72fd8.png', TO_DATE('2020-05-11 19:47:42', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI Mate 30 麒麟990 4000万超感光徕卡三摄 4G全网通 6GB+128GB（亮黑色）', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><p><a href="https://sale.vmall.com/yjhxhwzc3.html"><img alt="Mate 30系列产品.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/04/30/A986DE3CF89864EC57D89EE2B0E23B63CCB3AD3FD96F2B24.jpg"></a><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086061493555"><div id="kindPicture-10086061493555"><p><img alt="6大卖点mate-30_1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/09/19/59B48E349C36DF7C1E9949DDF21F593E6FC97FD0776CBE24.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/AFBBADC8814E0B3A53D44F74518F8811DA6F65A2251A7269.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/F9F3712246BF61ED16FC6D1F54571E634E70CEA78088C38A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/DC4BFC7C4895E3BC13CBD371F2BCA02194D069F9C51FCA1C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/BE3F8A4465C3C0A890A214EFC6BE18A18A9BBBA810A80AC0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/92ABDC4D859ACBA5EC0CA3723571F06D9AAF0C352641CE65.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/C59469CE4F3F0C6CF4490CCBFC4948F7F5599427FC2A1C82.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/1FB367A1294B317BAC5D089AB6BBF92006867BA45B519ECD.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/2B63A21FA84370157AC389F6A58A8E53C8827EEC1C84FEFC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/B05F70330454301E90021CA2D8898FE29D1ACC59AF411028.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/BCC7F35B887A35D542603A1E59572AA5C4979FE0278E7D89.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/FEA4044F602E014EB37CD8FFF27D19A340290B1F7C58FCC8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/44A756628EECFE913C0899CD50FDA5CA14FCE20D48E08053.jpg"></p><p><cus href="javascript: void(0);"></cus><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/47D78C6C4821F0CE21878AF80351D6E9B6FF65A184AE8C47.jpg"></p><p><cus href="javascript: void(0);"></cus><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/17117851E3295AE5930986C0EBE7455877AA727CF1B9D97A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/B980DC93CE698793BD9D6A2D6E6DEFB0FAD068955049B970.jpg"></p></div></div></div></div>', '0', '限时特价，一站式换新', TO_DATE('2020-05-11 19:47:42', 'SYYYY-MM-DD HH24:MI:SS'), '0', '①限时优惠30元 ②享12期免息 ③赠一年期官方碎屏险 ④整点限量赠好礼 ⑤以旧换新立省100元，下拉至详情页参与 ⑥华为老用户购机赠半年延保 点此购买》》》 7nm旗舰芯片麒麟990，强大算力；4000万超感', '2', '全网通6GB+128GB', '亮黑色');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('101', 'HUAWEI Mate 20 RS', '12999', '12999', '/upload/products/7baba7ee-40e3-4b6f-be4c-96eade440376.png', TO_DATE('2020-05-11 18:59:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI Mate 20 RS 保时捷设计 8GB+512GB 全网通版（瑞红）', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><p><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086446456644"><div id="kindPicture-10086446456644"><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/20181016115324704529.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/20181016115324707114.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/20181016115324706353.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/20181016115325026116.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153254699472.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153259757076.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153265884407.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153268780865.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153274147021.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/10/16/201810161153274959853.jpg"></p><p><img alt="责任声明1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/08/16/201908161541111880149.jpg"></p><p><a href="https://sale.vmall.com/company4.html?cid=70667"><img alt="1920x200企业定制服务.jpg" title="" src="https://res.vmallres.com/pimages/detailImg/2020/04/22/CC69880B22083B1BDEFECE46C45E685934F79931D20DE323.jpg"></a></p></div></div></div></div>', '0', '热卖', TO_DATE('2020-05-11 18:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '2', '全网通8GB+512GB', '瑞红');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('102', 'HUAWEI Mate 30 RS', '12999', '12999', '/upload/products/77e1e2c0-436d-4738-bfe8-1ee64e57f499.png', TO_DATE('2020-05-11 19:03:26', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI Mate 30 RS 保时捷设计 5G全网通 12GB+512GB（玄黑）', '上架', '46', '199', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086740273369"><div id="kindPicture-10086740273369"><p><img alt="6大卖点mate30RS保时捷_1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/11/04/6CC13080114E61B7B3FB9DBC8A62924E3AD87A85160EE84B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/ADCD34514843F83E0DC4CD65CA7793FD7EC82036DF96CDE1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/341E8AC9525A7DC49DCD0A79420656885E058E6B38F4B53F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/86AD6EF1F7DADC689BFF696CF4C9FAF50B6FE075B13C330D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/1DC2167E22CC70D6AB3CFE2710F18A685AA8D943B962DFAB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/C8B25F7456B06402252518EC247B2CFD03982D0751CBCA44.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/780E4E0D1534462741A458B4919BDA56229F02BE51BA5735.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/C0CF6130E6D88CE60833E7D24A35F2AF3B8F9CFF36B065B7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/7647012FD17545AABEBEE626646BE40DBC374D62FBABEB63.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/BB8DFF641D57496B48A6E5BD7CF9097651931FFF4867BCB6.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/32FD2A6F1EEF9C7CF791750C5A330E6762853F638EE56CA9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/23/173CA52495EC688CB982231689C61D524F0F57E795B35800.jpg"></p><p><img alt="责任声明1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/07/29/201907290910591967803.jpg"><br></p><p><a href="https://sale.vmall.com/company4.html?cid=70667"><img alt="1920x200企业定制服务.jpg" title="" src="https://res.vmallres.com/pimages/detailImg/2020/04/22/CC69880B22083B1BDEFECE46C45E685934F79931D20DE323.jpg"></a></p></div></div></div></div></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086446456644"><div id="kindPicture-10086446456644"></div></div></div></div>', '0', '分期免息，赠送积分', TO_DATE('2020-05-11 19:03:26', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '2', '全网通12GB+512GB', '玄黑');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('104', 'HUAWEI nova 6 SE', '1999', '1999', '/upload/products/35323152-25f0-4161-938b-6a1ecacbe5fc.png', TO_DATE('2020-05-11 20:17:11', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI nova 6 SE 8GB+128GB 全网通版（樱雪晴空）', '上架', '46', '198', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><a href="https://sale.vmall.com/yjhxhwzc3.html"><img alt="nova 6 nova 6 SE nova 5 Pro.png" src="https://res.vmallres.com/pimages/detailImg/2020/04/30/7822CE3EAE478DCB5CCBE738C74D4DAC6970EA305782D1D7.png"></a><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086465404910"><div id="kindPicture-10086465404910"><p><img alt="6大卖点nova6SE_1920.jpg" title="" src="https://res.vmallres.com/pimages/detailImg/2019/12/30/C6D40469207BA712DF7F1F680A99B7C0C2A2F188CD1AAE1E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/E17397D138A6803961E0D291E8BC0654159BF934A37EE46E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/3FB56905AE5ECB6D5E4DE5BB6F0B10319E12AE7AEEF76812.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/961074C3EFA2912F8D5B6766C9777B93BE42B4FED247678C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/AC52F2E07D07F1653F1CA90E5DDC1DEA82F38974301FFBE4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/88DB10C85631F837534D614EFF1B94F217CFB53EE2FCFD5D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/17989B1324685BC15DC6B397ADC5BDFAF555FE7EBBF84E40.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/30AF5DF0AAEBCDE53444A75B101944A3486B614C958ED461.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/F2D369C26E69C2C9B06C98E340B0E9D31F426BA14E539962.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/FD0815ACA9182D819B2E0F387E844C7A58DEDFDF47A1F5D0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/0D5206BD370D6B8D271B3D657C3250D68722B96E2DC976C9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/2A0F827BF1E35E8736C6025061E3DB9677594FFC2F5D0E02.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/ACC671CEF78CDF37729020969D38F47C263362239BB7B753.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/406274DD6A632D849C7229678FF4880C60C6A3569FEB7D46.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/ED4EB5FCBAAF4FF666BA080516609BB26B352A5A6183DF22.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/AF460B3688D84F66B2DB2CA84B5587C6321B474E17D4A163.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/677C923B8F19372976115FAF0AA313C616C851B17835B708.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/55CE06BABC01BDA595F6074C200F8EA3C0103626758E087C.jpg"></p><p><img alt="责任声明1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/07/29/201907290910591967803.jpg"></p></div></div></div></div></div></div>', '0', '限时特价，一站式换新', TO_DATE('2020-05-11 20:17:11', 'SYYYY-MM-DD HH24:MI:SS'), '0', '限时直降200元，到手价1999元。购机赠专属保护壳+化妆品礼包，赠品有限，赠完即止。 4800万高清镜头+200万景深镜头+200万微距镜头+800万超广角镜头+手持超级夜景，让您随手一拍都成大片。全新升级', '0', '全网通8GB+128GB', '樱雪晴空');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('84', 'HUAWEI Mate30 5G', '6199', '5899', '/upload/products/623e9124-c078-4567-b9a2-d0c32d903310.png', TO_DATE('2020-04-15 16:57:45', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI Mate 30 Pro 5G 全网通 8GB+128GB 麒麟990 双4000万徕卡电影四摄（亮黑色）', '上架', '46', '298', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086752521330"><div id="kindPicture-10086752521330"><p><a href="https://www.vmall.com/product/10086728754058.html"><img alt="1920.jpg" title="undefined" src="https://res.vmallres.com/pimages/detailImg/2020/03/03/CB211F2F6F08A1AA44B3A7333F9B8E92C579B9742FAF3E75.jpg"></a></p><p><cus href="javascript: void(0);"></cus><img src="https://res.vmallres.com/pimages/detailImg/2019/12/04/E6B83EBA31A978DF2F1C3B819103CBAD2D8E42B378DD4F8E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/2CF20E83520DE9E25DB6C43DE6C1B9C4804E3F344876AE9D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/1FB7789C25FE22907D5B541ED7E5A53421A6F86ADE7257B4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/E4D90FBBA401F361DDA78C04E809CF9F89D462FCA8E5DE6C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/0F163655965C91AE4BF692CC3BC9106C479DC4DCFF3FC99A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/8C38E7A7409419B55073B0B7F07996247EE6C13F6D4D7C12.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/2DC6735F7833BAF19FED05059C33BD34D2A8A6B2964EE518.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/8F1AAB30D0364650EE1F54C80825DAA693AA35A3D598383B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/190B179B485425423E5E2B9F61979E5CE9FE7DAA02CB3654.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/7E4241EC5D6F2BDDBA45EA596BA521BA5095C5D51B562472.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/8EB9079A6C5A05914681BAC0CD077C68B0DAE293A0CA8C3C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/6323F92E6D595683786AD19EFC5C48AA7D9ADB18A0F0EAA1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/D2BA05DCFCA5CE7ED69E01D698DFC77D62B98B475CC60096.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/371A9992472DBBC7592215CAE6BC4B5406A0E93A8BB8899D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/F1564E4EF3FE1F0DE8261741FF216F24490D8663241EB0CF.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/E07AA1AC19325D6583BB71FD5FD77AAA9432B0392CDE65BB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/BFE89F5B0A2BD605506AFC927F086B8FEED77442D24C7ECB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/6D38C89D6020E5E1D77C0244C2F65F2F58C48B2C23471A97.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/CBC672E8E6643A4DA6C257E8CF8F76AA9F51F579E550453F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/2DCF5CD2E5D67F8A0332F52FCA5F398056CDDD11CBA291F8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/5657BA43852F3EBAE73842CD2AB461E2649E37984D8BD31C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/0C58B56B234019B37A239A904D8EAD863D2E7D01175C75C8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/FCA96D7C343761190A09D5D48B54CBB564C39AEC07E8EDBE.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/E064C178FEDEC16AEF0E3C8DEDE56A7C9A42CFDAEEF3B419.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/01/E03C60F501C8BC2C8F09A768055FE8EABB9A98BAD098EC87.jpg"></p><br></div></div></div></div></div></div>', '6', '享12期免息', TO_DATE('2020-04-16 15:59:48', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '0', '全网通8GB+128GB', '亮黑色');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('85', '荣耀Play 4T', '1399', '1199', '/upload/products/358a764e-7176-48aa-8728-8168321aee22.png', TO_DATE('2020-04-15 17:03:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【订金】荣耀 Play4T 大内存大电池 4800万AI摄影 全网通 6GB+128GB（蓝水翡翠）', '上架', '46', '292', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="新品预订福利banner-pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/04/13/0D0938F9EB7F1D3ED4958D93A73E2CF36DC4B4086CD2C445.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086509456428"><div id="kindPicture-10086509456428"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/A86D393726BB967CEF7150F5796D5884582259987CA46371.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/61DC650CA8EA481855FB83259C6A262F2796C1329175E46B.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/8091BF25819B534EF1F3ABC3FFB29E412F742B07C535DBF0.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/78F06CF01F18A35F76DB782E0F7B6E5E8AB91582FF72953A.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/DDF4BE7FF6F389CB501689C2D9898D4F51CC2E458ADFF086.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/B7A52D79AB8C107439263F50F1B1D1769A218A66D131398C.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/2ADE580DD8C6A2E971073A2E898776B8E84334ABF0651A0C.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/5BD1E53E4E68E4C6856F5B63243FFB1F0495B02E50D4214E.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/962C96232E93B6FC58FC7F8D849BA40ED4E90F3F7DFE79CC.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/C3D95C8B3D4991D34AC67DE994BDFA2410EB0E94EA139E5B.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/07/7237B2313AF507DB3C4DE2CE6A2F32DE5C4C7ED861BEEA84.gif"></p></div></div></div></div></div></div></div></div>', '7', '定金预定赠耳机', TO_DATE('2020-06-04 18:14:25', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '0', '全网通6GB+128GB', '蓝水翡翠');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('121', '荣耀9X', '1399', '1199', '/upload/products/c7422208-5af0-4cf7-a276-8c7c4d12cb00.png', TO_DATE('2020-05-18 13:01:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍 6.59英寸升降全面屏 全网通 4GB+64GB（魅海蓝）', '上架', '46', '2999', '<div id="product-tab"><div id="layoutRelative"><p><a href="https://sale.vmall.com/honorx10.html"><img alt="详情页1920_300.png" src="https://res.vmallres.com/pimages/detailImg/2020/05/13/32C0AF07725E36BB28A3413F4ADFAB8A4BC5E95D75CD0E63.png"></a></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086087893146"><div id="kindPicture-10086087893146"><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/DAC64050DA8B768490C456B26D079151D2C6794804D150A0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/AF8B22F7F63958FE9FCF50F7DC57B6A97A16D631B30F5D79.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/0F8A09AF8FDBB4F6CD65E923CA9671B0EC915E9156188A8A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/17F55D51CD5669F67391FCFFB0710274073A8AEB123EEA93.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/22DB0CD39AEE22F412B52C249D45C843A20654C189C9F50B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/5CE7EDC6470829B90079C2F2CA9C55CB0EE9363AF55807D8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/4DDF4ABD3E74E9E3D83D609569D3F55037E35CF619E487F4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/8271DC7C54AC07E8333805DF8B1992B7BE7FE5101DFBE0F0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/717BBE19A1BFCE2FB9A78C15FCE15D99F63CE28B44C2EEF2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/A7EDA5B0E7CF6BE2FC9BE03689421A91AE46149FEEB3BE4D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/48EF619C089927C2B8779B4D279404130890C2D0C0738F49.jpg"></p></div></div></div></div>', '0', '限时特价，24期免息', TO_DATE('2020-05-18 13:01:06', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【现货速发】①优惠200！成交价1199！②晒单抽5000份精美耳机（荣耀品牌商品共享）③购机支付赢好礼', '0', '全网通4GB+64GB', '魅海蓝');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('141', '荣耀9X PRO', '1399', '1399', '/upload/products/53b4331b-bca6-449c-9fa1-ff4016c4e1c9.png', TO_DATE('2020-06-06 18:50:28', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀9X PRO 麒麟810液冷散热 4000mAh超强续航 4800万超广角夜拍三摄 6.59英寸升降全面屏 全网通 6GB+64GB（幻影紫）', '上架', '46', '122', '<p><img alt="整点购赠自拍杆.png" src="https://res.vmallres.com/pimages/detailImg/2020/06/01/E681EDEE342F6D44F7EBD03736EE0462779BBA8814BB7CE5.png"><br></p><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086525922507"><div id="kindPicture-10086525922507"><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/77024CEE6816783C0C187385ED1916C5F4688A9D56B0A084.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/7C04F15319A80E50FAC9B35324E8FBD86446EC2D5A83823D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/7351BD3A2214F42AD1D87A60B4323A929127561E31420371.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/41A569F69C0B4D57952527978C864EB96247F5911CF94BA6.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/E7EE4E262C4D633E04FA4A3FFEF022A8FB97FC84B1DC7525.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/80C667035FE9C05481EBF327EB133C923BEDBB85144E509D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/04B26AC29F75CBC09BFBFAD941381B81BCFE0DBEE7B684B4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/142F2CF7B74937F6C7394FD8A40DC052E87F8F34C61AAD3F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/8801FCC83F17DA308715CE4734133131477A79CCABD76D75.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/25/2982FEDE3B4454646DEA1DE263036B6CB83A9C02EBC91A13.jpg"></p><p><img alt="1_01.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/01/02/092A4B1BB60B3C933A8107CF362990CF232CF5220E50AA81.jpg"></p></div></div></div></div>', '2', '限时特价，24期免息', TO_DATE('2020-06-06 18:50:28', 'SYYYY-MM-DD HH24:MI:SS'), '0', '最高优惠20+12免息', '2', '全网通6GB+64GB', '幻影紫');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('142', '荣耀V30', '2699', '2699', '/upload/products/5d42ba30-a9e8-459b-895e-9544ee3d40ed.png', TO_DATE('2020-06-06 19:41:48', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀V30 双模5G 麒麟990 突破性相机矩阵 6GB+128GB 幻夜星河 李现同款', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/04718A7751B35910BEAA471204669FF3EF908917D8F50970.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086850321788"><div id="kindPicture-10086850321788"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/155E8744ECD97E0411041E0AE79581BC655974525E35097B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/23718097E2E8E78527565C12D15A07C5930EFF37F79C616E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/77B75776A2E69AD5B903D89DF0CDCD47C586E4C1F769AA20.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/491B303E4920612EFB9AF97079442D405C31DB14DC1CD137.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/AA5C2C82F1465EB7D6C612A1D508A5904665B93FF942603D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/E0B9E46438A2FCBCD86F3E63A8FED0DC353504C50E7E4424.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/B84E9BD920F1BAB4A47A94959B3176D83D0F034A6FCC9278.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/54CF4C2C27F0909B48197698CF3622A00436FE335ADF45C3.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/BB869D3D4DC6AD22012106E43CD32C2CE554F7C1D0204116.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/DD8B5BEEDD586C422EAEA4DAE21C6CE97B8CAC765570D0E0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/E5391134025D90CD9EFCA19E52A99854BF4AFA7A99119BC7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/5B2B600AAAE637028FC2057D5F87939E4D64DA110D96AB20.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/BE1484875BC331EFBA8364196E8060F9FC2D3F8D5B442302.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/584BD30B77D83CD6D6F5966F4EE4F1D05EE504002CA6FAB7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/9D78A698E3340E7E08344D5388AAF7140CE97C84D7C4DCE2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/01/13/1FD09DE0B2A6FDA30A51D10D9A9615A73F681B5C7000651B.jpg"></p></div></div></div></div>', '1', '全息优惠600', TO_DATE('2020-06-06 19:41:48', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【荣耀价保618】到手低至2699元①限时优惠600元，享24期免息②整点购机限量赠Running手环③双倍积分抵现最高优惠50元④以旧换新最高补贴300元', '2', '6GB+128GB', '曙光之橙 ');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('110', 'HUAWEI P30', '5088', '4488', '/upload/products/d904851d-891a-4a1f-b4f9-80b44d5253bf.png', TO_DATE('2020-05-11 20:23:23', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 双景录像 8GB+128GB 全网通版（深蓝色）', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/975B5E43CDFD1B5419A180E16442066C1AB75DFCFBCC6C18.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086068755052"><div id="kindPicture-10086068755052"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/C3C8D8C2E61CAE19A0363B871EF0AE03309BDECBDFEF1806.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/C2D306CCAC2EC519D13B3D859DE79282EBB7A527ABD2AF42.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/55A528BCC5A06014135F6B29C89B12629E75951AD1ABD827.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/29CC5947F59F72D9621435D5A962F32A81034A581D13CF04.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/6267EE000B078B0B544D2D023121CBA29CFE9C12410AF364.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/44A1C407FA37588D46DFEDA351D115C2831526DE9A31037A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/A6ECC70F0909E09FD85160FA2E9BABA5686DB41818F82417.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/0FDE459C80940461176DA7DA5FC4AF5D1FDF4CBC2BBB52F6.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/E2C7D4F52886D8EAC6B20A147F34B6EB46809AE9163C1111.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/65EF426C5C15120F26E6DF767AABD374832EC6C03EB6FC21.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/24DC274A1121E0975D17624F200B912C11636DAAC5251A6B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/4762557D46AC74895C99EAD77A158494E012317F544D63A5.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/C77085854AF0F3960071A6BBA7C4BF8875863F3EE5EC5481.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/19F3EAA94E77AE4D8F4FC1B1A5364E79864064D53C7AD2DC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/1E3B4761B48CE61E42812C4E336E7E74CCCD6F64A6713904.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/59F3753E1C699FA6FB0B55CA28C41A91C3D793B9D06C6408.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/D43657B88DB36D6D30AD476D9F6EAC8151FC1BA1B4B51B56.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/C6A6108A65CBB1B220AA547D902CDE17AEE452DDCF86D3A3.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/C7F84E2DB2E5FEBB49F6A9DAD2D2C1AC53A76F55E7BD96C8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/F01D6AB5D3A7664A12B434EF3A9B4BA5F87F4899F6B72D53.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/1275E6FEAFF333E0AC1A44F33AEDEF080D338DFB3BEBEC25.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/CF2CFABB2FB732BB8EFEA32330AE71212640D9F93DDB9D09.jpg"></p><p><br></p><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/06/400ECE0D95A69A420400C427E89526BA5F1D68F12D43806F.jpg"></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p></div></div></div></div></div></div></div></div>', '0', '分期免息，赠送积分', TO_DATE('2020-05-11 20:23:23', 'SYYYY-MM-DD HH24:MI:SS'), '0', '领券立减300 ，享12期免息 。旗舰5G新品P40火热销售中，购机享多重权益，点击查看>>> 华为P30 Pro尊享金卡专属服务权益包含：①保修期内（不含延保）可享2次免费保养②1小时快修服务③金卡专属热', '0', '8GB+128GB', '深蓝色');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('111', '荣耀智慧屏PRO', '3199', '2999', '/upload/products/99dd94b6-0f71-4d11-8605-460082377317.png', TO_DATE('2020-05-11 23:36:36', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【好产品 高标准】荣耀智慧屏PRO 55英寸4K超清全面屏 鸿蒙系统 鸿鹄818芯片 升降摄像头 开机无广告', '上架', '54', '1000', '<div id="product-tab"><div id="layoutRelative"><p><img alt="5月PC-家庭配件.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/04/30/9AFE1F5FEC8E9BDB61EE47305D4B2A56A2CE085B6C268849.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086505225192"><div id="kindPicture-10086505225192"><p><img alt="1920 1.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/03/31/E65655D0DA011B693A39F06405CD737F489AABB97ED54DCE.jpg"></p><p><img alt="1920温馨提示.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/01/10/423A1DB26C24F01D0BA7D22FB636D7430C941F01550FBFDE.jpg"></p><p><img alt="连获4奖海报-1920-2.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/11/20/73DC8913F93B8DA8FDFBC50BC0D26E7018243F0ABF7A7A26.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/73B04716B9185AC27E421D31722827F78B520F87C5DAD594.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/8358DFF20DA41F92EF8687B3CE00E6C71A9BE5D0280A4D46.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/B6ED5A09F17D08740811FCE8838BB9B267A47C3DD34DDE05.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/EC74B5CCFCB55EBE4D0C10E7CED266D44B92DC031288C6BC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/DE98D283C30CE8E6AA7908AAB5230804F47880473E088427.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/CC6237898B18584F22AF0FA021D6E9215FC4A13F641471FD.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/6743C26E588805D4489F49806CC31DD835AECF51F202FE1A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/4E5FF07E589D33FE212CF83408F9837C63E9DF3B4304F836.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/B51AEE2E29124DDC1631560AB48299F8296742CA3CEDAF9A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/FAED4D42FE34B976005AE27F629EAB58C5EC198F7594147F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/7B28AE3271718A7F85FB3FF12FE98E083BB85E8751D8A214.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/9372322F9BC1B9EE9E891D34E35444E01B2354586582D2D8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/52293608C3512B6C7BF0D3674ED9F093B3ED051CC8E10F13.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/31/CE91E91147C1DC1F61318C753AC9CF80E4BC201E39F5E40C.jpg"></p></div></div></div></div>', '0', '分期免息，赠送积分', TO_DATE('2020-05-11 23:36:36', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【特惠：限时直降1300元，赠498元赠品（含299元直播精灵+199元YOYO音箱，单品数量有限，以订单为准），享3期免息，购机晒单抽好礼！】 首款搭载鸿蒙系统，鸿鹄818智慧芯片，94%屏占比全面屏，魔', '1', '55英寸4K屏', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('122', 'FreeBuds3 无线耳机有线充版', '899', '899', '/upload/products/0143c428-d7a2-45ab-bf81-d11c9565cbdd.png', TO_DATE('2020-05-28 15:04:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【订金预订】HUAWEI FreeBuds 3 无线耳机 有线充版（陶瓷白）', '上架', '55', '199', '<div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/0356FE0AB183AE320A1DAC1967DAFCB9E5900C5D5FEDB47D.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086526426438"><div id="kindPicture-10086526426438"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/CE5F9321A922D4C5B49827FFBAADB3ABCBD0E1A35854AB01.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/FB8DFFF617F519BC2A57528292D204376B5F98908A9FD217.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/07B3107F05BB4AC3718F4DB52392930B13D357BA3033816F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/39BBEDE8E50D15AB9C019F01CE7B77F822A90FE5185CC992.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/5720E14D05893581F5FB073F04ED3D3D30AF7E1F90B3EEC9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/6E8ED77B11A6AE85FF9E05FD74D1875F8A82E9DEE395303B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/C197711D16F7E4253EB82E7502DAA224866DEF4BE2DC70FC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/C904E48E6A9AB97DBFE8CB8CD2FEE9852BE528830528A5BB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/4CF26529F3080A6BB7C015CDCD829FCB6A80C73531B73070.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/A99C8C69E009ED3A6CC7DCC78A6A671BB70E8E93C206FFE0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/3FE58CBF733F510BCFB38E84C299F5D3441D81286E69ABFC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/C9EB622D247727E7CAFDB311ABEF0A31D69747CDF9ECB169.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/41FCA406F59A0C48B1D6ED816FE26773F71BEA44D48CBA95.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/20/EE2829003E462976C797891E2CF371A62B8BBDCF81865A19.jpg"></p></div></div></div></div>', '0', '新品预订价749', TO_DATE('2020-05-28 15:04:35', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【新品预订优惠150】①到手价749元，6月1日支付尾款和发货 ②享3期免息 ③晒单赢好礼', '1', 'FreeBuds3', '陶瓷白');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('123', '荣耀智慧屏X1', '3299', '3299', '/upload/products/22ea4b76-41fe-4523-9822-1b3dd1962536.png', TO_DATE('2020-05-28 15:10:45', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【新品预订】荣耀智慧屏X1 65英寸4K超清全面屏 8K解码 鸿鹄818芯片 大小屏互动 高色域 开机无广告', '上架', '54', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/3C2F72ED8C2E37EB79077B065C5DD42458ACFA29F06E2E44.jpg"></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086378735644"><div id="kindPicture-10086378735644"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/9923CC6CD66DCAEBAE83AD731BEAD6476B7F892ED82AA4F4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/C4D51ABFB5A0FB7404B68213CAE11C90C83B951E0881F902.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/D24C2BFA8517BE6F946D29D4B0E392D13B5E11DF80917DCF.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/56787B94B51D40B299445A10B5700E2C7AD445FFF06A122C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/7433A40862C5A3718C7E1E7C0E9DE70457AB0C6D92FB13B2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/0F4E5E82F3AD0A2AF87E122C5A326F6B51727319F48756A1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/FC1FE8D63BD2730B0A941D81C130588F7F1BD3EA348AF812.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/31AE02A1216E230F57DDD125F39552ED5D375CDC2BBA23BF.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/EA62DA9186A37799B4F8831C8D36B46D9C0BC58FE3A69E62.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/B522D67D8F0B44BD5B9BE9AB4C72AF53BBDD2D32C8293D8C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/A6CC8154FE8C6A5B3C78F6883BCA9A0C895F6C8EECF553B9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/087343254106A0A4FA20F7B9A49367F610064C41430DD2A5.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/61019169350E6E8381323F9C091197EAEF57560638F4E61B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/B2892D163932A3D61564A4E66C1BC92CBE7E72CEEC3D3C6A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/AB6ED7FC2171FCDC60C5B3E118D89B634B55CBD92295D682.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/3564D9DB646D0CB285646BD9BCE289D32F78FAAD73DFBCBE.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/D64ADA5D8E74B82F5426A7123C4C7622D7A5F3815235BCAC.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/F8A93010B8E783A25C3F78A95F4FFC9F5CCEDE793731B666.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/7DFDF0D113E7868802575EA16154C58C7F01F2D881A3D72E.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/C11BEEC3EEDF7E708CACD14BDE2308F493B973F167EB9C6D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/F5696264905762FF6DE4BE47C895F54742FD44154969C203.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/49179CEC53AAC5EAD031FA1BF07C4547700ED636A3A04C99.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/E4E4ACB4B6500BF8ED18C5F240CC3D44D38AAD002DA85AA8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/26/2A425B5F6F52F3D5464F978419FCA9D66C1CAFD68A1C74D4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/26/F5E9F2C8A5F12DEE49355847CC67AE890EB0B3847C03EB03.jpg"></p></div></div></div></div></div></div>', '0', '预定最高剩1500', TO_DATE('2020-05-28 15:10:45', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【新品预订优惠150】①到手价749元，6月1日支付尾款和发货 ②享3期免息 ③晒单赢好礼', '1', '65英寸4K屏', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('124', 'HUAWEI MatePad Pro', '5299', '5299', '/upload/products/da4271a7-e8cf-4968-a83a-bc9b45f88707.png', TO_DATE('2020-05-28 15:17:20', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【订金预订】HUAWEI MatePad Pro 5G 10.8英寸 8GB+256GB 全网通（青山黛）', '上架', '51', '200', '<p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/26/590ABD65C0DA879C0D7E7ABBCEC7168C7683366B3AC1AE05.jpg">&nbsp;&nbsp;<br></p>', '0', '新品预定最高剩1500', TO_DATE('2020-05-28 15:17:20', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【新品预订】：①预订立省300元 ②晒单送皮套 ③享6期免息。点击了解更多商品>>>', '1', '全网通8GB+256GB', '青山黛');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('143', '荣耀V30', '899', '899', '/upload/products/fb0e4601-dca6-49af-a314-fe4fb0953ffb.png', TO_DATE('2020-06-06 19:44:38', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀畅玩9A 全网通 4GB+64GB 蓝水翡翠', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="整点购赠自拍杆.png" src="https://res.vmallres.com/pimages/detailImg/2020/06/01/E681EDEE342F6D44F7EBD03736EE0462779BBA8814BB7CE5.png"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086302351919"><div id="kindPicture-10086302351919"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/8430D5A360908E54A146C9088178659CFB25489697E15EDD.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/62ED34887F617D6CDBCCEB73843CE9A7B6D39D9CE2F1A94A.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/E2DF4A35D3CEF98EB68395C1FFAD862368DEA0EB982BAD2F.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/9AF40272F2291BDFAF8F371FADD18300034CFD3C2E0AFFA0.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/AA4DCB24B39E2BF2C4E4CD609B7D2AF11E88A9BC07465673.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/322A1414234C395A74690EAA57CD949D3A540772FB519B76.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/8296F609DC4FC055B7FBEC9CA28A979AAD27002B06F417D6.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/23A3923ACC9D545A0B4CA463223F46133DBABE78E925751F.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/505F876FF1EE41F13B38D9EB466A16DA32AA971AC8199E99.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/37C2530D721B92916898E1736BB538511AF12BFAD4A72F38.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/FA92D666462A8C041D8959A190600215F0B354AD932EF72E.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/A61EF7E7209A2AE6BE62D9C873E69C40C185C6B10984A501.gif"></p></div></div></div></div></div></div>', '0', '购新机畅好礼', TO_DATE('2020-06-06 19:44:38', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【618 现货速发】①整点赠好礼②双倍积分抵现', '2', '6GB+128GB', '蓝水翡翠');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('144', '荣耀畅享 10S', '1599', '1599', '/upload/products/656f19bf-e790-4e06-b6df-06a9a40f4896.png', TO_DATE('2020-06-06 19:47:40', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀畅享 10S 6GB+64GB 全网通版（翡冷翠）', '上架', '46', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="6大卖点_1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2019/10/30/804F6A4798374EA85A447A15992D97388BD90A7B692F3EE8.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086343272630"><div id="kindPicture-10086343272630"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/F41FA1AA27A5502DCF30DBCE1720B5FB58E32E83DFCB3BA9.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/8E722F6F017FE49119EDA908C86C24A679E9FAF9434952D3.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/C0C795E49F1BF27927A5F0A27D28DAD03A8C7601CC398C70.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/620D38E856738A73D561754BB9E6FB0D1413F75DB61BAB35.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/B8123E46C9FF42AF17FACDE0399853B322A29B9B9B8EE148.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/FE92B5A3464584FAE6DA32501C45FCBC31DE4FC7C808DB41.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/10/25/AB20869631806B9E3E4AC6BED682522F7C7EF135214D0FB4.gif"></p></div></div></div></div></div></div></div></div>', '0', '购新机畅好礼', TO_DATE('2020-06-06 19:47:40', 'SYYYY-MM-DD HH24:MI:SS'), '0', '6.5-7智慧生活节】 ①领券减300 6.3英寸炫彩OLED全面屏|4800万超广角AI三摄|手持超级夜景', '2', '全网通6GB+64GB', '翡冷翠');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('145', 'HUAWEI 2020MBookX', '9988', '9988', '/upload/products/6daf4980-6680-42a8-88a2-6c5f7cf62965.png', TO_DATE('2020-06-06 19:54:47', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【新品】HUAWEI MateBook X Pro 2020款 独显 翡冷翠 i7-10510U 16G 512G 13.9英寸3K触控全面屏超轻薄华为笔记本电脑', '上架', '50', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/7798B44F301848E7399C11630340A3BB444350380CBA44FE.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086928251602"><div id="kindPicture-10086928251602"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/CBB4BB4F636E7CA16110C4F0358C13F2AB820377DDCC5A14.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/B498285CE5927441492C550BCB72CB05DAC1B8ADE68C4189.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/A3540096C2A8C045522D25D14D10D3F96DBECA3E4816D536.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/33E9724566771F0BADB704D9213E77F53A579955AC9B316D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/E6EE809E558590564C45E2426C703C9324CFCA44CC0B1DF3.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/E971260BD34CA7D6810B717C9088E010384C370BB0C7EDA7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/925C4A621304BB60A0D814780A69F32479B7EA2BA56B7864.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/AA9658B6F078771BFD7C0FFF2C7B12F2027B8D85157B063D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/EE4A861867C401ECB5197F9E332F92E20F1E050758466354.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/06/B04AF4A8EAFC46CB4C97D4D847C242925758D13AB52FB3AA.jpg"></p></div></div></div></div></div></div></div></div></div></div>', '5', '24期免息', TO_DATE('2020-06-06 19:54:47', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11 特惠预订】：① 提前预订优惠100 ② 赠蓝牙鼠标 ③ 享3期免息丨点击立即预订 》》 3K触控全面屏 手机电脑多屏协同 第10代英特尔处理器', '3', '全网通6GB+64GB', '翡冷翠');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('125', 'HUAWEI Mate Xs 5G', '16999', '16999', '/upload/products/df174c43-9d73-4a40-897f-e49b155f2536.png', TO_DATE('2020-05-28 15:23:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI Mate Xs 5G全网通 8GB+512GB（星际蓝）', '上架', '46', '100', '<p><img src="https://res.vmallres.com/pimages/detailImg/2020/02/25/FA66229631E14DE379245F746F5EA02F1CF1D8BB5E633C5B.jpg">&nbsp;&nbsp;<br></p>', '0', '科技新物种', TO_DATE('2020-05-28 15:23:53', 'SYYYY-MM-DD HH24:MI:SS'), '0', '①赠半价换屏服务 ②每周一、三、五10:08开售，更多华为产品优惠，可点击前往＞＞＞ 下方“保障服务”选项中可选购碎屏服务宝 鹰翼式折叠设计|麒麟990 5G旗舰芯片|8英寸可折叠全面屏', '2', '全网通8GB+512GB', '星际蓝');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('126', '荣耀20', '2299', '2299', '/upload/products/f38cb2a6-46bf-4f8d-aaff-f0f2b58ceb7d.png', TO_DATE('2020-05-28 15:27:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀20 PRO 4800万全焦段AI四摄 麒麟980全网通版8GB+128GB 蓝水翡翠', '上架', '46', '100', '<p><img src="https://res.vmallres.com/pimages/detailImg/2019/09/03/AA2F942318910D8E49997A8438C0987D5466D3F0932F39E2.jpg">&nbsp;&nbsp;<br></p>', '0', '分期免息，赠送积分', TO_DATE('2020-05-28 15:27:19', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【现货速发】①到手价2299元，限时直降400元②整点购机赠音箱', '2', '全网通版8GB+128GB', '蓝水翡翠');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('146', 'HUAWEI MBook2020', '5888', '5888', '/upload/products/0b8a87e9-e225-42c6-aac8-149936fea075.png', TO_DATE('2020-06-06 20:08:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI MateBook 14 2020款 独显 i5-10210U 8GB 512GB（皓月银）2K全面屏 第十代英特尔处理器 Windows版华为笔记本电脑', '上架', '50', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/27/391A715ED28016793BB86AE4DD7B45C6079DD26467EF2B52.png"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086285251790"><div id="kindPicture-10086285251790"><p><img alt="14-6大卖点手环_1920.jpg" title="undefined" src="https://res.vmallres.com/pimages/detailImg/2020/03/03/6C8BCBF773492E5FD21AA0C9CD575A135264244A33F2E227.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/7CFA897FEEBC01EC7F7F6BDBC1B3CE7993777AF057A20A26.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/41E4F621AB35B7D2DCEF276550854E1E1ADD9403E99F87EB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/7B78BBB6F13B5E8463F2C72E7E3929A1893E48A434289D41.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/6AED604BEB8D510F02AA64F99238230255A50C4AE2E8486B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/0A31BB63C5650BA2D025FE573644BE0E85637A897BC880C2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/1EB59B13CC7A2A98346FC874A88E86F2FDE11BD768BA54DA.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/270C21067D19E32CC7B58A7CECD42F5966EBDB7106D4C604.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/16CD8BE64CAE3A54A79D22EE9526EA8A382EAA7AA21A62C4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/B0B2DFF4FC1C171B474B75B4BCCD92FA6DA8C7B14A595C62.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/1250EC9E1DF11604BE7AE4D1E8C550A9A5A61AA505E2EA8D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/E2CA05B0DD45988AD6DA092F78105E5FF101DEB094647B26.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/73A9121A524F4569CBDDBF207CC5315459F1F2728DD597AE.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/A16069F9676E4AEFE977086BCCA87F6D7AA40B12184A39B1.jpg"></p><p><img alt="201809291755495645560.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/02/10/276E0DDACCCE14D9682B7CF7D8209166C37C00F8B7A9AD36.jpg"></p></div></div></div></div></div></div></div></div></div></div></div></div>', '4', '24期免息', TO_DATE('2020-06-06 20:08:35', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11 特惠预订】：① 提前预订优惠100 ② 赠双肩包或蓝牙鼠标 ③ 享3期免息丨点击立即预订 》》', '3', 'i5|8GB|512GB', '皓月银');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('150', '荣耀笔记本Pro', '4299', '4299', '/upload/products/622920d5-b501-473f-b5d1-6fdaa5b80c49.png', TO_DATE('2020-06-06 20:44:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀笔记本Pro 16.1英寸笔记本电脑 i5-8265U 8GB 512GB 独显（冰河银）MagicBook Pro', '上架', '50', '200', '<div id="product-tab"><div id="layoutRelative"><p><img alt="家庭配件pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/06/01/6183C3DCDDA4EF2652F5CE5774C271E2593662B98DBD1820.jpg"><img alt="6大卖点-PC.JPG" src="https://res.vmallres.com/pimages/detailImg/2019/07/24/201907241652058168613.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086051430538"><div id="kindPicture-10086051430538"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607459059237.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607459051206.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607459050734.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/20190723160747919717.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/20190723160747830454.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607471477858.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607475557171.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607475787549.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607476275087.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607483126301.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607484273697.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/07/23/201907231607485223977.jpg"></p></div></div></div></div>', '2', '618最高降400', TO_DATE('2020-06-06 20:44:37', 'SYYYY-MM-DD HH24:MI:SS'), '0', '16.1英寸高清全面屏，100%色域值，窄边框轻薄机身，全新第八代酷睿处理器，高性能体验，14小时长续航，魔法一碰传高速传输，指纹一键开机登录，游戏级散热，新一代MX250独显，高能视觉体验！', '3', 'i5|8GB|512GB', '冰河银');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('151', 'HUAWEI MatePad', '1899', '1899', '/upload/products/99d499ef-7e5f-45f9-ba82-0233c198b50f.png', TO_DATE('2020-06-06 20:53:51', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI MatePad 平板电脑10.4英寸系列 4GB+64GB WiFi（贝母白）专属教育中心 强劲性能 沉浸音乐 华为智能学习平板', '上架', '51', '99', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/8826C33A131367F28C788BA2692C03A350ADBAD01C1833FC.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086567790125"><div id="kindPicture-10086567790125"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/10C7DBEA04950397BD5F49D489BA105D85FC00DF8896BE4B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/FACEAE17F293A43DADBDB72067158EB6A060C356F897B893.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/36D7730A401B927BCAD83BC3AA6766A85065A4694753184B.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/C96C433BC841F8EF2822165A8E1C2BA72120997E4D718663.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/BD6E4845D1D9C02A794CD25F78A05F740F99C96979FB9C1D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/F9BD9B2AFE2CF497269B710A1A6795B37300FF4F6C969E17.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/E4AB6F05F6F89C9CD63D16861F3C93CEA51058F9606EE4A3.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/882B2562229F7BD909D6ECDCA6F5832A69EBED5116BB96B7.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/6175FB147414B2CE86A782E3C64565393C8FA9609A4E1C48.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/E09C67F55F63E6F4EA20B2537284738DC1BDE9FB9F045908.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/C72340C7275890B0723EAD20F9B73BE404137668DE08B568.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/861A9D4ED293EE48259E0722688E92E57B2F0FE6C0266461.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/04/28/DE285884D35AEE4BF08A448D935273ADB9CCDCB9A91C6E48.jpg"></p></div></div></div></div></div></div>', '5', '预定立剩100', TO_DATE('2020-06-06 20:53:51', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11特惠预订】：① 提前预订优惠100 ② 享3期免息 | 点击立即预订 >>>', '4', 'WiFi 4GB+64GB', '贝母白');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('152', '荣耀平板5', '1899', '1899', '/upload/products/8849767d-5b94-4139-b573-2959773164c6.png', TO_DATE('2020-06-06 20:56:42', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀平板5 10.1英寸 4GB+128GB WIFI尊享版（冰川蓝）', '上架', '51', '100', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="家庭配件pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/05/31/B4E50EE39EF30049A1C8E203A8E1BEF3B92D52465D1BA40F.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086791872462"><div id="kindPicture-10086791872462"><p><img alt="获奖海报-拷贝-2.jpg" title="" src="https://res.vmallres.com/pimages/detailImg/2019/01/29/201901291054307056958.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617318036145.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617321159355.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617321660984.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617362563530.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617365832459.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617376717423.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617376171156.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/20180927161738066171.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617391217728.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617388801414.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617391760582.jpg"><img src="https://res.vmallres.com/pimages/detailImg/2018/09/27/201809271617406866195.jpg"></p></div></div></div></div></div></div></div></div>', '5', '预定立剩100', TO_DATE('2020-06-06 20:56:42', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11特惠预订】：① 提前预订优惠100 ② 享3期免息 | 点击立即预订 >>>', '4', '全网通4GB+64GB', '冰川蓝');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('153', '荣耀平板V6', '1899', '1899', '/upload/products/4088c897-2ad4-46c3-b274-350ba233a149.png', TO_DATE('2020-06-06 20:58:49', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '华为平板 M6 10.8英寸 4GB+128GB WiFi（香槟金）麒麟980芯片 2K高清屏 应用分屏 一屏两用 哈曼卡顿调音 四声道四扬声器', '上架', '51', '100', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="购机福利_pc_02.jpg" title="undefined" src="https://res.vmallres.com/pimages/detailImg/2019/07/01/20190701095306520375.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086178019083"><div id="kindPicture-10086178019083"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/128D231830B7E47EC593802B7527118852122506A709EA15.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/6CEB2E2B3A8B8BC9E7BC116256103F19110CFDC83864BA93.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/6A75EBD41BCA9F5E8D579809FEC0718390001B1AB83C8C95.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/1C60A945078094372EC8305E8E6746E3DEE8D6754AA495D1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/11182D10F84D647AFDE908AF709ED992AB28FF16346FDC38.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/97A8CC84CCBD19AC08D19CFDF9C529E97E7990E917F609C0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/D8626B1FCC0BED2E9591F4EC8946ECD512961036B5D23D38.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/525AA8AECF36AAF5DA46463E14DF53B4A6CFA19900F212D1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/481DBB99C230247F9971B353160730A18ED659EFA7DC0123.jpg"></p></div></div></div></div></div></div></div></div></div></div>', '5', '预定立剩100', TO_DATE('2020-06-06 20:58:49', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11特惠预订】：① 提前预订优惠50 ② 享3期免息 | 点击立即预订 >>> 麒麟980芯片 2K高清屏 应用分屏 一屏两用 哈曼卡顿调音 四声道四扬声器 儿童模式 多重护眼 智能平板电脑', '4', 'WIFI4GB+128GB', '香槟橙');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('154', '华为平板 M6', '2699', '2699', '/upload/products/eb2b6a11-1fe4-4b84-bbb4-a52ec6a4013b.png', TO_DATE('2020-06-06 21:01:06', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '华为平板 M6 10.8英寸 4GB+128GB WiFi（香槟金）麒麟980芯片 2K高清屏 应用分屏 一屏两用 哈曼卡顿调音 四声道四扬声器', '上架', '51', '100', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="购机福利_pc_02.jpg" title="undefined" src="https://res.vmallres.com/pimages/detailImg/2019/07/01/20190701095306520375.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086178019083"><div id="kindPicture-10086178019083"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/128D231830B7E47EC593802B7527118852122506A709EA15.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/6CEB2E2B3A8B8BC9E7BC116256103F19110CFDC83864BA93.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/6A75EBD41BCA9F5E8D579809FEC0718390001B1AB83C8C95.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/1C60A945078094372EC8305E8E6746E3DEE8D6754AA495D1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/11182D10F84D647AFDE908AF709ED992AB28FF16346FDC38.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/97A8CC84CCBD19AC08D19CFDF9C529E97E7990E917F609C0.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/D8626B1FCC0BED2E9591F4EC8946ECD512961036B5D23D38.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/525AA8AECF36AAF5DA46463E14DF53B4A6CFA19900F212D1.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/11/22/481DBB99C230247F9971B353160730A18ED659EFA7DC0123.jpg"></p></div></div></div></div></div></div></div></div></div></div>', '5', '预定立剩100', TO_DATE('2020-06-06 21:01:06', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11特惠预订】：① 提前预订优惠50 ② 享3期免息 | 点击立即预订 >>> 麒麟980芯片 2K高清屏 应用分屏 一屏两用 哈曼卡顿调音 四声道四扬声器 儿童模式 多重护眼 智能平板电脑', '4', 'WIFI4GB+128GB', '香槟金');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('155', '华为畅享平板', '1799', '1799', '/upload/products/cbfb2478-a404-422a-9b07-f6cdd9443577.png', TO_DATE('2020-06-06 21:03:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '华为畅享平板 10.1英寸 4GB+64GB 全网通（香槟金）高清显示屏 护眼模式 儿童乐园', '上架', '51', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="畅享卖点1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2018/11/06/201811061038081202399.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086280077367"><div id="kindPicture-10086280077367"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/20190819091931982775.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919371518878.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919372678706.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919368466965.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919373939918.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919383140369.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919386297012.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/08/19/201908190919388183418.jpg"></p></div></div></div></div></div></div></div></div></div></div></div></div>', '5', '预定立剩100', TO_DATE('2020-06-06 21:03:07', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11特惠预订】：① 提前预订优惠50 ② 享3期免息 | 点击立即预订 >>> 麒麟980芯片 2K高清屏 应用分屏 一屏两用 哈曼卡顿调音 四声道四扬声器 儿童模式 多重护眼 智能平板电脑', '4', 'WIFI4GB+64GB', '香槟金');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('156', '荣耀手表2', '1199', '1199', '/upload/products/742bf68b-08f6-4e78-baca-89c3d34de802.png', TO_DATE('2020-06-07 09:13:08', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀手表2 46mm 运动款碳石黑MagicWatch', '上架', '52', '200', '<div id="product-tab"><div id="layoutRelative"><p><img alt="家庭配件pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/06/01/6183C3DCDDA4EF2652F5CE5774C271E2593662B98DBD1820.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086532539312"><div id="kindPicture-10086532539312"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/ECBBAD0B7150B3CBB644E33E7C1B1BB3711A4CAD4857F928.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/9F3491DDE917618EC2D3D3592C74CBBCF713A7CE54E95054.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/BAD6FAF27D18B3F809ED81A280371A342D22D006BD4EE810.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/0B54BA6B6F9EFECFDCABE2CC1D273C24340F595FE7E3F501.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/61316E58B10A1EA4306B4539998E09D1E2191C9A9178AAF9.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/551A36CDFFA6BFA057F85380A3E954F04B44CDF664753847.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/43EBDC559F584EFF183AEC4D68901D7A0860F71435A44C13.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/9E92DBB9B636C790DB4D0976A44F0C16FE8FF511A2489A1D.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/7FA8AEC87AA736C682F98D0A28BF44F9625B317F58A1742E.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/15D8EC1545E129AB5EB0B8E259ABA377CAF0676D98BE78DE.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/22533C01878E98AB3E00060746D571574846DEFDE181FB67.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/04787B8FDC3C395CF30462968B04E1851C82AF2CF9151BBE.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/FF0AE26CA4E4B4D3C6A68219AA7B895EE3C54866CF4C09E9.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/A23A6FFC65BDB8665BF5398309F928EF1B473A969909E642.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/0A4C5EF4DF793C939E9F475DF9730950A6CD3CDB67DDEF35.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/C44982B9F5FCC2E2BF8FD84118118552A7EA3B124BE0497A.gif"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/20/1EF45B6EA4719BD6A7217D9B3C2EED034A7BAB1F6E1FAAEB.gif"></p></div></div></div></div>', '2', '24分期免息，赠送积分', TO_DATE('2020-06-07 09:13:08', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【608特惠日预售 | 提前预订 到手价799起 GO ~>】①享24期免息！②整点预订限量送荣耀手环5i ③支付赢5000元旅游基金；④晒单赢10000份自拍杆；', '5', '单品', '碳石黑');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('162', '柯南', '20', '10', NULL, TO_DATE('2021-01-11 17:20:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '名侦探柯南', 'dd', '1', '0', NULL, '0', NULL, TO_DATE('2021-01-11 17:20:21', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, NULL, NULL, NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('163', '柯南', '20', '10', NULL, TO_DATE('2021-01-11 17:22:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '名侦探柯南', 'dd', '1', '0', NULL, '0', NULL, TO_DATE('2021-01-11 17:22:07', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, NULL, NULL, NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('147', 'HUAWEI MB 13 2020款', '5888', '5888', '/upload/products/b53f15e1-216c-4fb2-aba8-5b1b9bf30c2c.png', TO_DATE('2020-06-06 20:11:19', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'HUAWEI MateBook 13 2020款 独显 i5-10210U 16GB 512GB（皓月银）2K触控屏 第十代英特尔处理器 Windows版华为笔记本电脑', '上架', '50', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/27/0163969DD301DF9CE3475ED22639421A68D670861A75CBE8.png"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086991127817"><div id="kindPicture-10086991127817"><p><img alt="13-6大卖点手环_1920.jpg" title="undefined" src="https://res.vmallres.com/pimages/detailImg/2020/03/03/DC5AA0E70CEF0C4D6DBDCDC77192CBCDDC9C5AF3A2208C06.jpg"></p><p><br></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/92BE657E1F0FA2AAA6C3241244ECD8363E5F228A4E1C245C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/AB1A00A0D9D125A1D04FE9ED0589458935806FA08E94D41D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/3810CE9B5AE1F8AFDE05F1469348C526077AA304B4FEA4BE.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/4D81A6AEAA727F7DC041E4D13B3635B2C5EA320E55B0CC2C.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/0C364FCC694F3322BCB03C318179F015D6BD44A3BC876FDF.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/5B0C684DCB117E64E0F2B43702365E3EFA7471CDB920AC6D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/868F54D8BFCBA7EA808D1F536AE3DFE585205C7C81D7D734.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/4ECCEA00A8130069FC3D283AEF66341597694859B9E3C3AB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/C8308DA72E9B2FF4206305CEADD882C9FD3CDE5027F3E614.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/4EC0A691807E832ABE0243D1D92F519EE6E48DCEE456A18F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/8D0870A6A0292046627F7E71DF5484C685C286228EE8B652.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/03/03/7E40B45213BCD4FB5B29551C1A37207BAB743A1E3A530B82.jpg"></p><p><img alt="201809291755495645560.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/02/10/BFC8FDA914DFAA353608D11E978BD84A79F3E8B4BBD38BD2.jpg"></p></div></div></div></div></div></div></div></div></div></div></div></div></div></div>', '5', '24期免息', TO_DATE('2020-06-06 20:11:19', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.11 特惠预订】：① 提前预订优惠200元 ② 赠扩展坞或蓝牙鼠标 ③ 享3期免息丨点击立即预订 》》', '3', 'i5|16GB|512GB', '皓月银');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('148', '荣耀笔记本14', '3799', '3799', '/upload/products/392001bb-4db4-4241-ac3d-9b4cd1f7834b.png', TO_DATE('2020-06-06 20:15:11', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '荣耀笔记本14 预装Win 10操作系统 14英寸笔记本电脑 Ryzen 5 3500U 16GB 512GB(冰河银)MagicBook 14', '上架', '50', '200', '<div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><div id="product-tab"><div id="layoutRelative"><p><img alt="家庭配件pc.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/06/01/6183C3DCDDA4EF2652F5CE5774C271E2593662B98DBD1820.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086499296270"><div id="kindPicture-10086499296270"><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/D42A976802EB93BFFC28FF95C9730214AB3DCBD79C370806.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/6F9E191024CD61808DFAC20A5D25E0BDF899E95228447995.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/3ABBBEC4914965DBED9221D6CE4B91A25C98C1F3AF12C075.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/0E9B1AA2C1B0BDBB160E983B197830CB78CA1DE4C219FF47.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/0DF0C21EDE35A8E3FC7E34104B4E9D15A069FBA5E934AFD3.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/E2B617AC03CF00A0C5C2C1FF96A66248A06B1954360D2E3D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/D70148D174D23E65C89E05E240FB83B3A752FAC2E8D44B89.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/05C02CCD4EE3D3F4A3D8E2E5B1ACC4B91D66D82FFE5BA732.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/E0CF69C8B970845493F40CD456FB42D0E3BED0144D0E33E4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/FC7E615B1655BF11D2AE0BF00634438B2BFBFB78DDEEE020.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/D6F920A0E0ACB675A71C3F8553D9C0A2E1938B1D2D28EEA3.jpg"></p><p><img alt="14-1920.jpg" src="https://res.vmallres.com/pimages/detailImg/2020/02/21/D55CC9F18F43A9F95D224CDBE51B7323BD3095656E50BE60.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/DB2A93605ECCB18208A56B0E3EF03085CAEF61F0CAAFDDF2.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/DBE30005FC87C4E46F1DE775E375CE25C0094EED2CB940B5.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2019/12/20/49E24D699132AE3736415B4762359DDE2C31C799A170EF36.jpg"></p></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div>', '1', '618最高降400', TO_DATE('2020-06-06 20:23:57', 'SYYYY-MM-DD HH24:MI:SS'), '0', '【6.6 超级电脑日特惠：①限时直降400元 ②加赠荣耀手环（数量有限，以订单为准） ③积分翻倍抵现，最高多抵30元 ④晒单抽赢10000个自拍杆！】【预订用户点击支付尾款=》GO】 全面屏微边框轻薄机身，', '3', 'R5|16GB|512GB', '皓月银');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('161', '柯南', '20', '10', NULL, TO_DATE('2021-01-11 17:18:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '名侦探柯南', 'dd', '1', '0', NULL, '0', NULL, TO_DATE('2021-01-11 17:18:09', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, NULL, NULL, NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('164', '柯南', '20', '10', NULL, TO_DATE('2021-01-11 17:25:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '名侦探柯南', 'dd', '1', '0', NULL, '0', NULL, TO_DATE('2021-01-11 17:24:54', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, NULL, NULL, NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('165', '柯南', '20', '10', NULL, TO_DATE('2021-01-11 17:26:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '名侦探柯南', 'dd', '1', '0', NULL, '0', NULL, TO_DATE('2021-01-11 17:26:06', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, NULL, NULL, NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT" VALUES ('157', '荣耀路由3', '199', '199', '/upload/products/b64747e6-61b8-4113-9251-1cfed3414d8f.png', TO_DATE('2020-06-07 09:36:45', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '【新品上市】荣耀路由3 Wifi6+智能分频 凌霄双核3000Mbps 多穿一堵墙 儿童保护+加速利器', '上架', '53', '200', '<div id="product-tab"><div id="layoutRelative"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/CB4109653EEDE8EAA56B728D6F9FD65830112E78169026F3.jpg"><br></p></div></div><div id="pro-tab-feature-content"><div id="pro-detail-contents"><div id="pro-detail-content-10086218706127"><div id="kindPicture-10086218706127"><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/ECBA9CABD72802AA207EE250F3B4F9EC876F922C08C53DCA.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/896FDD4C902247F69979CEFB6F2835BAC7037A026C841A93.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/6669A8EABE376856CDA02734CA933159E88C72398E5BFB8A.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/31E7C155AE0664C742F4417E37C4540C609DAEB8384E781D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/D6F38E94E335C6C5D606AE59B5FCFD8A39B0CDE30BC8D796.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/F440156BDE58753C1DC66499F7FC79BC094FCB9E2DA944A6.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/49C7B6B5417185EA3E42D6A57E04D1A7BE251A565166B3B9.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/ED340681BCFD9BFAD0C3071662A3A95701378DCAC7FC1145.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/392627B7C2DC8037909FC85E7EADF5BBB87ECA84F1D7FC52.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/5174BE71E0A4401A01B70C7C0B44EF430E2EB8F8FDD93E4D.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/DBF73C07BFEE9DBC574B173C25C4AD3BD2C8A00CE7DAFAD8.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/531F3D8E040D4FDAC82DA9C4AD4AC103C288E17CE64E0A91.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/E18DF48FE197C27B43FA48B1A359B60C3AC048841DDF6786.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/FC9FF1D6C496D04A158F5FB6B9CFF6DD7346BF689EECA8CB.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/99416F2324E5E197524815B07EC7CF26963570F5921E9D57.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/94B9E65E4294637FBCBF88B61337639C79E02AABEF90057F.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/68DBAE9BC96E9A43EB93074052CECAE5AB89D376A35809A4.jpg"></p><p><img src="https://res.vmallres.com/pimages/detailImg/2020/05/18/AA0D11B6AE2725BE418A3A57C69B2BA199364E68AE025663.jpg"></p></div></div></div></div>', '2', '分期免息，赠送积分', TO_DATE('2020-06-07 09:36:45', 'SYYYY-MM-DD HH24:MI:SS'), '0', '领券立减30，享12期免息 ', '6', 'R5|100', '白色');

-- ----------------------------
-- Table structure for HW_SHOPPING_PRODUCT_TYPE
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_PRODUCT_TYPE";
CREATE TABLE "XHL"."HW_SHOPPING_PRODUCT_TYPE" (
  "CID" NUMBER NOT NULL ,
  "PARENT_TYPE_ID" NUMBER(5) ,
  "TYPE_NAME" VARCHAR2(100 BYTE) ,
  "SORT" NUMBER(5) ,
  "TIMAGE" VARCHAR2(200 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_PRODUCT_TYPE
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('186', '50', '荣耀笔记本', '3', '/upload/nav/583aada2-fc80-4983-8ed4-485a22e973b3.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('187', '51', 'HUAWEI MatePad', '3', '/upload/nav/1349772e-2235-47d9-8fd7-3c603da0d0f2.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('188', '51', '荣耀平板', '3', '/upload/nav/e197f5b6-3d72-455f-bfe7-6acf89940803.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('189', '51', '华为平板', '2', '/upload/nav/000aec88-11b9-410a-b92f-0eb46f222b08.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('184', '50', 'HUAWEI MBook2020', '2', '/upload/nav/ab9c8d9e-d5b4-43de-87d0-f5661d2a0424.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('185', '50', 'HUAWEI MB 13 2020款', '5', '/upload/nav/93fa7af6-d9b7-44b5-a0f3-69b5fc8848b2.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('46', '-1', '手机', '0', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('75', '46', '荣耀X系列', '1', '/upload/nav/cf0f8f0f-5f00-4173-99ce-e13ea7a15dc0.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('51', '-1', '平板', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('128', '50', 'HUAWEI MateBook X系列', '1', '/upload/nav/8ae3bcbe-3af8-48f3-b9cd-6c2ddfcee3b4.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('52', '-1', '智能穿戴&VR', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('53', '-1', '智能家具', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('54', '-1', '智慧屏', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('55', '-1', '耳机音箱', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('56', '-1', '配件', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('57', '-1', '增值服务&其他', '1', NULL);
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('181', '46', '荣耀V系列', '1', '/upload/nav/4aae35de-3f1b-4b95-b4c7-4de42bc13ef4.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('83', '46', '华为麦芒系列', '1', '/upload/nav/8119bfc6-5e56-46d2-974e-ed0fd20c4b29.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('182', '46', '荣耀畅玩系列', '1', '/upload/nav/aba34929-c8b2-4001-b673-5e4323cebf31.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('183', '50', 'HUAWEI MateBook X PRO 2020', '3', '/upload/nav/38529f94-44fa-4024-a6ca-70662c1c8502.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('190', '52', '荣耀手表', '1', '/upload/nav/9cc9a996-a6f0-49bb-9717-30640adcc501.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('81', '46', '华为Mate系列', '1', '/upload/nav/c67f258e-8d06-47cd-b3eb-d4b2c9ef5a4a.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('82', '46', '荣耀Honner系列', '1', '/upload/nav/e0c6554b-5f50-43da-b71e-529434a9b258.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('101', '46', '荣耀Play系列', '2', '/upload/nav/98154678-49fd-4b01-9d96-ffac5dde8ca8.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('141', '46', 'nova系列', '1', '/upload/nav/ee5ac95a-c6ff-4efc-98ce-3ec25b8e0950.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('142', '46', 'P系列', '1', '/upload/nav/9ab66cbd-d73d-4561-a2d8-40a70ccd8ecd.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('143', '54', '荣耀智慧屏', '1', '/upload/nav/e1919e10-8d35-41c4-9d03-5ef9a71918e9.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('162', '55', '无线耳机', '1', '/upload/nav/6fe72bf2-6c95-454a-a9b1-f790ad74d2ef.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('163', '51', 'HUAWEI MatePad', '0', '/upload/nav/d57865ae-c051-48c7-962f-c04ac50d0102.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('164', '46', 'HUAWEI Mate', '0', '/upload/nav/85394ad6-1aca-4a02-941a-6c9681f7f3fd.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('191', '53', '荣耀路由', '2', '/upload/nav/874216f6-adf3-4487-8c3f-1f0272e18037.png');
INSERT INTO "XHL"."HW_SHOPPING_PRODUCT_TYPE" VALUES ('50', '-1', '笔记本', '0', NULL);

-- ----------------------------
-- Table structure for HW_SHOPPING_SKU
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_SKU";
CREATE TABLE "XHL"."HW_SHOPPING_SKU" (
  "SKU_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "SPU_ID" VARCHAR2(32 BYTE) ,
  "SKU_COLOR" VARCHAR2(100 BYTE) ,
  "SKU_VERSION" VARCHAR2(100 BYTE) ,
  "SKU_SERVICE" VARCHAR2(100 BYTE) ,
  "SKU_PRICE" NUMBER(7,2) ,
  "SKU_DATE" DATE DEFAULT sysdate ,
  "UPDATE_TIME" DATE DEFAULT sysdate ,
  "IS_HOT" NUMBER(2) ,
  "SKU_SORT" NUMBER(10) ,
  "SKU_DESC" VARCHAR2(255 BYTE) ,
  "SKU_FLAG" NUMBER(3) ,
  "CID" NUMBER ,
  "SKU_STOCK" NUMBER(7) DEFAULT 0 ,
  "SKU_DETAILS" VARCHAR2(4000 BYTE) ,
  "DELETEFLAG" NUMBER(1) DEFAULT 0--删除标记 假删除 0为未删除，1为已删除 默认0
 ,
  "SPU_NAME" VARCHAR2(100 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for HW_SHOPPING_SKU_IMAGE
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_SKU_IMAGE";
CREATE TABLE "XHL"."HW_SHOPPING_SKU_IMAGE" (
  "IMAGE_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "SKU_ID" VARCHAR2(32 BYTE) ,
  "IMAGE_MAIN" VARCHAR2(200 BYTE) ,
  "IMAGE_ONE" VARCHAR2(200 BYTE) ,
  "IMAGE_TWO" VARCHAR2(200 BYTE) ,
  "IMAGE_THREE" VARCHAR2(200 BYTE) ,
  "IMAGE_FOUR" VARCHAR2(200 BYTE) ,
  "IMAGE_FIVE" VARCHAR2(200 BYTE) 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for HW_SHOPPING_SPU
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_SPU";
CREATE TABLE "XHL"."HW_SHOPPING_SPU" (
  "SPU_ID" VARCHAR2(32 BYTE) NOT NULL ,
  "SPU_NAME" VARCHAR2(32 BYTE) ,
  "SPU_PRICE" NUMBER(7,2) ,
  "SPU_MSG" VARCHAR2(100 BYTE) ,
  "SPU_IMAGE" VARCHAR2(200 BYTE) ,
  "SPU_DESC" VARCHAR2(100 BYTE) ,
  "DEFAULT_SKU_ID" VARCHAR2(32 BYTE) ,
  "DELETE_FLAG" NUMBER(1) DEFAULT 0 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_SPU
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_SPU" VALUES ('4', '荣耀30 Pro', '3999', '新品', '/upload/spu/aff28869-35fd-45b9-8ffc-8faaede8936c.png', '荣耀30 Pro 50倍超稳远摄 超感光高清夜拍 双模5G 麒麟990 5G SoC ', '1', '0');
INSERT INTO "XHL"."HW_SHOPPING_SPU" VALUES ('2', '小米', '1999', '16年精品', 'C:\fakepath\荣耀X系列.png', '1', '2', '0');
INSERT INTO "XHL"."HW_SHOPPING_SPU" VALUES ('3', '一加7', '3999', '新品', '/upload/spu/2474e201-ec57-4d5e-a93c-dff34ee4268d.png', NULL, NULL, '1');
INSERT INTO "XHL"."HW_SHOPPING_SPU" VALUES ('5', 'HUAWEI Mate 30', '4499', '新品', '/upload/spu/dfbec1ba-e66e-4165-bfd5-1d4994cc420d.png', 'HUAWEI Mate 30 5G 全网通  麒麟990 4000万超感光徕卡三摄,2', NULL, '0');

-- ----------------------------
-- Table structure for HW_SHOPPING_USER
-- ----------------------------
DROP TABLE "XHL"."HW_SHOPPING_USER";
CREATE TABLE "XHL"."HW_SHOPPING_USER" (
  "USER_ID" VARCHAR2(10 BYTE) NOT NULL ,
  "USER_NAME" VARCHAR2(20 BYTE) NOT NULL ,
  "PASSWORD" VARCHAR2(32 BYTE) NOT NULL ,
  "NAME" VARCHAR2(20 BYTE) NOT NULL ,
  "EMAIL" VARCHAR2(30 BYTE) NOT NULL ,
  "GENDER" VARCHAR2(5 BYTE) NOT NULL ,
  "BIRTHDAY" DATE ,
  "IS_SYS" NUMBER(1) DEFAULT 0 NOT NULL ,
  "MOBILE" NUMBER(11) NOT NULL ,
  "REGISTER_TIME" TIMESTAMP(6) ,
  "HEAD" VARCHAR2(200 BYTE) ,
  "LOGIN_COUNT" NUMBER(32) DEFAULT 0 ,
  "LOGIN_IP" VARCHAR2(32 BYTE) ,
  "LOGIN_LAST_TIME" DATE DEFAULT sysdate 
)
TABLESPACE "XHL"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HW_SHOPPING_USER
-- ----------------------------
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('101', 'wangjianni', '96cf058bc81ebb3b5da56b7fd9aaed82', '汪汪汪', '1445695649@qq.com', '女', TO_DATE('2020-05-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '18176957041', TO_TIMESTAMP('2020-05-09 13:27:24.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '243', '192.168.2.190', TO_DATE('2020-06-24 09:20:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('41', 'tan2323', '9b4afef470e072a6aa7c757b30d3906f', 'tanqiao', 'qiaoqiao@qq.com', '女', TO_DATE('2020-03-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15675695489', TO_TIMESTAMP('2020-03-01 18:41:01.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-04-17 17:08:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('121', '2323', 'a1a29f9e230baa720df6329bc42942a0', '4545', 'tan23@qq.com', '男', TO_DATE('2020-05-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15756858888', TO_TIMESTAMP('2020-05-14 17:24:54.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 17:24:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('123', 'xhlltq', '8ee422569b00c40105218f1cedb8b566', 'ffs', 'dffdfd@qq.com', '男', TO_DATE('2020-05-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15765822222', TO_TIMESTAMP('2020-05-14 17:25:49.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 17:25:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('124', 'sxjj', 'b4994ea8a626f5a1d3c518207c2926b5', 'xhll', 'xjxx@qq.com', '男', TO_DATE('2020-05-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15676374258', TO_TIMESTAMP('2020-05-14 18:01:04.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 18:01:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('126', 'tanqiao23', '96cf058bc81ebb3b5da56b7fd9aaed82', 'tanqo', 'tanqiao@qq.com', '女', TO_DATE('2020-05-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15756852999', TO_TIMESTAMP('2020-05-14 18:04:11.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 18:04:11', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('129', 'lgyy', '71afd08f0b308332e0e269ba1104b3ff', '梁光毅', 'lgyy@qq.com', '男', TO_DATE('2020-05-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14569821033', TO_TIMESTAMP('2020-06-14 23:18:05.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 23:18:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('102', 'zhangshiqian', '905a8c185c7bcb2692f89f371214c90d', '张识虔', 'zhangshiqian@qq.com', '男', TO_DATE('2020-05-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15678564033', TO_TIMESTAMP('2020-05-13 23:00:11.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-13 23:00:11', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('81', 'tan23', '96cf058bc81ebb3b5da56b7fd9aaed82', 'tq', '1445695867@qq.com', '女', TO_DATE('2020-04-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15763547822', TO_TIMESTAMP('2020-04-29 17:00:29.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-04-29 17:00:29', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('8268', 'xhll', '96cf058bc81ebb3b5da56b7fd9aaed82', 'xionghaolin', '717825538@qq.com', '男', TO_DATE('2020-02-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', '15676374033', TO_TIMESTAMP('2020-02-11 19:19:01.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'http://cdn.layui.com/avatar/168.jpg', '123', '192.168.2.190', TO_DATE('2020-06-24 09:22:31', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('22', 'xionghaolin', 'dc7970bc906a724239f557008606329e', 'xionghhsa', 'xionghalin@qq.com', '男', TO_DATE('2020-03-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', '15746859233', TO_TIMESTAMP('2020-03-26 15:13:23.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.191', TO_DATE('2020-04-17 17:08:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('82', 'huangwq', '978e737b7c9aebaf1582aabc6620b4aa', 'Huan', 'hwq123@qq.com', '男', TO_DATE('2020-04-07 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14852698752', TO_TIMESTAMP('2020-04-29 17:01:26.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.191', TO_DATE('2020-04-29 17:01:26', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('141', 'ceshi', '96cf058bc81ebb3b5da56b7fd9aaed82', '测试账户', 'ceshi@qq.com', '男', TO_DATE('2020-06-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15676258423', TO_TIMESTAMP('2020-06-06 17:45:07.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.1.103', TO_DATE('2020-06-06 17:45:19', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('35', 'tanqiao', '2d5197816fdd7e35cc984e160cc781d5', 'hdjdhjd', 'xionghl@landray.com.cn', '男', TO_DATE('2020-02-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14565896522', TO_TIMESTAMP('2020-02-26 19:27:32.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.250', TO_DATE('2020-04-17 17:08:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('67', 'xionghaowen', '36f055c408d4962124629385029109a1', 'xiongha', 'xionghdhd@qq.con', '男', TO_DATE('2020-04-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '15675954822', TO_TIMESTAMP('2020-04-10 18:00:10.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.249', TO_DATE('2020-04-17 17:08:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('127', 'lalal', '8f0182b1976bb9da142ce290b91f1fcf', '啦啦啦', 'lalla@qq.com', '男', TO_DATE('2020-05-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14586523699', TO_TIMESTAMP('2020-05-14 22:15:40.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 22:15:40', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "XHL"."HW_SHOPPING_USER" VALUES ('128', 'nyss', '17250898a9219e6e9c825d8c34f026f1', '农颜生', 'nyss@qq.com', '男', TO_DATE('2020-05-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '14585962033', TO_TIMESTAMP('2020-05-14 23:15:09.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '1', '192.168.2.190', TO_DATE('2020-05-14 23:15:09', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_ADDRESS
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ADDRESS" ADD CONSTRAINT "SYS_C006785" PRIMARY KEY ("ADDRESS_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_ADDRESS
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ADDRESS" ADD CONSTRAINT "SYS_C006784" CHECK ("ADDRESS_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_CAROUSEL
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_CAROUSEL" ADD CONSTRAINT "SYS_C006652" PRIMARY KEY ("CAROUSEL_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_CAROUSEL
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_CAROUSEL" ADD CONSTRAINT "SYS_C006651" CHECK ("CAROUSEL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_CART
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_CART" ADD CONSTRAINT "SYS_C006701" PRIMARY KEY ("SHOP_CART_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_CART
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_CART" ADD CONSTRAINT "SYS_C006700" CHECK ("SHOP_CART_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_NOTICE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_NOTICE" ADD CONSTRAINT "SYS_C006817" PRIMARY KEY ("N_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_NOTICE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_NOTICE" ADD CONSTRAINT "SYS_C006816" CHECK ("N_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_ORDER
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ORDER" ADD CONSTRAINT "SYS_C006812" PRIMARY KEY ("ORDER_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_ORDER
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ORDER" ADD CONSTRAINT "SYS_C006811" CHECK ("ORDER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_ORDER_ITEM
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ORDER_ITEM" ADD CONSTRAINT "SYS_C006814" PRIMARY KEY ("ORDER_ITEM_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_ORDER_ITEM
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ORDER_ITEM" ADD CONSTRAINT "SYS_C006813" CHECK ("ORDER_ITEM_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_PRODUCT
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_PRODUCT" ADD CONSTRAINT "PK_HW_SHOPPING_PRODUCT_PID" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_PRODUCT
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_PRODUCT" ADD CONSTRAINT "SYS_C006487" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_PRODUCT_TYPE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_PRODUCT_TYPE" ADD CONSTRAINT "SYS_C006535" PRIMARY KEY ("CID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_PRODUCT_TYPE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_PRODUCT_TYPE" ADD CONSTRAINT "SYS_C006534" CHECK ("CID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_SKU
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SKU" ADD CONSTRAINT "SYS_C006762" PRIMARY KEY ("SKU_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_SKU
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SKU" ADD CONSTRAINT "SYS_C006761" CHECK ("SKU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_SKU_IMAGE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SKU_IMAGE" ADD CONSTRAINT "SYS_C006758" PRIMARY KEY ("IMAGE_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_SKU_IMAGE
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SKU_IMAGE" ADD CONSTRAINT "SYS_C006757" CHECK ("IMAGE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_SPU
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SPU" ADD CONSTRAINT "SYS_C006760" PRIMARY KEY ("SPU_ID");

-- ----------------------------
-- Checks structure for table HW_SHOPPING_SPU
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_SPU" ADD CONSTRAINT "SYS_C006759" CHECK ("SPU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HW_SHOPPING_USER
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006426" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table HW_SHOPPING_USER
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "HW_USER_EMAIL_UNIQUE" UNIQUE ("EMAIL") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "HW_USER_PHONE_UNIQUE" UNIQUE ("MOBILE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006427" UNIQUE ("USER_NAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table HW_SHOPPING_USER
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006424" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006425" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006461" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006462" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006463" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006464" CHECK ("GENDER" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006465" CHECK ("IS_SYS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "XHL"."HW_SHOPPING_USER" ADD CONSTRAINT "SYS_C006468" CHECK ("MOBILE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table HW_SHOPPING_ADDRESS
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ADDRESS" ADD CONSTRAINT "FK_USER_ADDRESS_USERID" FOREIGN KEY ("USER_ID") REFERENCES "XHL"."HW_SHOPPING_USER" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table HW_SHOPPING_CART
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_CART" ADD CONSTRAINT "FK_USER_CART_USERID" FOREIGN KEY ("USER_ID") REFERENCES "XHL"."HW_SHOPPING_USER" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table HW_SHOPPING_ORDER_ITEM
-- ----------------------------
ALTER TABLE "XHL"."HW_SHOPPING_ORDER_ITEM" ADD CONSTRAINT "FK_ORDER_ORSER_ITEM_ORDERID" FOREIGN KEY ("ORDER_ID") REFERENCES "XHL"."HW_SHOPPING_ORDER" ("ORDER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
