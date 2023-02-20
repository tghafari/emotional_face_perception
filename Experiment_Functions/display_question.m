function cfgOutput = display_question(cfgTxt, nstim, cfgScreen, cfgExp, cfgOutput, cfgEyelink)
% cfgOutput = display_question(cfgTxt, nstim, cfgScreen, cfgExp, cfgOutput, cfgEyelink)
% draw ans flip fixation cross with coordinates in cfgScreen
% for the duration specified in cfgExp

cfgOutput.questionOnTmPnt(nstim) = send_trigger(cfgEyelink, 'question onset');

for frm = 1:cfgExp.quesFrm
    DrawFormattedText(cfgScreen.window, cfgTxt.question, 'center', 'center', [cfgScreen.white, cfgScreen.white, cfgScreen.white]);
    Screen('FillOval', cfgScreen.window, cfgScreen.fixDotColor, cfgScreen.fixDotRect);
    Screen('Flip', cfgScreen.window, cfgScreen.vbl + (cfgScreen.waitFrm - 0.5) * cfgScreen.ifi);
end

end

