function varargout = plot(varargin)
% plot method for GIfTI objects
%__________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging

% Guillaume Flandin
% $Id: plot.m 9 2008-05-27 12:20:41Z guillaume $

% if ishandle(varargin{1})
%     h = figure(varargin{1});
% else
%     h = figure;
%     %axis equal;
%     %axis off;
%     %camlight;
%     %camlight(-80,-10);
%     %lighting phong;
% end
% cameramenu;


cdata = [];
if nargin == 1
    this = varargin{1};
    h = gcf;
else
    if ishandle(varargin{1})
        h = figure(get(varargin{1},'parent'));
        this = varargin{2};
    else
        this = varargin{1};
        h = gcf;
        cdata = subsref(varargin{2},struct('type','.','subs','cdata'));
    end
end

hp = patch(struct(...
    'vertices',  subsref(this,struct('type','.','subs','vertices')),...
    'faces',     subsref(this,struct('type','.','subs','faces'))),...
    'FaceColor', 'b',...
    'EdgeColor', 'none');

if ~isempty(cdata)
    set(hp,'FaceVertexCData',cdata(:), 'FaceColor','interp')
end

axis equal;
axis off;
camlight;
camlight(-80,-10);
lighting phong;
cameramenu;

if nargout
    varargout{1} = hp;
end