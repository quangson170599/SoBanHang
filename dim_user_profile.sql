with cte as (
select total_transaction_value_vnd, total_order, active_days,
main_category, secondary_category
from [dbo].[dim_user_profile])
select sum(total_transaction_value_vnd) sum_total_transaction_value_vnd,
sum(total_order) sum_total_order,
main_category
from cte
group by main_category

with cte as (
select total_transaction_value_vnd, total_order, active_days,
main_category, secondary_category
from [dbo].[dim_user_profile])
select sum(total_transaction_value_vnd) sum_total_transaction_value_vnd,
sum(total_order) sum_total_order,
secondary_category, main_category
from cte
group by secondary_category, main_category
order by sum(total_transaction_value_vnd) desc, sum(total_order) desc

select location, main_category, sum(active_days) sum_active_days
from [dbo].[dim_user_profile]
group by location, main_category
order by location, sum(active_days) desc
