function timepoint = send_trigger(cfgEyelink, eyelinkMsg)
% timepoint = send_trigger(cfgEyelink, eyelinkMsg)
% eyelinkMsg includes the message you want to send to eyelink as
% trigger

if cfgEyelink.on == 1
      Eyelink('Message', eyelinkMsg)
end

timepoint = GetSecs;  % get the time point of interest

end 