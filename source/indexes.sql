/* We don't use the indexes for tables that are
   1) Уникальность значений в столбце влияет на производительность индекса.
   В общем случае, чем больше у вас дубликатов в столбце, тем хуже работает индекс.
   2) Некоторые поля стоит индексировать всегда: primary key, foreign key, unique fields
   3) Стоит индексировать те поля которые часто участвуют в выражениях вида expr1 = expr2; group by; order by(?)
   joins expressions
   4) Не стоит делать для тех полей которые часто подвержены Update
   5) Всегда стоит смотреть именно на приложение, которое использует бд, чтобы понимать
   структуру частых вопросов
   */

CREATE INDEX ON clothes_shops.customer(customer_id);

CREATE INDEX ON clothes_shops.brand(brand_id);

CREATE INDEX ON clothes_shops.clothes(brand_id);

CREATE INDEX ON clothes_shops.clothes_x_store(store_id);
CREATE INDEX ON clothes_shops.clothes_x_store(clothes_id);

CREATE INDEX ON clothes_shops.store(store_id);

CREATE INDEX ON clothes_shops.delivery_point(delivery_point_id);
CREATE INDEX ON clothes_shops.delivery_point(store_id);

CREATE INDEX ON clothes_shops.employee_version(employee_id);
CREATE INDEX ON clothes_shops.employee_version(delivery_point_id);

CREATE INDEX ON clothes_shops.order(order_id);
CREATE INDEX ON clothes_shops.order(store_id);
