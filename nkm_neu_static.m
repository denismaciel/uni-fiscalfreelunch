function [residual, g1, g2] = nkm_neu_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 10, 1);

%
% Model equations
%

lhs =y(1);
rhs =y(1)-params(13)*(y(3)-y(2)-y(5));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(1)+y(1)*params(15);
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(2)*params(10)+y(1)*params(9);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =params(13)*1/params(14)*(params(5)*y(8)+(1-params(5))*params(6)*y(7));
residual(4)= lhs-rhs;
lhs =y(5);
rhs =1/params(13);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =params(5)*y(8)+y(6)*(1+params(16))-params(17)*params(12)*(y(10)+y(1)*params(14))-y(9);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(6)*params(11);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(1)+y(4);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =y(7)*(1-params(8))+x(1);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)*(1-params(8))+x(2);
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-params(13));
  g1(1,3)=params(13);
  g1(1,5)=(-params(13));
  g1(2,1)=(-params(15));
  g1(2,2)=1-params(1);
  g1(3,1)=(-params(9));
  g1(3,2)=(-params(10));
  g1(3,3)=1;
  g1(4,4)=1;
  g1(4,7)=(-(params(13)*1/params(14)*(1-params(5))*params(6)));
  g1(4,8)=(-(params(13)*1/params(14)*params(5)));
  g1(5,5)=1;
  g1(6,1)=params(14)*params(17)*params(12);
  g1(6,6)=1-(1+params(16));
  g1(6,8)=(-params(5));
  g1(6,9)=1;
  g1(6,10)=params(17)*params(12);
  g1(7,6)=(-params(11));
  g1(7,9)=1;
  g1(8,1)=(-1);
  g1(8,4)=(-1);
  g1(8,10)=1;
  g1(9,7)=1-(1-params(8));
  g1(10,8)=1-(1-params(8));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
end
end
