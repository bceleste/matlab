function fdrmmenu(hndl)
%FDRMMENU Remove a menu from the Filter Design & Analysis Tool (FDATool).
%   FDRMMENU(HNDL) deletes a menu with handle HNDL.  HNDL can be a 
%   vector of handles.
%
%   EXAMPLE:
%   % Add a "Tools" menu to the menubar
%   h = fdatool;
%   hndl = fdaddmenu(h,6,'Tool&s');
%
%   % Remove the "Tools" menu from FDATool
%   fdrmmenu(hndl); 
%
%   See also FDADDMENU, DELETE.

%   Author(s): P. Costa 
%   Copyright 1988-2002 The MathWorks, Inc.
%   $Revision: 1.4.4.1 $  $Date: 2007/12/14 15:15:47 $ 

error(nargchk(1,1,nargin,'struct'));
delete(hndl);

% [EOF]
