function examples = getexamples(this)
%GETEXAMPLES   Get the examples.

%   Author(s): J. Schickler
%   Copyright 2005 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $  $Date: 2005/06/30 17:38:02 $

examples = {{ ...
    'Design a bandstop Equiripple filter with a weighted stopband.', ...
    'h  = fdesign.bandstop(''N,Fp1,Fst1,Fst2,Fp2'', 30);', ...
    'Hd = design(h, ''equiripple'');', ...
    '', ...
    '% Weight the stopband more than the passbands.', ...
    'Hd(2) = design(h, ''equiripple'', ''Wstop'', 20);'....
    '', ...
    '% Compare the two designs.', ...
    'fvtool(Hd)'}};

% [EOF]
