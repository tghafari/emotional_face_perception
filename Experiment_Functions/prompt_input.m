function ansr = prompt_input
%ansr = prompt_input
%  returns the details of subject and data collection in ansr struct
%Sub #,MEG PC subjects code, MEG PC date format, training or test, on what
%computer (MEG or Win)
% Subject codes-> T: testing, B: actual data

prompt     = {'Subject Code', 'Session', 'Task', 'Run', 'Train/Task/Test'}; 
dlgtitle   = 'Details';
dims       = [1, 30; 1, 30; 1, 30; 1, 30; 1, 30];
defaultans = {'T101', '01', 'emoface', '01', 'test'};
answer = inputdlg(prompt, dlgtitle, dims, defaultans);
ansr = cell2struct(answer, {'sub', 'ses', 'task', 'run', 'test'}, 1);

end

