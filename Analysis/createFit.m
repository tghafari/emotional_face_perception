function [fitresult, gof, PSE] = createFit(xData, yData)
%CREATEFIT(XDATA,YDATA)
%  Create a fit.
%
%  Data for 'psychometric function' fit:
%      X Input : xData
%      Y Output: yData
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%      PSE : Point of Subjective Equality
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 15-Feb-2023 12:26:25


%% Fit: 'untitled fit 1'.
[xData_1, yData_1] = prepareCurveData( xData, yData );

% Set up fittype and options.
ft = fittype( 'smoothingspline');

% Fit model to data.
[fitresult, gof] = fit( xData_1, yData_1, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'Psychometric Function-Male' );
h = plot( fitresult, xData_1, yData_1 );
legend( h, 'yData vs. xData', 'Psychometric Function-Male', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'xData', 'Interpreter', 'none' );
ylabel( 'yData', 'Interpreter', 'none' );
grid on

PSE = h(2).YData(h(2).XData == 5);
