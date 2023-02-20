function cfgExp = KbQueue_start_routine(cfgExp)
% KbQueue_start_routine(cfgExp)
% Starts KbQueueRoutine for the keyboard to start listening
% A call to KbQueueCheck is required for participants response

KbName('UnifyKeyNames');
cfgExp.quitKey = KbName('ESCAPE');  % quit key
cfgExp.respKeyH = KbName('RightShift');  % keyboard response happy
cfgExp.respKeyA = KbName('LeftShift');  % keyboard response angry
cfgExp.yesKey = KbName('y');  % yes response
cfgExp.noKey = KbName('n');  % no key
cfgExp.responses = [cfgExp.respKeyH, cfgExp.respKeyA];

% keyboard responses
cfgExp.activeKeys = [cfgExp.quitKey, cfgExp.respKeyH, cfgExp.respKeyA, cfgExp.yesKey, cfgExp.noKey];
cfgExp.deviceNum = -1;  % listen to all devices during test/train

% only listen for specific keys
scanList = zeros(1,256);
scanList(cfgExp.activeKeys) = 1;
KbQueueCreate(cfgExp.deviceNum,scanList);  % create queue
KbQueueStart;  % start listening to input
KbQueueFlush;  % clear all keyboard presses so far

end
