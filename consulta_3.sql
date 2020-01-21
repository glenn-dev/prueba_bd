-- ¿CUANTOS CLIENTES HAN COMPRADO EL PRODUCTO 6?
SELECT nombre FROM clientes WHERE id IN (SELECT cliente_id FROM facturas WHERE id IN (SELECT factura_id FROM compras WHERE producto_id = 6));
