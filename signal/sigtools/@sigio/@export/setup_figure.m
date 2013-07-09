function setup_figure(hXP)
%SETUP_FIGURE Setup the figure for the Export Dialog

%   Author(s): P. Costa
%   Copyright 1988-2003 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $  $Date: 2004/04/13 00:27:45 $

% This can be a private method

sz   = export_gui_sizes(hXP);
cbs  = dialog_cbs(hXP);
hFig = figure('Position', sz.fig, ...
    'Integerhandle','Off', ...
    'NumberTitle', 'Off', ...
    'Name', 'Export', ...
    'Menubar', 'None', ...
    'HandleVisibility', 'Callback', ...
    'CloseRequestFcn', cbs.cancel, ...
    'Resize', 'Off', ...
    'Color',get(0,'defaultuicontrolbackgroundcolor'), ...
    'Visible', hXP.Visible);

set(hXP, 'FigureHandle', hFig);

% [EOF]
