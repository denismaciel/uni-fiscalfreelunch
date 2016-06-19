%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'nkm';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nkm.log');
M_.exo_names = 'eps_con';
M_.exo_names_tex = 'eps\_con';
M_.exo_names_long = 'eps_con';
M_.exo_names = char(M_.exo_names, 'eps_gov');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_gov');
M_.exo_names_long = char(M_.exo_names_long, 'eps_gov');
M_.endo_names = 'xV';
M_.endo_names_tex = 'xV';
M_.endo_names_long = 'xV';
M_.endo_names = char(M_.endo_names, 'piV');
M_.endo_names_tex = char(M_.endo_names_tex, 'piV');
M_.endo_names_long = char(M_.endo_names_long, 'piV');
M_.endo_names = char(M_.endo_names, 'iV');
M_.endo_names_tex = char(M_.endo_names_tex, 'iV');
M_.endo_names_long = char(M_.endo_names_long, 'iV');
M_.endo_names = char(M_.endo_names, 'ypotV');
M_.endo_names_tex = char(M_.endo_names_tex, 'ypotV');
M_.endo_names_long = char(M_.endo_names_long, 'ypotV');
M_.endo_names = char(M_.endo_names, 'rpotV');
M_.endo_names_tex = char(M_.endo_names_tex, 'rpotV');
M_.endo_names_long = char(M_.endo_names_long, 'rpotV');
M_.endo_names = char(M_.endo_names, 'lumptax');
M_.endo_names_tex = char(M_.endo_names_tex, 'lumptax');
M_.endo_names_long = char(M_.endo_names_long, 'lumptax');
M_.endo_names = char(M_.endo_names, 'conshk');
M_.endo_names_tex = char(M_.endo_names_tex, 'conshk');
M_.endo_names_long = char(M_.endo_names_long, 'conshk');
M_.endo_names = char(M_.endo_names, 'govshk');
M_.endo_names_tex = char(M_.endo_names_tex, 'govshk');
M_.endo_names_long = char(M_.endo_names_long, 'govshk');
M_.endo_names = char(M_.endo_names, 'debtg');
M_.endo_names_tex = char(M_.endo_names_tex, 'debtg');
M_.endo_names_long = char(M_.endo_names_long, 'debtg');
M_.endo_names = char(M_.endo_names, 'rV');
M_.endo_names_tex = char(M_.endo_names_tex, 'rV');
M_.endo_names_long = char(M_.endo_names_long, 'rV');
M_.endo_names = char(M_.endo_names, 'yV');
M_.endo_names_tex = char(M_.endo_names_tex, 'yV');
M_.endo_names_long = char(M_.endo_names_long, 'yV');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'shrgy');
M_.param_names_tex = char(M_.param_names_tex, 'shrgy');
M_.param_names_long = char(M_.param_names_long, 'shrgy');
M_.param_names = char(M_.param_names, 'nuc');
M_.param_names_tex = char(M_.param_names_tex, 'nuc');
M_.param_names_long = char(M_.param_names_long, 'nuc');
M_.param_names = char(M_.param_names, 'psip');
M_.param_names_tex = char(M_.param_names_tex, 'psip');
M_.param_names_long = char(M_.param_names_long, 'psip');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'gam_xgap');
M_.param_names_tex = char(M_.param_names_tex, 'gam\_xgap');
M_.param_names_long = char(M_.param_names_long, 'gam_xgap');
M_.param_names = char(M_.param_names, 'gam_pi');
M_.param_names_tex = char(M_.param_names_tex, 'gam\_pi');
M_.param_names_long = char(M_.param_names_long, 'gam_pi');
M_.param_names = char(M_.param_names, 'phi_tax');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_tax');
M_.param_names_long = char(M_.param_names_long, 'phi_tax');
M_.param_names = char(M_.param_names, 'thetap');
M_.param_names_tex = char(M_.param_names_tex, 'thetap');
M_.param_names_long = char(M_.param_names_long, 'thetap');
M_.param_names = char(M_.param_names, 'sigma_hat');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_hat');
M_.param_names_long = char(M_.param_names_long, 'sigma_hat');
M_.param_names = char(M_.param_names, 'phi_mc');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_mc');
M_.param_names_long = char(M_.param_names_long, 'phi_mc');
M_.param_names = char(M_.param_names, 'kappap');
M_.param_names_tex = char(M_.param_names_tex, 'kappap');
M_.param_names_long = char(M_.param_names_long, 'kappap');
M_.param_names = char(M_.param_names, 'taxsub');
M_.param_names_tex = char(M_.param_names_tex, 'taxsub');
M_.param_names_long = char(M_.param_names_long, 'taxsub');
M_.param_names = char(M_.param_names, 'rhat');
M_.param_names_tex = char(M_.param_names_tex, 'rhat');
M_.param_names_long = char(M_.param_names_long, 'rhat');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 11;
M_.param_nbr = 17;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('nkm_static');
erase_compiled_function('nkm_dynamic');
M_.lead_lag_incidence = [
 0 4 15;
 0 5 16;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 17;
 2 11 18;
 3 12 0;
 0 13 0;
 0 14 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 39;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 0.995;
beta = M_.params( 1 );
M_.params( 2 ) = 0.3;
alpha = M_.params( 2 );
M_.params( 3 ) = 1;
sigma = M_.params( 3 );
M_.params( 4 ) = 2.5;
chi = M_.params( 4 );
M_.params( 5 ) = 0.2;
shrgy = M_.params( 5 );
M_.params( 6 ) = 0.01;
nuc = M_.params( 6 );
M_.params( 7 ) = 0.8;
psip = M_.params( 7 );
M_.params( 9 ) = 1000;
gam_xgap = M_.params( 9 );
M_.params( 10 ) = 1000;
gam_pi = M_.params( 10 );
M_.params( 8 ) = 0.1;
rho = M_.params( 8 );
M_.params( 11 ) = 0.01;
phi_tax = M_.params( 11 );
M_.params( 12 ) = 0.1;
thetap = M_.params( 12 );
M_.params( 13 ) = M_.params(3)*(1-M_.params(5))*(1-M_.params(6));
sigma_hat = M_.params( 13 );
M_.params( 14 ) = M_.params(4)/(1-M_.params(2))+1/M_.params(13)+M_.params(2)/(1-M_.params(2));
phi_mc = M_.params( 14 );
M_.params( 15 ) = (1-M_.params(7))*(1-M_.params(7)*M_.params(1))/M_.params(7)*M_.params(14);
kappap = M_.params( 15 );
M_.params( 16 ) = M_.params(5)/M_.params(12);
taxsub = M_.params( 16 );
M_.params( 17 ) = 1/(M_.params(1)-1);
rhat = M_.params( 17 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0.005;
oo_.steady_state( 3 ) = 0.01;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
options_.irf = 100;
options_.order = 1;
var_list_=[];
var_list_ = 'xV';
var_list_ = char(var_list_, 'piV');
var_list_ = char(var_list_, 'iV');
var_list_ = char(var_list_, 'ypotV');
var_list_ = char(var_list_, 'rpotV');
var_list_ = char(var_list_, 'lumptax');
var_list_ = char(var_list_, 'conshk');
var_list_ = char(var_list_, 'govshk');
var_list_ = char(var_list_, 'debtg');
var_list_ = char(var_list_, 'rV');
var_list_ = char(var_list_, 'yV');
info = stoch_simul(var_list_);
save('nkm_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nkm_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nkm_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nkm_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nkm_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
