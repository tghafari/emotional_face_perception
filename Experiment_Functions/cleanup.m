function cfgOutput = cleanup(cfgFile, cfgExp, cfgScreen, cfgEyelink, cfgOutput, cfgTxt, cfgStim) %#ok<INUSD> 
% cfgOutput = cleanup(cfgFile, cfgExp, cfgScreen, cfgEyelink, cfgOutput, cfgTxt, cfgStim)
% saves all the variables and closes datapixx and eyelink
% all experiment variables are in just to be saved
sca
cfgOutput.endTmPnt = send_trigger(cfgEyelink, 'end of experiment');

% check if the logfile is being overwritten
if exist([cfgFile.subDir, cfgFile.BIDSname, cfgFile.logFile], 'file') > 0
    warning('log file will be overwritten!');
    cont = input('Do you want to continue? (y/n) ','s');
    while true
        if cont == 'y'
            break
        elseif cont == 'n'
            error('The experiment aborted by operator.')
        end
    end
end

try
    save([cfgFile.subDir, cfgFile.BIDSname, cfgFile.logFile])
catch
    warning('Saving the log files failed.');
end
    
try
    if cfgEyelink.on
        el_stop(cfgFile)
    end
catch
    warning('Stopping the Eyelink failed');
end

end