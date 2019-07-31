select idx, Truth,Pred,Val
from mltest
where idx not in 
(
select idx 
from mltest
where truth like '%' + Pred + '%'
or idx in

(
select idx
from mltest
where Pred like '%' + Truth + '%'

)
and truth not like Pred
)

order by idx