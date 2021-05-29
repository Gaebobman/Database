INSERT INTO AUTHOR values('000001', '칼 세이건');
INSERT INTO AUTHOR values('000002', '스티븐 호킹');
INSERT INTO AUTHOR values('000003', '플라톤');
INSERT INTO AUTHOR values('000004', '간디');
INSERT INTO AUTHOR values('000005', '헤밍웨이');
INSERT INTO AUTHOR values('000006', '조세희');
INSERT INTO AUTHOR values('000007', '일론 머스크');
INSERT INTO AUTHOR values('000008', '리처드 도킨스');
INSERT INTO AUTHOR values('000009', '이광수');
INSERT INTO AUTHOR values('000010', '프란츠 카프카');

INSERT INTO THEME values('0100', '철학');
INSERT INTO THEME values('0200', '종교');
INSERT INTO THEME values('0300', '사회과학');
INSERT INTO THEME values('0400', '자연과학');
INSERT INTO THEME values('0500', '기술과학');
INSERT INTO THEME values('0600', '예술');
INSERT INTO THEME values('0700', '언어');

INSERT INTO PUBLISHER values('00000001','금성출판사', '서울특별시 강서구 가동', '0212345678');
INSERT INTO PUBLISHER values('00000002','다산북스', '서울특별시 강남구 나동', '0265473285');
INSERT INTO PUBLISHER values('00000003','문학동네', '서울특별시 강동구 다동', '0288754432');
INSERT INTO PUBLISHER values('00000004','북플라자', '부산광역시 강서구 라동', '0212585687');
INSERT INTO PUBLISHER values('00000005','산하', '인천광역시 미추홀구 마동', '0287216354');
INSERT INTO PUBLISHER values('00000006','시공주니어', '서울특별시 금천구 바동', '0298426572');
INSERT INTO PUBLISHER values('00000007','알라딘북스', '서울특별시 은평구 사동', '0233354123');
INSERT INTO PUBLISHER values('00000008','지학사', '서울특별시 동작구 아동', '0254873517');
INSERT INTO PUBLISHER values('00000009','학산문화사', '서울시 영등포구 자동', '0278624517');
INSERT INTO PUBLISHER values('00000010','한솔교육', '서울시 마포구 차동', '0263694522');

