function b = actualdesign(this, hspecs, varargin)
%ACTUALDESIGN <short description>
%   OUT = ACTUALDESIGN(ARGS) <long description>

%   Copyright 2008 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $  $Date: 2008/10/31 07:05:07 $

b = rcoswindesign(this, hspecs, 'sqrt');

% [EOF]
