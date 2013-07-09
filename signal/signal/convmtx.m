function t = convmtx(v,n)
%CONVMTX Convolution matrix.
%   CONVMTX(C,N) returns the convolution matrix for vector C.
%   If C is a column vector and X is a column vector of length N,
%   then CONVMTX(C,N)*X is the same as CONV(C,X).
%   If R is a row vector and X is a row vector of length N,
%   then X*CONVMTX(R,N) is the same as CONV(R,X).
%   See also CONV.

%   Author(s): L. Shure, 5-17-88
%   	   T. Krauss, 3-30-93, removed dependence on toeplitz
%   Copyright 1988-2004 The MathWorks, Inc.
%   $Revision: 1.6.4.2 $  $Date: 2004/12/26 22:15:33 $

[mv,nv] = size(v);
v = v(:);		% make v a column vector

%  t = toeplitz([v; zeros(n-1,1)],zeros(n,1));  put Toeplitz code inline
c = [v; zeros(n-1,1)];
r = zeros(n,1);
m = length(c);
x = [r(n:-1:2) ; c(:)];                 % build vector of user data
%
cidx = (0:m-1)';
ridx = n:-1:1;
t = cidx(:,ones(n,1)) + ridx(ones(m,1),:);    % Toeplitz subscripts
t(:) = x(t);                            % actual data
% end of toeplitz code

if mv < nv
	t = t.';
end