-- 서적 20권, 2인 공저 5건, 3인 공저 3건,
-- 이하 주석처리된 문장은 변경전 오류있는 내용입니다
--                      ISBN               저자_ID 출판사_id  theme_ID title                       pages price    공저자         
-- INSERT INTO BOOK values('9780857501004', '000001', '00000001','0300', '(짧고 쉽게 쓴) 시간의 역사', '200','23000', '2', to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780857501004', '000002', '00000001','0300', '(짧고 쉽게 쓴) 시간의 역사', '200','23000', '2', to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780345331359', '000003', '00000002','0400','코스모스', '320','17500', '2', to_date('01-05-2019 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780345331359', '000004', '00000002','0400','코스모스', '320','17500', '2', to_date('01-05-2019 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780141442433', '000005', '00000003','0100','국가', '525','35700', '2', to_date('11-11-2020 14:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780141442433', '000006', '00000003','0100','국가', '525','35700', '2', to_date('11-11-2020 14:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788990809032', '000007','00000004','0400','살아있는 생명체로서의 지구' ,'206', '21500','2', to_date('01-06-2008 06:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788990809032', '000008','00000004','0400','살아있는 생명체로서의 지구' ,'206', '21500','2', to_date('01-06-2008 06:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788965700036', '000009','00000005','0700', '아프니까 청춘이다' ,'289', '26000','2', to_date('12-25-2007 18:01:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788965700036', '000010','00000005','0700', '아프니까 청춘이다' ,'289', '26000','2', to_date('12-25-2007 18:01:11','mm-dd-yyyy hh24:mi:ss'));
-- -- 3인공저              ISBN              저자_ID   출판사_id  theme_ID title          pages  price  공저자     날짜
-- INSERT INTO BOOK values('9788932471990', '000005','00000006','0700', '플라스틱 사회' ,'152', '15700','3', to_date('11-29-2020 18:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788932471990', '000006','00000006','0700', '플라스틱 사회' ,'152', '15700','3', to_date('11-29-2020 18:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788932471990', '000010','00000006','0700', '플라스틱 사회' ,'152', '15700','3', to_date('11-29-2020 18:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780006154174', '000001','00000007','0200', '3막의 비극' ,'342', '19100','3', to_date('05-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780006154174', '000002','00000007','0200', '3막의 비극' ,'342', '19100','3', to_date('05-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780006154174', '000007','00000007','0200', '3막의 비극' ,'342', '19100','3', to_date('05-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788952211484', '000003','00000008','0200', '한국 수학사' ,'113', '11500','3', to_date('08-13-2015 12:14:50','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788952211484', '000009','00000008','0200', '한국 수학사' ,'113', '11500','3', to_date('08-13-2015 12:14:50','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788952211484', '000010','00000008','0200', '한국 수학사' ,'113', '11500','3', to_date('08-13-2015 12:14:50','mm-dd-yyyy hh24:mi:ss'));
-- -- 이 후 12건 추가하면 됨
-- INSERT INTO BOOK values('9781975333867', '000003','00000010','0500', '나미야 잡화점의 기적' ,'226', '14500','1', to_date('10-05-2018 12:14:44','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9791162241196', '000007','00000001','0500', '안드로이드 생존코딩' ,'218', '15500','1', to_date('07-10-2014 12:14:13','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788970065311', '000008','00000002','0500', '디자인 기획론' ,'198', '30200','1', to_date('05-01-2005 10:15:16','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9791156200130', '000001','00000003','0100', '수학의 정석' ,'148', '10200','1', to_date('06-19-2008 12:14:48','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9780140400120', '000002','00000004','0200', '국부론' ,'588', '19200','1', to_date('12-08-2013 18:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788979301458', '000009','00000005','0300', '다이나믹 인체 드로잉' ,'452', '14400','1', to_date('06-19-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788972915546', '000010','00000006','0400', '과학혁명의 구조' ,'312', '14600','1', to_date('03-18-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788972914440', '000003','00000007','0500', '군주론' ,'218', '16500','1', to_date('08-19-2019 15:20:05','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788934926184', '000005','00000009','0700', '만들어진 신' ,'159', '16400','1', to_date('09-09-2019 15:20:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788934972464', '000009','00000010','0100', '사피엔스' ,'178', '20000','1', to_date('10-12-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- INSERT INTO BOOK values('9788983711243', '000006','00000005','0600', '도덕적 동물' ,'154', '20800','1', to_date('11-19-2017 12:14:11','mm-dd-yyyy hh24:mi:ss'));
-- 2인공저              ISBN              출판사_id  theme_ID title                       pages price    공저자         
INSERT INTO BOOK values('9780857501004', '00000001','0300', '(짧고 쉽게 쓴) 시간의 역사', '200','23000', '2', to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9780345331359', '00000002','0400','코스모스', '320','17500', '2', to_date('01-05-2019 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9780141442433', '00000003','0100','국가', '525','35700', '2', to_date('11-11-2020 14:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788990809032', '00000004','0400','살아있는 생명체로서의 지구' ,'206', '21500','2', to_date('01-06-2008 06:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788965700036', '00000005','0700', '아프니까 청춘이다' ,'289', '26000','2', to_date('12-25-2007 18:01:11','mm-dd-yyyy hh24:mi:ss'));
-- 3인공저              ISBN              저자_ID   출판사_id  theme_ID title          pages  price  공저자     날짜
INSERT INTO BOOK values('9788932471990', '00000006','0700', '플라스틱 사회' ,'152', '15700','3', to_date('11-29-2020 18:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9780006154174', '00000007','0200', '3막의 비극' ,'342', '19100','3', to_date('05-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788952211484', '00000008','0200', '한국 수학사' ,'113', '11500','3', to_date('08-13-2015 12:14:50','mm-dd-yyyy hh24:mi:ss'));
-- 1인저술 12건 
INSERT INTO BOOK values('9781975333867', '00000010','0500', '나미야 잡화점의 기적' ,'226', '14500','1', to_date('10-05-2018 12:14:44','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9791162241196', '00000001','0500', '안드로이드 생존코딩' ,'218', '15500','1', to_date('07-10-2014 12:14:13','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788970065311', '00000002','0500', '디자인 기획론' ,'198', '30200','1', to_date('05-01-2005 10:15:16','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9791156200130', '00000003','0100', '수학의 정석' ,'148', '10200','1', to_date('06-19-2008 12:14:48','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9780140400120', '00000004','0200', '국부론' ,'588', '19200','1', to_date('12-08-2013 18:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788979301458', '00000005','0300', '다이나믹 인체 드로잉' ,'452', '14400','1', to_date('06-19-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788972915546', '00000006','0400', '과학혁명의 구조' ,'312', '14600','1', to_date('03-18-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788972914440', '00000007','0500', '군주론' ,'218', '16500','1', to_date('08-19-2019 15:20:05','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788901082059', '00000008','0600', '동물농장' ,'357', '18420','1', to_date('04-10-2017 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788934926184', '00000009','0700', '만들어진 신' ,'159', '16400','1', to_date('09-09-2019 15:20:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788934972464', '00000010','0100', '사피엔스' ,'178', '20000','1', to_date('10-12-2013 12:14:11','mm-dd-yyyy hh24:mi:ss'));
INSERT INTO BOOK values('9788983711243', '00000005','0600', '도덕적 동물' ,'154', '20800','1', to_date('11-19-2017 12:14:11','mm-dd-yyyy hh24:mi:ss'));

-- 저자가 쓴 책 
--2인공저
INSERT INTO WRITES values('000001', '9780857501004');
INSERT INTO WRITES values('000002', '9780857501004');
INSERT INTO WRITES values('000003', '9780345331359');
INSERT INTO WRITES values('000004', '9780345331359');
INSERT INTO WRITES values('000005', '9780141442433');
INSERT INTO WRITES values('000006', '9780141442433');
INSERT INTO WRITES values('000007', '9788990809032');
INSERT INTO WRITES values('000008', '9788990809032');
INSERT INTO WRITES values('000009', '9788965700036');
INSERT INTO WRITES values('000010', '9788965700036');
--3인공저
INSERT INTO WRITES values('000005', '9788932471990');
INSERT INTO WRITES values('000006', '9788932471990');
INSERT INTO WRITES values('000010', '9788932471990');
--
INSERT INTO WRITES values('000001', '9780006154174');
INSERT INTO WRITES values('000002', '9780006154174');
INSERT INTO WRITES values('000007', '9780006154174');
--
INSERT INTO WRITES values('000003', '9788952211484');
INSERT INTO WRITES values('000009', '9788952211484');
INSERT INTO WRITES values('000010', '9788952211484');
--
INSERT INTO WRITES values('000003', '9781975333867');
INSERT INTO WRITES values('000007', '9791162241196');
INSERT INTO WRITES values('000008', '9788970065311');
INSERT INTO WRITES values('000001', '9791156200130');
INSERT INTO WRITES values('000002', '9780140400120');
INSERT INTO WRITES values('000009', '9788979301458');
INSERT INTO WRITES values('000010', '9788972915546');
INSERT INTO WRITES values('000003', '9788972914440');
INSERT INTO WRITES values('000004', '9788901082059');
INSERT INTO WRITES values('000005', '9788934926184');
INSERT INTO WRITES values('000009', '9788934972464');
INSERT INTO WRITES values('000006', '9788983711243');