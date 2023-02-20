function [cfgExp, cfgOutput] = initialise_exp_variables(cfgExp)
% [cfgExp, cfgOutput] = initialise_exp_variables(cfgExp)
% Introduces variables of interest for SpAtt task
% to change any repetition you should edit this function

rng('shuffle')
% total time: ~35 minute 
cfgExp.numBlock = 6;  % total number of blocks (6)
cfgExp.numRep = 4;  % number of repetitions of each specific visual stimuli (4)
cfgExp.morphLev = 9;  % number of morph levels between happy and angry (9)
cfgExp.numImg = 22;  % number of face images for both genders and each morph level (22)
cfgExp.numTrial = cfgExp.numImg * cfgExp.numRep * cfgExp.morphLev / cfgExp.numBlock;  % number of trials in each block (2 for gender)
cfgExp.numStim = cfgExp.numTrial * cfgExp.numBlock;  % number of stimuli/trials in total
cfgExp.ISIDur = 750 + (1000 - 750) .* rand(cfgExp.numStim, 1);  % interval between two images in ms (fixation dot duration)
cfgExp.stimDur = 750 + (1000 - 750) .* rand(cfgExp.numStim, 1);  % duration of face presentation in ms  
cfgExp.numQu = ceil(0.95 * cfgExp.numStim);  % 95% of trials include a question about the gender of the face
cfgExp.quesPres = [ones(cfgExp.numQu, 1); zeros(cfgExp.numStim - cfgExp.numQu, 1)];  % 1=>question present 0=>no question
cfgExp.quesPres = cfgExp.quesPres(randperm(length(cfgExp.quesPres)));  % randomize order of question trials
cfgExp.quesDur = 750 + (1000 - 750) .* rand(cfgExp.numStim, 1);  % duration of question display in ms
cfgExp.respTimOut = 1500;  % time during which subject can respond in ms

cfgOutput.keyName = cell(cfgExp.numStim, 1);  % preallocate cfgOutput for unpressed trials
cfgOutput.keyName = repmat({'no resp'}, length(cfgOutput.keyName), 1);  % put the default response to 'no resp'

if strcmp(cfgExp.answer.test,'task'), cfgExp.task = 1; else, cfgExp.task = 0; end  % are we collecting data and running the task?
if strcmp(cfgExp.answer.test,'train'), cfgExp.train = 1; else, cfgExp.train = 0; end  % are we training the participant?

end

% generate N random numbers in the interval (a,b): r = a + (b-a).*rand(N,1).