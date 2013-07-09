function specs = thisgetspecs(this)
%THISGETSPECS   Get the specs.

%   Author(s): J. Schickler
%   Copyright 2005 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $  $Date: 2005/04/04 17:02:55 $

specs.Fpass = 1/this.Band-this.TransitionWidth/2;
specs.Fstop = 1/this.Band+this.TransitionWidth/2;
specs.Apass = NaN;
specs.Astop = NaN;

% [EOF]
