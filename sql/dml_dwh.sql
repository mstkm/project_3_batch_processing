-- Transform to DWH

delete from dim_orders;
insert into dim_orders
select 
	to2.order_id,
	to2.order_date,
	to2.user_id,
	tp.payment_name,
	ts.shipper_name,
	to2.order_price,
	to2.order_discount,
	tv.voucher_name,
	tv.voucher_price,
	to2.order_total,
	tr.rating_status 
from tb_orders to2 
join tb_payments tp 
	on to2.payment_id = tp.payment_id
join tb_shippers ts 
	on to2.shipper_id = ts.shipper_id 
join tb_vouchers tv 
	on to2.voucher_id = tv.voucher_id 
join tb_ratings tr
	on to2.rating_id = tr.rating_id 
	