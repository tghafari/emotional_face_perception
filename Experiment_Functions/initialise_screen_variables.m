function cfgScreen = initialise_screen_variables(cfgExp)
% cfgScreen = initialise_screen_variables(cfgExp)
% introduce primary settings of screen
% resolution and screen size and distance needs modification according to
% each site


PsychDefaultSetup(2);
cfgScreen.scrNum = max(Screen('Screens'));  % get screen number - draw to the external screen if avaliable

[cfgScreen.dispSize.width, cfgScreen.dispSize.height]...
    = Screen('DisplaySize', cfgScreen.scrNum);  % get the physical size of the screen in millimeters
cfgScreen.distance = 60;  % set the distance from participant to the monitor in cm
cfgScreen.resolution = Screen('Resolution', cfgScreen.scrNum);  % get/set the on screen resolution

cfgScreen.black = BlackIndex(cfgScreen.scrNum);
cfgScreen.white = WhiteIndex(cfgScreen.scrNum);
cfgScreen.grey = cfgScreen.white/2;
cfgScreen.backgroundColor = cfgScreen.black;
cfgScreen.fntSize = 50;

if cfgExp.task || cfgExp.train
        cfgScreen.fullScrn = [0, 0, cfgScreen.resolution.width, cfgScreen.resolution.height];  % full screen for task/ train
else
        cfgScreen.fullScrn = [300, 300, 900, 900];  % use a smaller screen during testing
end

