-- ¿QUE CLIENTE REALIZO LA COMPRA MAS CARA?
SELECT nombre FROM clientes WHERE id IN (SELECT cliente_id FROM facturas WHERE total IN (SELECT MAX(total) FROM facturas) );
