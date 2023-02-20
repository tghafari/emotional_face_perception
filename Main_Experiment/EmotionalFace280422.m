%% Basic Setup
PsychJavaTrouble; clear; close all; sca; fclose('all');  % this should be outside of function, otherwise might not work!
cfgEyelink = basic_setup_experiment;  % basic PTB setup and clearing up
%% Input and OS folder preparations

cfgExp.answer = prompt_input;
cfgFile = create_file_directory(cfgExp);
%% Make variables and read in images

[cfgExp, cfgOutput] = initialise_exp_variables(cfgExp);  % introduce experiment variables
cfgStim = initialise_stim_variables;
cfgStim = read_visual_stim(cfgFile, cfgStim, cfgExp);  % randomly read visual stimuli for all trials
cfgScreen = initialise_screen_variables(cfgExp);  % introduce visual variables
cfgTxt = txt_collection;  % collection of all texts
%% Screen Setup

[cfgScreen.window, cfgScreen.windowRect] = PsychImaging('OpenWindow', cfgScreen.scrNum, cfgScreen.backgroundColor, cfgScreen.fullScrn);  % open an on screen window and color it gray
cfgScreen = basic_setup_screen(cfgScreen);
cfgEyelink = initialise_eyelink(cfgFile, cfgEyelink, cfgScreen);  % initialise eyelink
%% Visual stimulus and fixation cross characteristics and hardware timing

cfgScreen = fix_dot_properties(cfgScreen);  % characteristics of fixation dot
cfgExp = time2frame(cfgExp, cfgScreen);  % time and frame conversions
cfgStim = visual_stim_properties(cfgScreen, cfgStim);  % destination rectangle to present the stimulus
presentingStr = make_texture_images(cfgScreen, cfgStim, cfgExp);  % make texture for visual stim and cue
%% Main Experiment

cfgExp = KbQueue_start_routine(cfgExp);  % start KbQueue routine
cfgScreen.vbl = Screen('Flip',cfgScreen.window);  % get the first VBL
cfgOutput.vbl = cfgScreen.vbl;  % put first vbl into cfgOutput as well
cfgOutput = draw_myText(cfgScreen, cfgExp, cfgTxt.startTxt, cfgTxt, cfgOutput, cfgFile, cfgEyelink, cfgStim);

nstim = 0;  % count number of stimuli in total
for blk = 1:cfgExp.numBlock
    cfgOutput.blkStrtTmPnt(blk) = send_trigger(cfgEyelink, sprintf('block n. %d', blk));
    WaitSecs(0.003)  % wait for triggers to reset

    for trl = 1:cfgExp.numTrial
        nstim = nstim + 1;  % count stims presented in total
        cfgOutput.trlStrtTmPnt(nstim) = send_trigger(cfgEyelink, 'trial start');

        % beginig of blocks fixation dot
        if trl == 1
        display_fixation_dot(cfgScreen, cfgExp, nstim);
        end
                
        % ISI with fixation dot presentation
        display_fixation_dot(cfgScreen, cfgExp, nstim);  
        
        % present visual stimulus with/without red flash dot
        cfgOutput = display_visual_stim(presentingStr, nstim, cfgScreen, cfgExp, cfgOutput, cfgStim, cfgEyelink);
        
        if cfgExp.quesPres(nstim)
        % questions presentation
        cfgOutput = display_question(cfgTxt, nstim, cfgScreen, cfgExp, cfgOutput, cfgEyelink);
        
        % listen for a response
        cfgOutput = response_collector(cfgExp, cfgOutput, nstim, cfgTxt, cfgScreen, cfgFile, cfgEyelink, cfgStim);
        end
    end
    
    cfgOutput = calculate_show_feedback(cfgOutput, cfgExp, nstim, blk, cfgScreen, cfgEyelink);
    if blk ~= cfgExp.numBlock
        cfgOutput = draw_myText(cfgScreen, cfgExp, cfgTxt.breakTxt, cfgTxt, cfgOutput, cfgFile, cfgEyelink, cfgStim);
    end
end

cfgOutput = draw_myText(cfgScreen, cfgExp, cfgTxt.endTxt, cfgTxt, cfgOutput, cfgFile, cfgEyelink, cfgStim);
cfgOutput = cleanup(cfgFile, cfgExp, cfgScreen, cfgEyelink, cfgOutput, cfgTxt, cfgStim);
