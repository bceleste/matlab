function plot3(this,long,lat,alt,varargin)
%KML.PLOT3(long,lat,alt) Create 3D plot of long vs. lat vs. alt
%   Similar to built-in plot3 function
%
%   Copyright 2012 Rafael Fernandes de Oliveira (rafael@rafael.aero)
%   $Revision: 1.4 $  $Date: 2012/02/08 16:00:00 $

    [long,lat] = this.checkUnit(long,lat);

    p = inputParser;
    
    nlat = numel(lat);
    p.addRequired('lat', @(a)isnumeric(a) && isvector(a) &&~isempty(a));
    p.addRequired('long',@(a)isnumeric(a) && isvector(a) &&~isempty(a) && numel(a) == nlat);
    p.addRequired('alt', @(a)isnumeric(a) && isvector(a) &&~isempty(a) && numel(a) == nlat);
    
    p.addParamValue('id','kml_plot3',@ischar);
    p.addParamValue('name','kml_plot3',@ischar);
    p.addParamValue('description','',@ischar);
    p.addParamValue('visibility',true,@islogical);
    p.addParamValue('lineColor','FFFFFFFF',@(a)ischar(a) && numel(a)==8);
    p.addParamValue('polyColor','00FFFFFF',@(a)ischar(a) && numel(a)==8);
    p.addParamValue('lineWidth',1,@(a)isnumeric(a) && numel(a)==1);
    p.addParamValue('altitudeMode','relativeToGround',@(a)ismember(a,{'clampToGround','relativeToGround','absolute'}));
    p.addParamValue('extrude',false,@islogical);
    p.addParamValue('tessellate',true,@islogical);
    
    p.addParamValue('timeStamp','',@ischar);
    p.addParamValue('timeSpanBegin','',@ischar);
    p.addParamValue('timeSpanEnd','',@ischar);    
    
    p.parse(lat,long,alt,varargin{:});
    
    arg = p.Results;
    
    if numel(lat)~=numel(long) || numel(lat)~=numel(alt)
        error('Invalid input size')
    end

    coordinates = mat2str([long(:) lat(:) alt(:)]);
    coordinates = coordinates(2:end-1);
    coordinates = strrep(coordinates,' ',',');
    coordinates = strrep(coordinates,';',' ');
    
    
    placemark   = this.xml.createElement('Placemark');
    linestring  = this.xml.createElement('LineString');
    style       = this.xml.createElement('Style');
    linestyle   = this.xml.createElement('LineStyle');
    polystyle   = this.xml.createElement('PolyStyle');

    placemark.setAttribute('id',arg.id);
    placemark.appendChild(this.textNode('name',arg.name));
    placemark.appendChild(this.textNode('visibility',num2str(arg.visibility)));
    placemark.appendChild(this.textNode('description',arg.description));
    
    if ~isempty(arg.timeStamp)
        timeStamp = this.xml.createElement('TimeStamp');
        timeStamp.appendChild(this.textNode('when',arg.timeStamp));
        placemark.appendChild(timeStamp);
    elseif ~isempty(arg.timeSpanBegin) || ~isempty(arg.timeSpanEnd)
        timeSpan = this.xml.createElement('TimeSpan');
        if ~isempty(arg.timeSpanBegin)
            timeSpan.appendChild(this.textNode('begin',arg.timeSpanBegin));
        end
        
        if ~isempty(arg.timeSpanEnd)
            timeSpan.appendChild(this.textNode('end',arg.timeSpanEnd));
        end
        placemark.appendChild(timeSpan);
    end
    
    
    linestyle.appendChild(this.textNode('color',arg.lineColor));
    linestyle.appendChild(this.textNode('width',num2str(arg.lineWidth)));
    
    polystyle.appendChild(this.textNode('color',arg.polyColor));
    
    linestring.setAttribute('id',['LineString_' arg.id]);
    linestring.appendChild(this.textNode('extrude',num2str(arg.extrude)));
    linestring.appendChild(this.textNode('tesselate',num2str(arg.tessellate)));
    linestring.appendChild(this.textNode('altitudeMode',arg.altitudeMode));
    linestring.appendChild(this.textNode('coordinates',coordinates));
    
    style.appendChild(linestyle);
    style.appendChild(polystyle);
    placemark.appendChild(style);
    placemark.appendChild(linestring);
    this.doc.appendChild(placemark);
end