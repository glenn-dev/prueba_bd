-- ¿QUE CLIENTE PAGO SOBRE 100 DE MONTO?
SELECT nombre FROM clientes WHERE id IN (SELECT cliente_id FROM facturas WHERE total > 100);
