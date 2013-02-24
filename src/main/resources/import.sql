insert into shipping (shipping_id, name, description) values (1, 'Самовывоз', '');
insert into shipping (shipping_id, name, description) values (2, 'Доставка по Москве', '');
insert into shipping (shipping_id, name, description) values (3, 'Почта EMS', '');
insert into shipping (shipping_id, name, description) values (4, 'Почта России', '');
insert into shipping (shipping_id, name, description) values (5, 'Транспортная компания "ПЭК" или "Энергия"', '');

insert into payment (payment_id, name, description) values (1, 'За наличный расчет', 'Без комиссии');
insert into payment (payment_id, name, description) values (2, 'Наложенным платежом', 'Описание тарифов на http://www.emspost.ru/platej.php');
insert into payment (payment_id, name, description) values (3, 'Переводом "БЛИЦ" через Сбербанк РФ', 'Комиссия 1.75%');
insert into payment (payment_id, name, description) values (4, 'Переводом на платежную карточку Maestro MOMENTUM', 'Комиссия 0.75%');
insert into payment (payment_id, name, description) values (5, 'Банковским переводом', 'Комиссия 6% + 750 руб.');
insert into payment (payment_id, name, description) values (6, 'Доставка по Москве', 'Стоимость 350 руб.');

insert into shipping_payment(shipping_id, payment_id) values(1,1);
insert into shipping_payment(shipping_id, payment_id) values(2,1);
insert into shipping_payment(shipping_id, payment_id) values(3,2);
insert into shipping_payment(shipping_id, payment_id) values(3,3);
insert into shipping_payment(shipping_id, payment_id) values(3,4);
insert into shipping_payment(shipping_id, payment_id) values(3,5);
insert into shipping_payment(shipping_id, payment_id) values(4,2);
insert into shipping_payment(shipping_id, payment_id) values(4,3);
insert into shipping_payment(shipping_id, payment_id) values(4,4);
insert into shipping_payment(shipping_id, payment_id) values(4,5);
insert into shipping_payment(shipping_id, payment_id) values(5,3);
insert into shipping_payment(shipping_id, payment_id) values(5,4);
insert into shipping_payment(shipping_id, payment_id) values(5,5);

insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(1, 'liscop-sp-3000',        1, 'Liscop Super Profi 3000',              'false', 'true', '/images/clippers/Liscop/1m.png',    '/images/clippers/Liscop/1s.png',    '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(2, 'vs84-s',                2, 'VS84-S',                               'false', 'true', '/images/clippers/VS84-S/1m.png',    '/images/clippers/VS84-S/1s.png',    '10-50 голов',   false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(3, 'asi-101',               4, 'АСИ-101 с преобразователем 220В',      'false', 'true', '/images/clippers/ASI-101/1m.png',   '/images/clippers/ASI-101/1s.png',   '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(4, 'asu-1',                 5, 'АСУ-1',                                'false', 'true', '/images/parts/Toshiba/1m.png',     '/images/parts/Toshiba/1s.png',     '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(5, 'comb+cutter-msu-200',   1, 'Нож и гребенка для МСУ-200',           'true',  'true', '/images/parts/MSU-200/1m.png',      '/images/parts/MSU-200/1s.png',      '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(6, 'comb+cutter-other',     2, 'Нож и гребенка для VS84-S и F7',       'true',  'true', '/images/parts/VS84-S/1m.png',       '/images/parts/VS84-S/1s.png',       '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(7, 'comb+cutter-liscop-a5', 3, 'Нож и гребенка Liscop A5',             'true',  'true', '/images/parts/Liscop-A5/1m.png',    '/images/parts/Liscop-A5/1s.png',    '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(8, 'comb+cutter-7v-94',     4, 'Нож и гребенка 7V-94',                 'true',  'true', '/images/parts/7V-94/1m.png',        '/images/parts/7V-94/1s.png',        '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(9, 'p380',                  9, 'Преобразователь частоты тока',         'true',  'false', '/images/clippers/MSU-200/1m.png',   '/images/clippers/MSU-200/1s.png',   '',              false, true, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(10,'msu-200',               6, 'Машинка МСУ-200',                      'true',  'true', '/images/clippers/MSU-200/2m.png',   '/images/clippers/MSU-200/2s.png',   '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(11,'ta-1',                  7, 'Точильный аппарат ТА-1',               'true',  'true', '/images/parts/TA-1/1m.png',         '/images/parts/TA-1/1s.png',         '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(12,'f7',                    3, 'Takumi & F7 Professional',             'false', 'true', '/images/clippers/F7/1m.png',        '/images/clippers/F7/1s.png',        '',              true,  false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(13,'pch-400-2',             8, 'ПЧ-400-2',                             'true',  'true', '/images/clippers/PCH-400-2/1m.png', '/images/clippers/PCH-400-2/1s.png', '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(14,'esa-1d',                6, 'ЭСА-1Д',                               'false', 'true', '/images/clippers/ESA-1D/1m.png',    '/images/clippers/ESA-1D/1s.png',    '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(15,'toshiba',               5, 'Преобразователь (Япония)',   'true',  'true', '/images/parts/Toshiba/1m.png', '/images/parts/Toshiba/1s.png', '',            true,  false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(16,'ta-2',                 10, 'Точильный аппарат ТА-2',               'true',  'true', '/images/parts/TA-2/1m.png',         '/images/parts/TA-2/1s.png',         '',              true,  false, 'шт.');
-- insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(16,'pch-rus',               10, 'Преобразователь частоты (Россия)',    'true',  'true', '/images/clippers/PCH-400-2/1m.png', '/images/clippers/PCH-400-2/1s.png', '',              true, false, 'шт.');


insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (1, 1, 18500, 500, '2013-03-11', 12400, 500);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (1, 2, 18600, 250, '2013-03-11', 12225, 250);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (1, 3, 18900, 400, '2013-03-11', 13000, 700);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (1, 4, 18900, 400, '2013-03-11', 13000, 700);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (1, 5, 18900, 900, '2013-03-11', 12700, 400);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (2, 1, 8500, 500, '2013-03-11', 5400, 500);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (2, 2, 8500, 200, '2013-03-11', 5100, 200);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (2, 3, 8500, 200, '2013-03-11', 5100, 200);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (2, 4, 8500, 200, '2013-03-11', 5100, 200);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (2, 5, 8700, 700, '2013-03-11', 5300, 200);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (3, 1, 19200, null, null, 10600, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (3, 2, 19500, null, null, 10900, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (3, 3, 19500, null, null, 10900, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (3, 4, 19500, null, null, 10900, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (3, 5, 19500, null, null, 10900, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (4, 1, 28500, null, null, 15500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (4, 2, 28850, null, null, 15500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (4, 3, 29000, null, null, 15500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (4, 4, 29000, null, null, 15500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (4, 5, 29000, null, null, 15500, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (5, 1, 750, null, null, 270, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (5, 2, 750, null, null, 270, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (5, 3, 850, null, null, 300, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (5, 4, 850, null, null, 300, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (5, 5, 850, null, null, 300, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (6, 1, 1500, null, null, 450, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (6, 2, 1500, null, null, 450, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (6, 3, 1650, null, null, 500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (6, 4, 1650, null, null, 500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (6, 5, 1650, null, null, 500, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (7, 1, 2700, null, null, 1200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (7, 2, 2700, null, null, 1200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (7, 3, 2900, null, null, 1250, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (7, 4, 2900, null, null, 1250, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (7, 5, 2900, null, null, 1250, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (8, 1, 2000, null, null, 550, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (8, 2, 2000, null, null, 550, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (8, 3, 2200, null, null, 550, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (8, 4, 2200, null, null, 550, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (8, 5, 2200, null, null, 550, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (9, 1, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (9, 2, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (9, 3, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (9, 4, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (9, 5, 10500, null, null, 5000, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (10, 1, 9000, null, null, 4500, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (10, 2, 9350, null, null, 4650, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (10, 3, 9350, null, null, 4650, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (10, 4, 9350, null, null, 4650, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (10, 5, 9500, null, null, 4800, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (11, 1, 44000, 5000, '2013-03-11', 23000, 5000);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (11, 2, 44000, 4000, '2013-03-11', 23000, 5000);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (11, 3, 44000, 44000, '2013-03-11', 18000, 18000);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (11, 4, 44000, 44000, '2013-03-11', 18000, 18000);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (11, 5, 44000, 3500, '2013-03-11', 21500, 3500);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 1, 44000, null, null, 21000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 2, 44500, null, null, 21000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 3, 45000, null, null, 21000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 4, 45000, null, null, 21000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 5, 45000, null, null, 21000, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (12, 1, 9700, 1200, '2013-03-11', 6800, 1200);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (12, 2, 9700, 900, '2013-03-11', 6700, 900);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (12, 3, 9700, 900, '2013-03-11', 6700, 900);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (12, 4, 9700, 900, '2013-03-11', 6700, 900);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (12, 5, 9700, 1200, '2013-03-11', 5900, 0);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (13, 1, 10000, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (13, 2, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (13, 3, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (13, 4, 10500, null, null, 5000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (13, 5, 10500, null, null, 5000, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (14, 1, 20000, null, null, 12900, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (14, 2, 20000, null, null, 13200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (14, 3, 20000, null, null, 13200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (14, 4, 20000, null, null, 13200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (14, 5, 20000, null, null, 13300, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (15, 1, 19500, null, null, 10000, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (15, 2, 20000, null, null, 10200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (15, 3, 20000, null, null, 10200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (15, 4, 20000, null, null, 10200, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (15, 5, 20000, null, null, 10200, null);
--
-- insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 1, 19500, null, null);
-- insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 2, 20000, null, null);
-- insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 3, 20000, null, null);
-- insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 4, 20000, null, null);
-- insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d, fprice, fdiscount_p) values (16, 5, 20000, null, null);

insert into product_relation (owner_id, dependant_id, seq_num) values (1, 7, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (1, 5, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (1, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (1, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 6, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 8, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 6, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 8, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 7, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 5, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 6, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 8, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (9, 4, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (9, 10, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (13, 10, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (14, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (14, 7, 2);

insert into product_relation (owner_id, dependant_id, seq_num) values (15, 10, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (15, 3, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (15, 4, 3);

insert into product_relation (owner_id, dependant_id, seq_num) values (16, 7, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (16, 5, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (16, 6, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (16, 8, 4);

--
-- insert into product_relation (owner_id, dependant_id, seq_num) values (16, 10, 1);
-- insert into product_relation (owner_id, dependant_id, seq_num) values (16, 3, 2);
-- insert into product_relation (owner_id, dependant_id, seq_num) values (16, 4, 3);

insert into product_relation (owner_id, dependant_id, seq_num) values (5, 1, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 3, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 4, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 10, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 11, 5);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 16, 6);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 2, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 12, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 16, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 1, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 3, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 4, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 10, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 11, 5);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 16, 6);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 2, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 12, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 16, 4);



