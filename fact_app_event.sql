use SoBanHang

with cte as (
select session_duration_second,[screen_name], channel_source, device, location
from [dbo].[fact_app_event])
select avg(session_duration_second) avg_session_duration_second, location
from cte
group by location

with cte as (
select session_duration_second,[screen_name], channel_source, device, location
from [dbo].[fact_app_event])
select avg(session_duration_second) avg_session_duration_second, channel_source
from cte
group by channel_source

with cte as (
select session_duration_second,[screen_name], channel_source, device, location
from [dbo].[fact_app_event])
select sum(session_duration_second) avg_session_duration_second, device
from cte
group by device

with cte as (
select session_duration_second,[screen_name], channel_source, device, location
from [dbo].[fact_app_event])
select avg(session_duration_second) avg_session_duration_second, device,location,channel_source
from cte
group by device,location,channel_source

with cte as (
select a.* from 
[dbo].[dim_user_profile] a
join [dbo].[fact_app_event] b on a.user_id = b.user_id)
select sum(total_transaction_value_vnd) sum_total_transaction_value_vnd, 
sum(total_order) as sum_total_order, location
from cte
group by location