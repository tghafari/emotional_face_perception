function cfgOutput = calculate_show_feedback(cfgOutput, cfgExp, nstim, blk, cfgScreen, cfgEyelink)
% cfgOutput = calculate_show_feedback(cfgOutput, cfgExp, nstim, blk, cfgScreen, cfgEyelink)
% calculates performance for each block

FB = cfgExp.numTrial - sum(strcmp({cfgOutput.keyName{(blk-1)*cfgExp.numTrial+1:blk*cfgExp.numTrial}}, ...
        {'no resp'})); %#ok<*CCAT1>


cfgOutput.blkEnd(nstim) = send_trigger(cfgEyelink, 'end of block');
text = ['you have answered ', num2str(round(100 * FB / cfgExp.numTrial)), '% of trials'];

Screen('Flip', cfgScreen.window);
DrawFormattedText(cfgScreen.window, text, 'center', 'center', [cfgScreen.white, cfgScreen.white, cfgScreen.white]);
Screen('Flip', cfgScreen.window);
WaitSecs(5)

end