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
insert into shipping_payment(shipping_id, payment_id) values(4,3);
insert into shipping_payment(shipping_id, payment_id) values(4,4);
insert into shipping_payment(shipping_id, payment_id) values(4,5);
insert into shipping_payment(shipping_id, payment_id) values(5,3);
insert into shipping_payment(shipping_id, payment_id) values(5,4);
insert into shipping_payment(shipping_id, payment_id) values(5,5);

insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(1, 'liscop-sp-3000',        1, 'Liscop Super Profi 3000',              'false', 'true', '/images/clippers/Liscop/1m.png',    '/images/clippers/Liscop/1s.png',    '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(2, 'vs84-s',                2, 'VS84-S',                               'false', 'true', '/images/clippers/VS84-S/1m.png',    '/images/clippers/VS84-S/1s.png',    '10-50 голов',   false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(3, 'asi-101',               4, 'АСИ-101 с преобразователем 220В',      'false', 'true', '/images/clippers/ASI-101/1m.png',   '/images/clippers/ASI-101/1s.png',   '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(4, 'asu-1',                 5, 'АСУ-1',                                'false', 'true', '/images/clippers/ASU-1/1m.png',     '/images/clippers/ASU-1/1s.png',     '50-1000 голов', false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(5, 'comb+cutter-msu-200',   1, 'Нож и гребенка для МСУ-200',           'true',  'true', '/images/parts/MSU-200/1m.png',      '/images/parts/MSU-200/1s.png',      '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(6, 'comb+cutter-other',     2, 'Нож и гребенка для VS84-S и F7',       'true',  'true', '/images/parts/VS84-S/1m.png',       '/images/parts/VS84-S/1s.png',       '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(7, 'comb+cutter-liscop-a5', 3, 'Нож и гребенка Liscop A5',             'true',  'true', '/images/parts/Liscop-A5/1m.png',    '/images/parts/Liscop-A5/1s.png',    '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(8, 'comb+cutter-7v-94',     4, 'Нож и гребенка 7V-94',                 'true',  'true', '/images/parts/7V-94/1m.png',        '/images/parts/7V-94/1s.png',        '',              false, false, 'к-т.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(9, 'p380',                  5, 'Преобразователь частоты тока',         'true',  'true', '/images/clippers/MSU-200/1m.png',   '/images/clippers/MSU-200/1s.png',   '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(10,'msu-200',               6, 'Машинка МСУ-200',                      'true',  'true', '/images/clippers/MSU-200/2m.png',   '/images/clippers/MSU-200/2s.png',   '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(11,'ta-1',                  7, 'Точильный аппарат',                    'true',  'true', '/images/parts/TA-1/1m.png',         '/images/parts/TA-1/1s.png',         '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(12,'f7',                    3, 'F7',                                   'false', 'true', '/images/clippers/F7/1m.png',        '/images/clippers/F7/1s.png',        '',              true, false,  'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(13,'pch-400-2',             8, 'ПЧ-400-2',                             'true',  'true', '/images/clippers/PCH-400-2/1m.png', '/images/clippers/PCH-400-2/1s.png', '',              false, false, 'шт.');
insert into product (product_id, short_nm, seq_num, name, parts_f, menu_f, image_path_m, image_path_s, description, new_f, unavailable_f, unit) values(14,'esa-1d',                6, 'ЭСА-1Д',                               'false', 'true', '/images/clippers/ESA-1D/1m.png',    '/images/clippers/ESA-1D/1s.png',    '',              false, false, 'шт.');


insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (1, 1, 18500, 500, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (1, 2, 18500, 500, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (1, 3, 18900, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (1, 4, 18900, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (1, 5, 18900, 700, '2012-04-15');

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (2, 1, 9500, 800, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (2, 2, 9500, 800, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (2, 3, 9500, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (2, 4, 9500, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (2, 5, 9500, 700, '2012-04-15');

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (3, 1, 18500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (3, 2, 18500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (3, 3, 18700, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (3, 4, 18700, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (3, 5, 18700, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (4, 1, 27500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (4, 2, 27500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (4, 3, 27500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (4, 4, 27500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (4, 5, 27500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (5, 1, 750, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (5, 2, 750, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (5, 3, 750, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (5, 4, 750, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (5, 5, 750, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (6, 1, 1500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (6, 2, 1500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (6, 3, 1500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (6, 4, 1500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (6, 5, 1500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (7, 1, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (7, 2, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (7, 3, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (7, 4, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (7, 5, 2500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (8, 1, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (8, 2, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (8, 3, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (8, 4, 2500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (8, 5, 2500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (9, 1, 9500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (9, 2, 9500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (9, 3, 9500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (9, 4, 9500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (9, 5, 9500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (10, 1, 8500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (10, 2, 8500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (10, 3, 8500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (10, 4, 8500, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (10, 5, 8500, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (11, 1, 44000, 5000, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (11, 2, 44500, 5500, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (11, 3, 45000, 0, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (11, 4, 45000, 0, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (11, 5, 45000, 0, '2012-04-15');

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (12, 1, 9500, 600, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (12, 2, 9500, 600, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (12, 3, 9700, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (12, 4, 9700, 700, '2012-04-15');
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (12, 5, 9700, 700, '2012-04-15');

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (13, 1, 10000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (13, 2, 10000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (13, 3, 10000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (13, 4, 10000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (13, 5, 10000, null, null);

insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (14, 1, 20000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (14, 2, 20000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (14, 3, 20000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (14, 4, 20000, null, null);
insert into product_price (product_id, shipping_id, price, discount_p, discount_due_d) values (14, 5, 20000, null, null);

insert into product_relation (owner_id, dependant_id, seq_num) values (1, 7, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (1, 5, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (1, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 6, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 8, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (2, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 6, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 8, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (12, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (3, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (4, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 7, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (10, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 7, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 5, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 6, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (11, 8, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (9, 4, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (9, 10, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (13, 10, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (14, 5, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (14, 7, 2);

insert into product_relation (owner_id, dependant_id, seq_num) values (5, 1, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 3, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 4, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 10, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (5, 11, 5);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 2, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 12, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (6, 11, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 1, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 3, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 4, 3);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 10, 4);
insert into product_relation (owner_id, dependant_id, seq_num) values (7, 11, 5);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 2, 1);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 12, 2);
insert into product_relation (owner_id, dependant_id, seq_num) values (8, 11, 3);



