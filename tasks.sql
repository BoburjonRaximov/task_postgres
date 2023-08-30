"1"
select b.name, count(p.id * bt.quantity) as num 
    from branches as b
        join branch_transaction as bt on b.id = bt.branch_id
    join products as p on p.id = bt.product_id
    group by b.id
    order by num desc;
"2"
SELECT  b.name,SUM(p.price*bt.quantity) AS total_sum
            FROM branches AS b
                  JOIN branch_transaction AS bt ON b.id = bt.branch_id
      JOIN products AS p ON p.id = bt.product_id
      GROUP BY  b.id
      ORDER BY total_sum;

"3"
select p.name, count(bt.id) as numbers
    from products as p 
        join branch_transaction as bt on p.id = bt.product_id
    group by p.id
    order by numbers;

"4"
select c.name, count(bt.product_id) as numbers 
    from categories as c
    join products as p on p.category_id = c.id 
        left join branch_transaction as bt on p.id = bt.product_id
    group by c.name
    order by numbers;

"5"
select b.name, c.name, count(bt.id) as tr_soni
    from branch_transaction as bt
         inner join branches as b on b.id = bt.branch_id
         inner join products as p on p.id = bt.product_id
         left join categories as c on c.id = p.category_id
    group by b.name , c.name
    order by tr_soni;


