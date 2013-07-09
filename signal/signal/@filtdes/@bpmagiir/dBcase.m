function dBcase(h,d)
%DBCASE Handle the dB case.
%
% This should be a private method.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.
%   $Revision: 1.3 $  $Date: 2002/04/15 00:31:48 $

convertmag(h,d,...
    {'Estop1','Epass','Estop2'},...
    {'Astop1','Apass','Astop2'},...
    {'stop','pass','stop'},...
    'todb');