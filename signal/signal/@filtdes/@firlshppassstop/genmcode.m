function b = genmcode(h, d)
%GENMCODE Generate M code

%   Author(s): J. Schickler
%   Copyright 1988-2003 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $  $Date: 2004/04/13 00:06:59 $

if rem(get(d, 'Order'), 2),
    opt = ', ''Hilbert''';
else
    opt = '';
end

[fsstr, fs] = getfsstr(d);
[params, values, descs, iargs] = abstract_genmcode(h, d);

b = sigcodegen.mcodebuffer;

b.addcr(b.formatparams({'N', params{:}}, ...
    {getmcode(d, 'Order'), values{:}}, {'', descs{:}}));
b.cr;
b.addcr(designdesc(d));
b.addcr('b  = firls(N, %s%s);', iargs, opt);
b.add('Hd = dfilt.dffir(b);');

% [EOF]
