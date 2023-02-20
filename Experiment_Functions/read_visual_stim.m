function cfgStim = read_visual_stim(cfgFile, cfgStim, cfgExp)
% cfgStim = read_visual_stim(cfgFile, cfgStim)
% reads face images into cfgStim struct and
% randomises them for presentation

% store images in visStim matrix: 1->images, 2->sex  4->morph level 
% 3->id 

visStim(:,4) = num2cell(num2str(repmat(1:cfgExp.morphLev, 1, cfgExp.numStim/cfgExp.morphLev)'));
visStim(:,3) = num2cell(repmat(1:cfgExp.numImg, 1, cfgExp.numStim/cfgExp.numImg)'); 
visStim = sortrows(visStim, [3, 4]);
visStim(:,2) = [repmat({'f'}, length(visStim) / 2, 1); repmat({'m'}, length(visStim) / 2, 1)];
for ii = 1: length(visStim) 
    if cell2mat(visStim(ii,3)) < 10; visStim{ii,3} = ['0' num2str(visStim{ii,3})]; 
    else; visStim{ii,3} = num2str(visStim{ii,3}); visStim{ii,4} = num2str(visStim{ii,4});
    end
end

fileDirStim = dir([cfgFile.stim, '*.png']);
test={};
for ii = 1:length(visStim)
    for fl = 1:length(fileDirStim)  % put the files in the visStim matrix based on their file names
        if contains(fileDirStim(fl).name, visStim(ii,2) ,'IgnoreCase', true) && ...
                contains(fileDirStim(fl).name, visStim(ii,3)) && ...
                contains(fileDirStim(fl).name(6:end), visStim(ii,4))
            test={test;sprintf('correct %d',fl)};
            visStim{ii} = imread(fileDirStim(fl).name);
        end
    end
end

rng('shuffle')  % randomize face stimuli 
cfgStim.visStim = visStim;
cfgStim.visStim = visStim(randperm(length(cfgStim.visStim)),:);

end