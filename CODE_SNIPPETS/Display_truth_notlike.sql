select idx, Truth,Pred,Val
from MachineLearning
where idx not in 
(
select idx 
from MachineLearning
where truth like '%' + Pred + '%'
or idx in

(
select idx
from MachineLearning
where Pred like '%' + Truth + '%'

)
and truth not like Pred
)