drop database if exists mybookstore;
create database mybookstore;
use mybookstore;

drop table if exists categories;
create table categories(
	categoryid varchar(30) primary key,
    categoryname varchar(10),
    parentnodeid varchar(30),
    isparentflag int,
    level int,
    ancester varchar(50)
);
insert into categories(categoryid,categoryname,parentnodeid,isparentflag,level,ancester)
values('0','所有类别','',1,1,''),('A','孩子的书架','0',1,2,'0#'),('A01','原版童书','A',0,3,'0#A#'),('A02','启蒙益智','A',0,3,'0#A#'),('A03','儿童文学','A',0,3,'0#A#'),('A04','卡通动漫','A',0,3,'0#A#'),
('B','教材教辅','0',1,2,'0#'),('B01','考研','B',0,3,'0#B#'),('B02','大学教材','B',0,3,'0#B#'),('B03','中小学教辅','B',0,3,'0#B#'),('B04','资格考试','B',0,3,'0#B#'),
('C','杂志','0',1,2,'0#'),('C01','三联生活周刊','C',0,3,'0#C#'),('C02','中国国家地理','C',0,3,'0#C#'),('C03','博物','C',0,3,'0#C#'),('C04','知日','C',0,3,'0#C#'),('C05','读库','C',0,3,'0#C#'),
('D','艺术','0',1,2,'0#'),('D01','电影','D',0,3,'0#D#'),('D02','戏剧','D',0,3,'0#D#'),('D03','音乐','D',0,3,'0#D#'),('D04','建筑','D',0,3,'0#D#'),
('E','文学','0',1,2,'0#'),('E01','中国文学','E',0,3,'0#E#'),('E03','人物传记','E',0,3,'0#E#'),('E02','外国文学','E',0,3,'0#E#'),('E04','散文','E',0,3,'0#E#'),('E05','随笔','E',0,3,'0#E#'),
('F','认知世界','0',1,2,'0#'),('F01','政治','F',0,3,'0#F#'),('F02','经济','F',0,3,'0#F#'),('F03','历史','F',0,3,'0#F#'),
('G','生活指南','0',1,2,'0#'),('G01','美食','G',0,3,'0#G#'),('G02','宠物','G',0,3,'0#G#'),('G03','手工','G',0,3,'0#G#'),
('H','工作','0',1,2,'0#'),('H01','投资','H',0,3,'0#H#'),('H0２','法律','H',0,3,'0#H#'),('H0３','财务会计','H',0,3,'0#H#'),('H0４','企业管理','H',0,3,'0#H#'),
('1','馆藏类型','',1,1,''),('1-1','图书','1',0,2,'1#'),('1-2','期刊','1',0,2,'1#'),('1-3','专著','1',0,2,'1#'),('1-4','音像','1',0,2,'1#'),('1-5','光盘','1',0,2,'1#');



drop table if exists books;
create table books(
	bookid varchar(30) primary key,  #ISBN/ISSN
    rowid int,
    bookname varchar(50),
    inputcode varchar(50),  #输入码
    author varchar(20),
    collection varchar(20), #馆藏编号
    categoryid char(3),
    press varchar(50),   #出版社
    area varchar(20),
    publishdate varchar(20),    #出版日期
    number int,
    borrow int,
    leftover int     #剩余册数
);
insert into books(rowid,bookid,bookname,inputcode,categoryid,press,collection,publishdate,author,area,number,borrow,leftover)
values(1,9780689835605,'Where Is Babys Belly Button?','WIBBB','A01','Little Simon','1-1','2000-9','Karen Katz','美国',10,0,10),
(2,9780375827785,'I Am a Bunny','IAAB','A01','Golden Books','1-1','2004-1','Ole Risom','美国',8,0,8),
(3,9787550288539,'了不起的幼儿园','LBQDYEY','A01','北京联合出版公司 / 爱心树童书','1-1','2017-1-1',' [日]中川宏贵','日本',3,0,3),
(4,9787544241724,'古利和古拉','GLHGL','A02','南海出版公司','1-1','2008-07','中川李枝子/山胁百合子','日本',3,0,3),
(5,9787040329834,'高级计量经济学及Stata应用','GJJLJJXJYY','B02','高等教育出版社','1-1','2014-4-1','陈强','',10,0,10),
(6,9787300123196,'计量经济学导论','JLJJXDL','B02','中国人民大学出版社','1-1','2010-6-1','杰弗里·M·伍德里奇','上海',5,0,5),
(7,9787020098392,'刀背藏身','DBCS','E01','人民文学出版社','1-1','2013-7','徐皓峰','北京',10,0,10),
(8,9787533948054,'你是人间四月天','NSRJSYT','E01','浙江文艺出版社','1-1','2017-4','林徽因','浙江',10,0,10),
(9,9787510424106,'一个瑜伽行者的自传','YGYJXZDZZ','E03','新世界出版社·阳光博客','1-1','2012-2','[美] 帕拉宏撒•尤迦南达','美国',3,0,3),
(10,9787302184850,'流水别墅传','LSBSZ','E03','清华大学出版社','1-1','2009-1','富兰克林·托克','北京',3,0,3),
(11,9787500609049,'八十天环游地球','BSTHYDQ','E01','中国青年出版社','1-1','1958-02','[法] 儒勒·凡尔纳','北京',20,0,20),
(12,9787513342094,'星之继承者','XZJCZ','E02','新星出版社','1-1','2021-4','[英] 詹姆斯·P.霍根','英国',8,0,8),
(13,9787544244428,'恶意','EY','E02','南海出版公司','1-1','2009-6','[日本] 东野圭吾','日本',3,0,3),
(14,9787540471149,'清道夫','QDF','D01','湖南文艺出版社','1-1','2015-4','秦明','湖南',10,0,10),
(15,9787549555116,'政治秩序的起源','ZZZXDQY','F01','广西师范大学出版社','1-1','2014-09','弗朗西斯·福山','广西',3,0,3),
(16,10051805,'读者月刊','DZYK','C05','读者杂志社','1-2','2013-2014','富康年','兰州',18,0,18),
(17,10070060,'大众软件','DZRJ','C05','大众软件杂志社','1-2','2014-09','宋振峰','北京',3,0,3);
#select * from mybookstore.books;

