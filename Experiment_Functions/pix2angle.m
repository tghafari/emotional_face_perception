function ang = pix2angle(display,pix)
%angle = pix2angle(display,pix)
%
%converts monitor pixels into degrees of visual angle.
%
%Inputs:
%display.dist (distance from screen (cm))
%display.width (width of screen (cm))
%display.resolution (number of pixels of display in horizontal direction)
%
%ang (visual angle)
%
%Warning: assumes isotropic (square) pixels

%Written 11/1/07 gmb zre

%Calculate pixel size
pixSize = display.width/display.resolution(1);   %cm/pix

sz = pix*pixSize;  %cm (duh)

ang = 2*180*atan(sz/(2*display(1).dist))/pi;

return

% Tara's Laptop 

display.dist = 65; %cm
display.width = 28.65; %cm
display.resolution = 1680;
% Resolution = [1680  1050];


% ang = pix2angle(display,pix)
