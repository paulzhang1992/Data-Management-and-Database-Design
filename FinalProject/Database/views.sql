-- rank the model by mae
select model_id, mae from leaderboard order by mae desc

-- get the number of paramters of deep learning model
select table_name, count(*)-1 as countp from information_schema.columns
where table_schema='hyperparameter' and table_name = 'DP_hyperparameter'

-- get the rank of deep learning model by the hyperparamter epochs
select * from leaderboard where model_id in (select model_id from DP_hyperparameter order by epochs desc)

-- get the rank of GBM model by the hyperparamter seed
select * from leaderboard where model_id in (select model_id from GBM_hyperparameter order by seed desc)

-- get the result of the deep learning model when the running time equals to 700s
select * from leaderboard where model_id in (select model_id from model_data where runtime = 700)

-- function_1: find if the deep learning model that has the activation of 'Rectifier'
create function find_rectifier_dp(id text)
returns text
begin
  declare result text;
  select model_id into result from DP_hyperparameter
    where activation = 'Rectifier';
  return result;
end;

-- function_2: find the GBM models whose seeds are negative
create function find_negative_seed_GBM()
returns text
begin
  declare result text;
  select model_id into result from GBM_hyperparameter
    where seed < 0;
  return result;
end;

-- function_3: find the XRT models whose distribution is what we need(like gaussian distribution)
create function find_gaussian_distribution_XRT(dis text, id text)
returns boolean
begin
  declare r text;
  select distribution into r from XRT_hyperparameter
    where model_id = id;
  return r = dis;
end;

-- function_4: find if the rho of the deep learning model meets the requirements
create function find_rho_dp(req float, id text)
returns boolean
begin
  declare r float;
  select rho into r from DP_hyperparameter
    where model_id = id;
  return r > req;
end;

-- vies_1: find those deep learning models order by rmse.
create view view_1 as
  select DP_hyperparameter.model_id, leaderboard.rmse
  from DP_hyperparameter left join leaderboard on DP_hyperparameter.model_id = leaderboard.model_id
  order by leaderboard.rmse desc

-- view_2: find those GBM models order by mean residual variance
create view view_2 as
  select GBM_hyperparameter.model_id, leaderboard.mean_residual_deviance
  from GBM_hyperparameter left join leaderboard on GBM_hyperparameter.model_id = leaderboard.model_id
  order by leaderboard.mean_residual_deviance desc

-- view_3: order all models according to the rmse
create view view_3 as
  select model_id, rmse from leaderboard order by rmse desc

-- view_4: get the rmse of models whose running time equals to 1000s
create view view_4 as
  select leaderboard.model_id, leaderboard.rmse, md.runtime
  from leaderboard left join model_data md on leaderboard.model_id = md.model_id
  where md.runtime = 1000