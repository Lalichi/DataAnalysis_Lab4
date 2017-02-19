%-----------------------
% Exp 1, Graph 2
%-----------------------    
DataCorrection;
load Data_1.mat;

% Data Input
Lens_Pos_rec        = Data_1(1).Reading - OffsetLens;
Lens_Pos            = SIConv(Lens_Pos_rec,'milli');

Image_Pos_rec       = Data_1(2).Reading + OffsetScreen;
Image_Pos           = SIConv(Image_Pos_rec,'milli');
Image_Pos_m         = mean(Image_Pos.').';
Image_Disp          = Image_Pos_m - Lens_Pos;

ImageSize_rec       = Data_1(3).Reading;
ImageSize           = SIConv(ImageSize_rec,'milli');
ImageSize_m         = mean(ImageSize.');

% Magnification
ObjectSize_rec      = 20;
ObjectSize          = SIConv(ObjectSize_rec,'milli');
Magnification       = (-ImageSize_m/ObjectSize).';

% Error
eImage          = SIConv(eOffScreen_rec,'milli');
eImage_fit      = [Image_Disp./Image_Disp].*eImage;
eImageSize      = SIConv(0.5,'milli');
eMagnif         = (eImageSize./ObjectSize).*(Image_Disp./Image_Disp);


% Graph
HVError2(Image_Disp,eImage_fit,Magnification,eMagnif,1)


% Graph Settings
ax = gca;
ax.Box = 'off';
ax.TickDir = 'out';
ax.TickLength = [0.01 0.035];
%
ax.XGrid = 'on';
ax.XMinorGrid = 'on';
ax.XMinorTick = 'on';
ax.XTick = 0.2:0.025:0.35;
ax.XLim = [0.2 0.35];
ax.XAxisLocation = 'top';
%
ax.YGrid = 'on';
ax.YMinorGrid = 'on';
ax.YMinorTick = 'on';
ax.YTick = -2.5:0.25:-1;
ax.YLim = [-2.5 -1];