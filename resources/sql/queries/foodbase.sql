-- :name get_all_products :many
SELECT products.name, price, amount, c.name, s.name, price_last_updated
FROM products
         join public.categories c on c.id = products.category_id
         join stores s on s.id = products.store_id