drop table if exists press;
create table press(
	code varchar(30) primary key,
    name varchar(30),
    ISBN varchar(30),
    area varchar(30)
);
insert into press(code,name,ISBN,area)
values('LS','Little Simon','7-01','美国'),('GB','Golden Books','7-02','美国'),('BJLHCBGS','北京联合出版公司','7-101','北京'),
('NHCBGS','南海出版公司','7-102','海南'),('GDJYCBS','高等教育出版社','7-103','北京'),('ZGRMDXCBS','中国人民大学出版社','7-104','上海'),
('RMWXCBS','人民文学出版社','7-105','北京'),('ZJWYCBS','浙江文艺出版社','7-106','浙江'),
('XSJCBS','新世界出版社·阳光博客','7-03','美国'),('QHDXCBS','清华大学出版社','7-108','北京'),
('ZGQNCBS','中国青年出版社','7-109','北京'),('XXCBS','新星出版社','7-104','英国'),
('HNWYCBS','湖南文艺出版社','7-111','湖南'),('GXSFDXCBS','广西师范大学出版社','7-112','广西'),
('DZZZS','读者杂志社','7-21','兰州'),('DZRJZZS','大众软件杂志社','7-22','北京');

drop table if exists level;
create table level(
	level int primary key,
    title char(5),
    booknumber int,  #可借书数
    days int,   #可借天数
    longdays int #每次续借天数
);
insert into level(level,title,booknumber,days,longdays)
values(1,'普通读者',3,30,30),(2,'高级读者',5,60,60),(3,'特殊读者',10,120,120),(4,'admin',20,150,150);


drop table if exists readers;
create table readers(
	account varchar(20) primary key,
    password int,
    name char(10),
    level int,
    gender char(1),
    phone varchar(50),
    address varchar(255),
    idnumber varchar(18),
    answer varchar(50),
    signdate date
    
);
insert into readers(account,name,password,level,gender,phone,address,idnumber,answer,signdate)
values('LHX0901','林涵煦','123456','1','男','','','','','2021-09-01'),
('LHY0901','李宏毅','123456','1','男','','','','','2021-09-01'),
('WKZ0902','王凯泽','123456','2','男','','','','','2021-09-02'),
('CRH0902','陈瑞涵','123456','2','男','','','','','2021-09-02'),
('ZHM0903','周慧敏','123456','3','女','','','','','2021-09-03'),
('GXH0903','高小红','123456','3','女','','','','','2021-09-03'),
('S-L0904','孙玲','123456','1','女','','','','','2021-09-04'),
('admin','admin','1234567','4','女','','','','东方红','2021-01-01');


drop table if exists conditions;  #图书借出状态，是否借出
create table conditions(
	code int primary key auto_increment,  #书刊条码，每本书都有一个，相同名字的不同书的条码不同
    conditions int,   #1是可借，0是不可借（已外借）
    bookid varchar(30),
    signdate date,   #登记日期
    operator varchar(20) #操作员
);    
alter table conditions AUTO_INCREMENT=10001;

drop procedure if exists x_conditions;
delimiter $$
create procedure x_conditions()
begin
	declare $i int;
    declare $j int;
    declare $bookid varchar(50);
    select count(*) into @n from books;
    set $i=1;
    while($i<=@n) do
    select number into @x from books where rowid=$i;
    set $j=1;
    while($j<=@x) do
    select bookid into $bookid from books where rowid=$i;
    insert into conditions(conditions,bookid,signdate,operator)values(1,$bookid,'2022-1-8','admin');
    set $j=$j+1;
    end while;
    set $i=$i+1;
    end while;
end $$
delimiter ;
call x_conditions();
#select * from mybookstore.conditions;

drop table if exists borrow;  #借阅记录查询
create table borrow(
	borrowid int primary key auto_increment,
    borrowdate date,
    requireddate date,
    code varchar(30),
    account varchar(20),
    isreturn int,#是否归还1为已还，0为未还
    exceeddays int,  #逾期
    returndate date,
    boperator varchar(30),#谁借的
    roperator varchar(30)  #谁还的，可以其他人代还，只要也是这个图书馆的读者，借书人和还书人可以不一样。
);
