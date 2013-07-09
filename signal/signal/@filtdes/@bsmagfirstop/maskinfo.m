function cmd = maskinfo(hObj, d)
%MASKINFO Return the mask information

%   Author(s): J. Schickler
%   Copyright 1988-2003 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $  $Date: 2004/04/13 00:03:25 $

if isdb(d),
    astop = get(d, 'Astop');
else
    astop = get(d, 'Dstop');
end

cmd{1} = [];

cmd{2}.magfcn     = 'stop';
cmd{2}.amplitude  = astop;
cmd{2}.filtertype = 'bandstop';

cmd{3} = [];

% [EOF]
