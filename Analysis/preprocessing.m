% add the emotion of pressed keys

for ii = 1:length(cfgOutput.keyName)
    if strcmp(cfgOutput.keyName{ii,1}, 'RightShift')
        cfgOutput.keyName{ii,2} = '9';  % for this participant right shift is happy(morph level = 9)
    elseif strcmp(cfgOutput.keyName{ii,1}, 'LeftShift')
        cfgOutput.keyName{ii,2} = '1'; % for this participant left shift is sad(morph level = 1)
    end
end

% put results into one cell then convert to table(for later stats)
 analysisMat = [str2double(cfgOutput.keyName(:,2)), str2double(cfgStim.visStim(:,4))];
 analysisTbl = array2table(analysisCell, 'VariableNames', {'response','morph_level'});

 % calculate mean and std of responses to each morph level
M = grpstats(analysisTbl,"morph_level",["mean","nanstd"]);

% plot
plot(unique(sort(analysisTbl.morph_level)),M.mean_response)

% prepare data for fitting
YData = str2double(cfgOutput.keyName(:,2));
XData = str2double(cfgStim.visStim(:,4));