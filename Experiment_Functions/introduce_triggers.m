function  cfgTrigger = introduce_triggers
% cfgTrigger = introduce_triggers
% trigger bits and codes for triggerInit and triggerSend
% uses MEG trigger codes for faces to send to eyelink
% (https://github.com/tghafari/mTBI-predict/wiki/2.1.-MEG-and-Eyetracker-coding-schemes)

% change all on, off, start, end to onset and offset
cfgTrigger.faceHappy = 101;  % onset of face
cfgTrigger.faceAngry = 102;  % onset of face
cfgTrigger.faceNeutral = 103;  % onset of face
cfgTrigger.faceIDHappy = 110 : 109 + (18 * 2);  % there are 18 female and 18 male faces (36 different identities): 2 frames after onset
cfgTrigger.faceIDAngry = 150 : 149 + (18 * 2);  % 2 frames after face onset
cfgTrigger.faceIDNeutral = 190 : 189 + (18 * 2);  % 2 frames after face onset
cfgTrigger.faceMale = 231;  % 4 frames after onset
cfgTrigger.faceFemale = 232;  % 4 frames after onset

end
