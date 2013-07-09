function y = upsample(x,N,varargin)
%UPSAMPLE Upsample input signal.
%   UPSAMPLE(X,N) upsamples input signal X by inserting
%   N-1 zeros between input samples.  X may be a vector
%   or a signal matrix (one signal per column).
%
%   UPSAMPLE(X,N,PHASE) specifies an optional sample offset.
%   PHASE must be an integer in the range [0, N-1].
%
%   See also DOWNSAMPLE, UPFIRDN, INTERP, DECIMATE, RESAMPLE.

%   Copyright 1988-2002 The MathWorks, Inc.
%   $Revision: 1.3.4.1 $  $Date: 2009/08/11 15:47:58 $

% Check the input data type. Single precision is not supported.
try
    chkinputdatatype(x,N);
catch ME
    throwAsCaller(ME);
end

y = updownsample(x,N,'Up',varargin{:});

% [EOF] 
