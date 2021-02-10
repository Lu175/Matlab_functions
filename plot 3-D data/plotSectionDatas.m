function [] = plotSectionDatas(rawData, selAxis, axisParamMatrix, shapeOfLine)
    %% Figure
    figure('name', 'Plotting Sliceed Data');
    
    %% Subplot setting
    % parameters
    [figureNum, ~] = size(axisParamMatrix);
    axisParamNum = zeros(1, figureNum);  % parameters of each figure
    for fig_idx = 1:figureNum
        axisParamNum(fig_idx) = sum(~isnan(axisParamMatrix(fig_idx, :)));
    end
    % subplot size
    subFigNum_ROW = ceil(sqrt(figureNum));
    subFigNum_COL = ceil(figureNum / ceil(sqrt(figureNum)));
    
    %% Plotting
    selAxis = lower(selAxis);
    for fig_idx = 1:figureNum
        if (axisParamNum(fig_idx) == 0)
            continue;
        end
        if (figureNum ~= 1)
            subplot(subFigNum_ROW, subFigNum_COL, fig_idx);  % set subplot idx
        end
        
        legendString = string(1:axisParamNum(fig_idx));  % initialization
        for param_idx = 1:axisParamNum(fig_idx)
            hold on;
            plotData = sliceSectionData(rawData, selAxis, axisParamMatrix(fig_idx, param_idx));  % slicing 3-D plot
            plot(1:length(plotData), plotData, shapeOfLine);  % plotting sliced data
            hold off;

            xlim([1, length(plotData)]);
            legendString(param_idx) = "" + string(selAxis) + " = " + string(axisParamMatrix(fig_idx, param_idx));
            ylabel('z value');
            if (selAxis == 'x')
                xlabel('y value');
            elseif (selAxis == 'y')
                xlabel('x value');
            end
        end
        legend(legendString);
    end
    
end

