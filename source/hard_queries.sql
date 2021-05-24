SET SEARCH_PATH = clothes_shops;
/*  #1
    Хотим посчитать общие траты для каждого покупателя и вывести их в
    сортированном виде от большего к меньшему
*/

SELECT customer.customer_id, customer.customer_nm, customer.customer_surname, customer.customer_patronymic,
    sum(clothes_x_order.item_count * clothes.price_amt)
FROM
    customer
INNER JOIN clothes_shops.order ON
    customer.customer_id = clothes_shops.order.customer_id
INNER JOIN clothes_x_order ON
    clothes_shops.order.order_id = clothes_x_order.order_id
INNER JOIN clothes ON
    clothes_x_order.clothes_id = clothes.clothes_id
GROUP BY customer.customer_id
ORDER BY 5 DESC;


/*  #2
    Хотим узнать для каждого магазина какой вклад она вносит в виде зарплаты
    в какой-то город где находятся ее пункты доставки
*/
SELECT
       store.store_nm, delivery_point.city_nm, avg(employee_version.salary_amt)
FROM store
INNER JOIN delivery_point ON store.store_id = delivery_point.store_id
INNER JOIN employee_version ON delivery_point.delivery_point_id = employee_version.delivery_point_id
GROUP BY store.store_nm , delivery_point.city_nm
HAVING avg(employee_version.salary_amt) > 20000
ORDER BY 3 DESC;



/* #3
    Посмотрим на каждый из брендов чтобы увидеть топ-3 самых дорогих вещей каждому из них
   */
WITH tops as (
    SELECT
           brand_nm, price_amt, clothes_nm,
           ROW_NUMBER() OVER (PARTITION BY brand_nm ORDER BY price_amt) as rank

    FROM brand
    INNER JOIN clothes ON brand.brand_id = clothes.brand_id
)
SELECT *
FROM tops
WHERE tops.rank <= 3;

/* #4
    Посмотрим как менялся интерес к фирме Burberry по покупкам совершенным пользователями
   */
SELECT
    sum(clothes.price_amt * cxo.item_count)
        OVER (ORDER BY clothes_shops.order.purchase_dttm )
FROM clothes_shops.order
INNER JOIN clothes_x_order cxo ON clothes_shops.order.order_id = cxo.order_id
INNER JOIN clothes ON cxo.clothes_id = clothes.clothes_id
INNER JOIN brand ON clothes.brand_id = brand.brand_id
WHERE brand_nm = 'Burberry';

/* #5
    Посмотрим как менялось набегающее среднее по зарплате при изменении данных сотрудника
   */

SELECT employee_nm, employee_surname,
    avg(salary_amt)
        OVER (PARTITION BY employee_version.employee_id ORDER BY employee_version.valid_from_dttm )
FROM employee_version;





