function selData = sliceSectionData(rawData, selAxis, axisParams)
    selAxis = lower(selAxis);
    if (selAxis == 'x')
        selData = rawData(axisParams, :);
    elseif (selAxis == 'y')
        selData = rawData(:, axisParams);
    end
end
