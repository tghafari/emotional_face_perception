function cfgOutput = display_visual_stim(presentingStr, nstim, cfgScreen, cfgExp, cfgOutput, cfgStim, cfgEyelink)
% cfgOutput = display_visual_stim(presentingStr, nstim, cfgScreen, cfgExp, cfgOutput, cfgStim, cfgEyelink)
% draw ans flip visual stimulus with coordinates in cfgScreen
% for the duration specified in cfgExp

cfgOutput.faceOnTmPnt(nstim) = send_trigger(cfgEyelink, sprintf('%s face onset', cfgStim.visStim{nstim, 4}));  % send morph level trigger
for frm = 1:cfgExp.stimFrm(nstim) - 1  % '- 1' is to compensate for the trigger duration
    if frm == 3
    cfgOutput.faceIDTmPnt(nstim) = send_trigger(cfgEyelink, sprintf('face id = %d', cfgStim.visStim{nstim, 3}));  % send ID trigger
    elseif frm == 5
        cfgOutput.faceSexTmPnt(nstim) = send_trigger(cfgEyelink, sprintf('%s face', cfgStim.visStim{nstim, 2}));  % send sex trigger
    end
    Screen('DrawTexture', cfgScreen.window, presentingStr.visStim{nstim}...
        , [], cfgStim.destVisStimCentre);
    Screen('FillOval', cfgScreen.window, cfgScreen.fixDotColor, cfgScreen.fixDotRect);
    Screen('Flip', cfgScreen.window, cfgScreen.vbl + (cfgScreen.waitFrm - 0.5) * cfgScreen.ifi);
end
cfgOutput.faceOffTmPnt(nstim) = send_trigger(cfgEyelink, 'stimulus offset');
Screen('FillOval', cfgScreen.window, cfgScreen.fixDotColor, cfgScreen.fixDotRect);
Screen('Flip', cfgScreen.window, cfgScreen.vbl + (cfgScreen.waitFrm - 0.5) * cfgScreen.ifi);

end

