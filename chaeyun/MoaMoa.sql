--------------------------------------------------------
--  파일이 생성됨 - 목요일-6월-23-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEALKIT
--------------------------------------------------------

  CREATE TABLE "MEALKIT" 
   (	"MEALKIT_NUM" VARCHAR2(20 BYTE), 
	"POST_CODE" VARCHAR2(20 BYTE), 
	"MEALKIT_TITLE" VARCHAR2(1000 BYTE), 
	"MEALKIT_COUNT" NUMBER, 
	"MEALKIT_PRICE" NUMBER, 
	"MEALKIT_CONTENT" VARCHAR2(1000 BYTE), 
	"MEALKIT_SELL_PERIOD" DATE, 
	"MAIN_INGREDIENT" VARCHAR2(50 BYTE), 
	"ADDITION_INGREDIENT" VARCHAR2(50 BYTE), 
	"VIEW_COUNT" NUMBER(*,0), 
	"MEALKIT_SORT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEALKIT_REL_CON
--------------------------------------------------------

  CREATE TABLE "MEALKIT_REL_CON" 
   (	"CONTRACT_CODE" VARCHAR2(1000 BYTE), 
	"ID" VARCHAR2(20 BYTE), 
	"MEALKIT_TITLE" VARCHAR2(1000 BYTE), 
	"CONTRACT_DAY" DATE, 
	"CONTRACT_FACTS" VARCHAR2(1000 BYTE), 
	"MILKIT_REGISTRATION_AMOUNT" NUMBER, 
	"CONTRACT_AMOUNT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"PWD" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"PHONE_NUM" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"PROFILE" VARCHAR2(1000 BYTE), 
	"NICNAME" VARCHAR2(20 BYTE), 
	"GENDER" CHAR(1 BYTE), 
	"BIRTHDAY" VARCHAR2(20 BYTE), 
	"MEMBER_SORT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MILKITO_POST
--------------------------------------------------------

  CREATE TABLE "MILKITO_POST" 
   (	"POST_CODE" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(20 BYTE), 
	"POST_LINK_CODE" VARCHAR2(20 BYTE), 
	"SMALL_CODE" VARCHAR2(20 BYTE), 
	"POST_TITLE" VARCHAR2(1000 BYTE), 
	"POST_WRITE_DATE" DATE, 
	"POST_CONTENT" VARCHAR2(1000 BYTE), 
	"POST_COMMENT_CUT" NUMBER, 
	"POST_LIKE_COUNT" NUMBER, 
	"POST_VIEW_COUNT" NUMBER, 
	"KIT_PRODUCTION_MARK" CHAR(1 BYTE), 
	"POST_IMG" BLOB, 
	"POST_HASHTAG" VARCHAR2(30 BYTE), 
	"POST_INGREDIENT" VARCHAR2(1000 BYTE), 
	"MEMBER_SORT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("POST_IMG") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ORDER_INFORM
--------------------------------------------------------

  CREATE TABLE "ORDER_INFORM" 
   (	"ORDER_CODE" VARCHAR2(20 BYTE), 
	"CART_CODE" VARCHAR2(20 BYTE), 
	"ORDER_DATE" DATE, 
	"DELIVERY_LOCATION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ORDER_LIST
--------------------------------------------------------

  CREATE TABLE "ORDER_LIST" 
   (	"ORDER_LISTNUM" VARCHAR2(20 BYTE), 
	"ORDER_CODE" VARCHAR2(20 BYTE), 
	"MEALKIT_TITLE" VARCHAR2(50 BYTE), 
	"MEALKIT_COUNT" NUMBER, 
	"MEALKIT_PRICE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST_COMMENT
--------------------------------------------------------

  CREATE TABLE "POST_COMMENT" 
   (	"POST_COMMENT" VARCHAR2(20 BYTE), 
	"POST_TITLE" VARCHAR2(1000 BYTE), 
	"POST_COMMENT_WRITER" VARCHAR2(20 BYTE), 
	"POST_COMMENT_WIRTE_DATE" DATE, 
	"POST_COMMENT_CONTENT" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SHOPPING_CART
--------------------------------------------------------

  CREATE TABLE "SHOPPING_CART" 
   (	"CART_CODE" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(20 BYTE), 
	"MEALKIT_NUM" VARCHAR2(20 BYTE), 
	"MEALKIT_TITLE" VARCHAR2(1000 BYTE), 
	"MEALKIT_COUNT" NUMBER, 
	"MEALKIT_PRICE" NUMBER, 
	"MEM_SORT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into MEALKIT
SET DEFINE OFF;
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','baguette',10,10000,'Put salt and yeast in 250g of flour and mix well
Add lukewarm water (140g) and knead until the gluten reaches about 80%
Spray the dough in a bowl, cover it with plastic, and ferment it for 1 hour in a warm place
Remove the gas, cut it into two equal parts, cover it with plastic wrap, and let it ferment at room temperature for 20 minutes
After mid-fermentation, press the dough with your palm to remove the gas, push it flat in an oval shape, and fold it up and down
Put it back together, pinch it and seal it
Push it with your palms
Put the sealed part on the mini baguette frame down, ferment it for about an hour in a warm place, make a diagonal cut, and spray water with a sprayer.
Bake in preheated 200 degree oven for 15 to 20 minutes until golden.',to_date('22/06/17','RR/MM/DD'),'flour','test',0,'western_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('2','2','bulgogi',12,12000,'Add the blood drained beef and make the sauce. 
Put the prepared seasoning into the meat and mix it. 
Mix all the cut vegetables into the meat.',to_date('22/06/24','RR/MM/DD'),'soup','testadd',0,'korean_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','spaghetti',20,14000,'make spaghetti
Prepare 250g of spaghetti noodles.
Boil the noodles for about 8 minutes, and remove only the water by sieving the pasta after 8 minutes without rinsing it in cold water.
Cut broccoli, cherry tomatoes, whole garlic, mushrooms, ham, bacon, onions, etc. into bite-size pieces and cook them.
Complete the spaghetti.',to_date('22/06/21','RR/MM/DD'),'tomato','None',0,'western_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','Ogoakbap',2,8000,'Prepare the grains.
After washing the red beans clean, add 400ml of water and boil it over medium low heat for 10 minutes.
While boiling the red beans, put the rest of the grains at once and wash them clean.
Put the boiled red beans and water separately, add salt to the water, and dissolve it well.
Put drained grains and boiled red beans in a pot and put 3 cups (paper cups) with the red bean water that was stored separately. You can cook it for 45 minutes after sitting in the rice cooker.
Like this, the delicious five-grain rice has been completed.',to_date('22/06/22','RR/MM/DD'),'rice, beans','None',0,'korean_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','pasta',23,15000,'Please prepare 250g of spaghetti noodles.
First, put 1/2 teaspoon salt and 1 teaspoon olive oil in boiling water and boil spaghetti noodles for about 8 minutes
If the spaghetti is 8 minutes old, don''t rinse it in cold water, sift it out and remove the water.
Prepare cherry tomatoes, whole garlic, mushrooms, ham, bacon, and onions in bite-sized pieces.
In a large pan, add 1 tablespoon olive oil and stir-fry garlic and onion until onion is transparent.
When the onion becomes transparent, add bacon and ham and stir-fry.
If bacon feels like it''s shrinking, add commercial sauce, tomatoes, mushrooms, and broccoli and mix.
If you put the boiled spaghetti noodles in here and mix them well
Tomato spaghetti is done!',to_date('22/06/21','RR/MM/DD'),'tomato','None',0,'western_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','pizza',321,13000,'Put all ingredients except olive oil in a mixing bowl.
Add olive oil and knead at medium speed (second tier) to 1 minute -> high speed (3-4 tier) until final step.
Cover the dough with vinyl and ferment it first for 40 minutes to 1 hour in a warm and humid place.
After the first fermentation, hold the dough with both hands and make a circle.
Cover with plastic again and ferment at room temperature for 15 minutes.
Roll the pizza dough thinly using a rolling pin.
Carefully transfer the dough to the pizza pan and use a fork to make a random hole in the front of the bottom.
Make a hole by randomly poking lightly.
Place pizza topping on top of dough.
Bake in a 180 degree preheated oven for about 20 minutes.',to_date('22/06/21','RR/MM/DD'),'tomato','None',0,'western_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','카레',3,8000,'이 밀키트를 통해 카레를 간편하게 만들어서 먹을 수 있습니다.',to_date('22/06/23','RR/MM/DD'),'밥, 야채, 소스, 카레가루','None',0,'etc');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','라멘',100,7000,'생강은 다져둔다.	
대파는 채썰어서 찬물에 담가두고, 쪽파일 경우 쫑쫑 썰어서 준비해준다.	
숙주는 씻어서 물기를 빼놓는다.	
계란은 반으로 잘라 놓는다.	
팬에 오일을 살짝만 두르고 돼지고기 간 것과 생강을 주걱으로 갈라가며 고슬고슬하게 볶는다.	
너무 바특하게 조리지 말고 어느정도 촉촉할 때 불에서 내려야 고기가 마르지 않는다.
냄비에 참기름을 두르고 마늘·생강을 넣고 볶는다.	
잘 볶아지면 물 400ml, 치킨 부이용 1t, 미소 1T도 잘 풀어넣는다.	
라멘을 담아낼 그릇에 미리 깨를 갈아놓는다.	
면은 패키지에 3분 삶으라고 했는데 2분만 삶았다.	
면은 물기를 털고 그릇에 국물을 넣어준 뒤 면을 넣어준다.	
숙주와 옥수수, 대파, 계란 토핑해준다.	
고기도 올려주고, 숙주는 추가해가면서 먹는다.',to_date('22/06/23','RR/MM/DD'),'면, 스프','None',0,'japanese_food');
Insert into MEALKIT (MEALKIT_NUM,POST_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEALKIT_CONTENT,MEALKIT_SELL_PERIOD,MAIN_INGREDIENT,ADDITION_INGREDIENT,VIEW_COUNT,MEALKIT_SORT) values ('1','1','순두부찌개',50,10000,'대파와 청양고추는 쫑쫑, 양파와 마늘은 다지고 버섯 등은 잘게 찢어놓는다.	
달궈진 냄비에 기름을 두르고 대파와 돼지고기 다짐육을 볶다가	
다진양파와 다진마늘을 넣고 볶아준다.	
여기에 고추가루 1스푼 반과	
설탕과 소금을 조금 넣고,	
간장 한스푼,	
참기름 한스푼을 넣고	
달달 볶아준다.	
여기에 물 약 200ml 를 넣고 물이 끓으면 순두부를 뚝뚝 잘라 넣는다.	
자글자글 끓으면 나머지 야채를 넣고	
마지막에 계란 하나를 톡 까서 넣고 자글자글 끓이면 백종원 순두부찌개 완성~~~',to_date('22/06/23','RR/MM/DD'),'돼지고기, 순두부, 고춧가루','None',0,'korean_food');
REM INSERTING into MEALKIT_REL_CON
SET DEFINE OFF;
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('test','test','test',to_date('22/06/16','RR/MM/DD'),'test',10000,100000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('testti1','id','testttestt22',to_date('22/06/21','RR/MM/DD'),'testtetes',10000,200000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('testti2','id','mealkit',to_date('22/06/21','RR/MM/DD'),'¾ø?½',12000,100000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('testti2','id','testtesttest',to_date('22/06/21','RR/MM/DD'),'tse',14000,140000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('Ogokbap','id','Ogoakbap',to_date('22/06/22','RR/MM/DD'),'¹Ð?°Æ®¸? °?¾???´?´?.',8000,100000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('카레','id','카레',to_date('22/06/23','RR/MM/DD'),'본 계약은 2년 후 만료됩니다.',8000,500000);
Insert into MEALKIT_REL_CON (CONTRACT_CODE,ID,MEALKIT_TITLE,CONTRACT_DAY,CONTRACT_FACTS,MILKIT_REGISTRATION_AMOUNT,CONTRACT_AMOUNT) values ('참치김치볶음밥 만들기','id','ㅁㄹㄻㄴㄹ',to_date('22/06/23','RR/MM/DD'),'ㅁㄹㄻㄹㄴ',121213,123312);
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (ID,PWD,NAME,PHONE_NUM,EMAIL,PROFILE,NICNAME,GENDER,BIRTHDAY,MEMBER_SORT) values ('id123','pwd123','testname',null,null,null,null,null,null,null);
Insert into MEMBER (ID,PWD,NAME,PHONE_NUM,EMAIL,PROFILE,NICNAME,GENDER,BIRTHDAY,MEMBER_SORT) values ('test','test','test',null,null,null,null,null,null,null);
Insert into MEMBER (ID,PWD,NAME,PHONE_NUM,EMAIL,PROFILE,NICNAME,GENDER,BIRTHDAY,MEMBER_SORT) values ('bu','bu','?¶??²????','010-1234-5678','null@null',null,null,null,null,null);
Insert into MEMBER (ID,PWD,NAME,PHONE_NUM,EMAIL,PROFILE,NICNAME,GENDER,BIRTHDAY,MEMBER_SORT) values ('bu','bu','?¶??²????','010-1234-5678','null@null',null,null,null,null,null);
Insert into MEMBER (ID,PWD,NAME,PHONE_NUM,EMAIL,PROFILE,NICNAME,GENDER,BIRTHDAY,MEMBER_SORT) values ('최지연','chlwldus','최지연','010-1234-5678','null@null',null,null,null,null,null);
REM INSERTING into MILKITO_POST
SET DEFINE OFF;
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values ('1','abc','12','western_food','gimbap',to_date('22/04/15','RR/MM/DD'),'make kimbap
The fillings are cucumber, carrot, burdock, fish cake, two ham, egg garnish, pickled radish, etc.
Put it on top of the seaweed in the order above.
After making it, put some sesame oil on the kimbap. Put some sesame oil on the knife and cut it like you''re sawing it. It''s done!',1,2,3,null,'#','rice',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'western_food','spaghetti',to_date('22/06/22','RR/MM/DD'),'make spaghetti
Prepare 250g of spaghetti noodles.
Boil the noodles for about 8 minutes, and remove only the water by sieving the pasta after 8 minutes without rinsing it in cold water.
Cut broccoli, cherry tomatoes, whole garlic, mushrooms, ham, bacon, onions, etc. into bite-size pieces and cook them.
Complete the spaghetti.',null,null,null,null,null,'noodle, vegetable',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'korean_food','Ogokbap',to_date('22/06/22','RR/MM/DD'),'cook rice with rice and beans
Put drained grains and boiled red beans in a pot and put 3 cups (paper cups) with the red bean water that was stored separately. At this time, you can add water as much as you need more red bean water.
Cook for 45 minutes after sitting in an electric pressure rice cooker to complete the five-grain rice!',null,null,null,null,null,'rice, bean',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values ('2','def','11','chinese_food','eggroll',to_date('22/05/01','RR/MM/DD'),'Making egg rolls!
Mix 4 eggs and 50cc of water well.
Cut the green onion into small pieces, put a little oil first, stir-fry it, and make green onion oil.
Add egg mixture to 1/3 or 1/4 if green onion flavored.
Roll the eggs.
The egg roll is complete!',1,2,1,null,'##','egg',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values ('3','ghi','10','korean_food','bibimbap',to_date('22/05/16','RR/MM/DD'),'mix rice with bibimbap
Prepare onions, carrots, and zucchini by shredding them.
Prepare the sauce for the bibimbap.
First, add a pinch of salt to the carrot and zucchini and stir-fry them in a colorful way.
Add 1T of soy sauce and stir-fry onion over medium heat.
Stir-fry sliced pork seasoned with salt and pepper.
Stir-fry the pork with the sauce.
Put the stir-fried vegetables on the warm rice and set it up with a large 1T scoop of half-boiled egg and sauce.',1,1,2,null,'###','rice, egg',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'dessert','salad',to_date('22/06/22','RR/MM/DD'),'Making a salad
Wash the lettuce in running water and rip it off with your hands.
Wash young leaf vegetables in running water.
Slice onions and carrots thinly.
Cut cherry tomatoes in half.
Soak the prepared vegetables in ice water.
If you soak the trimmed vegetables in ice water and cook them just before you eat them, you can enjoy a crispier taste.
Add 2 spoons of dark soy sauce, 2 spoons of apple vinegar, 2 spoons of lemon juice, 1 spoon of chopped onion, 2 spoons of olive oil, etc. and mix them evenly to make a lettuce salad sauce.',null,null,null,null,null,'vegetable',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'etc','카레',to_date('22/06/23','RR/MM/DD'),'물이 보글보글 끓기 시작하면 우유와 새송이버섯을 넣고 카레가루를 넣어줍니다.
가루가 뭉치지 않게 조금씩 넣어서 충분히 풀면서 끓여준뒤 마지막에 후추톡톡 3번해주면 카레 완성이예요.	
그릇에 밥한공기 퍼서 담고, 옆에 예쁘게 카레를 담아내면~	
한그릇 레시피인 카레만들기 완성입니다!!!',null,null,null,null,null,'밥, 야채, 소스, 카레가루',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'korean_food','참치김치볶음밥 만들기',to_date('22/06/23','RR/MM/DD'),'프라이펜 위에 김치를 볶는다.
볶고 난 후 참치와 밥을 넣고 계속 볶는다.
완성',null,null,null,null,null,'참치캔, 김치, 밥',null);
Insert into MILKITO_POST (POST_CODE,ID,POST_LINK_CODE,SMALL_CODE,POST_TITLE,POST_WRITE_DATE,POST_CONTENT,POST_COMMENT_CUT,POST_LIKE_COUNT,POST_VIEW_COUNT,KIT_PRODUCTION_MARK,POST_HASHTAG,POST_INGREDIENT,MEMBER_SORT) values (null,null,null,'korean_food','돼지고기 김치찌개 만들기',to_date('22/06/23','RR/MM/DD'),'돼지고기는 핏물을 빼주세요	
잘익은 김치 한포기를 꺼내서 잘라주세요
친정엄마표 김치라 너무 맛있답니다	
냄비에 들기름 적당히 두르고	
김치를 넣고 볶아주세요	
다진마늘 한스푼, 설탕 한스푼 넣어주세요	
종이컵으로 물 8컵 부어서 센불에 끓여주세요
원래는 쌀뜬물을 넣어야되는데 없어서 패스했습니다ㅎㅎ	
핏물 뺀 돼지고기를 넣어주세요
백종원 김치찌개에는 된장이 들어가요
고기잡내 제거에 딱이라고 합니다^^
된장 반스푼 넣어주세요	
양파 반개, 청양고추 한개를 썰어서 넣어주세요	
간장 두스푼반	
새우젓 두스푼	
고춧가루 두스푼반 넣어주세요	
돼지고기 김치찌개는 오래 끓여야 더 맛있습니다
중불로 줄여서 오래 끓여주세요~!!	
마지막에 파 쏭쏭 썰어서 마무리하면 돼요^^',null,null,null,null,null,'돼지고기, 김치찌개',null);
REM INSERTING into ORDER_INFORM
SET DEFINE OFF;
Insert into ORDER_INFORM (ORDER_CODE,CART_CODE,ORDER_DATE,DELIVERY_LOCATION) values ('test','test',to_date('22/06/17','RR/MM/DD'),'testtest');
REM INSERTING into ORDER_LIST
SET DEFINE OFF;
Insert into ORDER_LIST (ORDER_LISTNUM,ORDER_CODE,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE) values ('test','test','test',1,10000);
REM INSERTING into POST_COMMENT
SET DEFINE OFF;
Insert into POST_COMMENT (POST_COMMENT,POST_TITLE,POST_COMMENT_WRITER,POST_COMMENT_WIRTE_DATE,POST_COMMENT_CONTENT) values ('1','참치김치볶음밥 만들기','김치 좋아',to_date('22/06/23','RR/MM/DD'),'정말 맛있어 보이네요!');
Insert into POST_COMMENT (POST_COMMENT,POST_TITLE,POST_COMMENT_WRITER,POST_COMMENT_WIRTE_DATE,POST_COMMENT_CONTENT) values ('1','카레','부천대',to_date('22/06/23','RR/MM/DD'),'레시피를 이용해 요리를 해볼게요!');
REM INSERTING into SHOPPING_CART
SET DEFINE OFF;
Insert into SHOPPING_CART (CART_CODE,ID,MEALKIT_NUM,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEM_SORT) values ('bu','bu','1','카레',1,8000,'개인');
Insert into SHOPPING_CART (CART_CODE,ID,MEALKIT_NUM,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEM_SORT) values ('test','test','1','spaghetti',1,14000,'개인');
Insert into SHOPPING_CART (CART_CODE,ID,MEALKIT_NUM,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEM_SORT) values ('tetst','testtst','testste','tsetstst',2,3,'testt');
Insert into SHOPPING_CART (CART_CODE,ID,MEALKIT_NUM,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEM_SORT) values ('test','test','1','spaghetti',1,14000,'개인');
Insert into SHOPPING_CART (CART_CODE,ID,MEALKIT_NUM,MEALKIT_TITLE,MEALKIT_COUNT,MEALKIT_PRICE,MEM_SORT) values ('bu','bu','1','pasta',1,15000,'개인');
--------------------------------------------------------
--  Constraints for Table MEALKIT
--------------------------------------------------------

  ALTER TABLE "MEALKIT" MODIFY ("MEALKIT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SHOPPING_CART
--------------------------------------------------------

  ALTER TABLE "SHOPPING_CART" MODIFY ("CART_CODE" NOT NULL ENABLE);
