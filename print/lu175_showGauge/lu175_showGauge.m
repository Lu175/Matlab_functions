%% Lu175
% Show Process Gauge Bar
%% How to use this function
% past_gauge = 101;
% for i = 1: N
%     past_gauge = lu175_showGauge(i, N, past_gauge);
%     %__________________________________________________
%     % target of measurement
%     %__________________________________________________
% end

%% Function
function current_gage = lu175_showGauge(i, N, past_gauge)
    gauge = floor( (i/N)*100 );    % 백분율 (소수점 자름)
    if (gauge ~= past_gauge)
        clc;
        past_gauge = gauge;
        fprintf('\n\tProcess Gauge : %3d%% [', gauge);
        for j = 1: gauge
            fprintf('%c', '#');    % Done
        end
        for k = 1: 100-gauge
            fprintf('%c', '*');    % Rest
        end
        fprintf(']\n');
    end
    
    current_gage = gauge;
end
