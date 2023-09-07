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

"6"
select b.name, count(bt.id) filter(where bt.types = 'plus') as plus_count,
       count(bt.id) filter(where bt.types = 'minus') as minus_count,
       sum(p.price) filter(where bt.types = 'plus') as plus_sum,
       sum(p.price) filter(where bt.types = 'minus') as minus_sum
    from branch_transaction as bt
        inner join branches as b on b.id = bt.branch_id
        inner join products as p on p.id = bt.product_id
    group by b.name; 

"7"
select bp.created_at as kun, count(bp.product_id) as soni 
    from branch_pr_transaction as bp
     group by bp.created_at
     order by  soni;

"8"
select p.name, count(bp.created_at) as kiritilgan, count(bp.deleted_at) as chiqarilgan
    from branch_pr_transaction as bp
       join products as p on p.id = bp.product_id
    group by p.name;

"9"
select b.name, sum(p.price) as tr_sum
    from branch_transaction as bt
         inner join branches as b on b.id = bt.branch_id
         inner join products as p on p.id = bt.product_id
    group by b.name
    order by tr_sum;

"10"
select u.name, sum(p.price) as u_sum
    from branch_transaction as bt
         inner join users as u on u.id = bt.users_id
         inner join products as p on p.id = bt.product_id
    group by u.name
    order by u_sum;
        
"11"
select u.name, count(p.id), sum(p.price) as u_sum
    from branch_pr_transaction as bt
         inner join users as u on u.id = bt.users_id
         inner join products as p on p.id = bt.product_id
    group by u.name
    order by u_sum;

"12"
select u.name, count(bt.created_at) as kiritilgan, count(bt.deleted_at) as chiqarilgan
    from branch_pr_transaction as bt
         inner join users as u on u.id = bt.users_id
         inner join products as p on p.id = bt.product_id
    group by u.name;

   "13"
   select b.name, avg(bt.quantity) filter(where bt.type = 'plus') as kiritilgan,
         avg(bt.quantity) filter(where bt.type = 'minus') as chiqarilgan
    from branch_pr_transaction as bt
         join branches as b on b.id = bt.branch_id
    group by b.name;
 

"14"
     select u.name, avg(p.price) filter(where bt.type = 'plus') as kiritilgan,
         avg(p.price) filter(where bt.type = 'minus') as chiqarilgan
    from branch_pr_transaction as bt
         join users as u on u.id = bt.users_id
         join products as p on p.id = bt.product_id
    group by u.name;   

