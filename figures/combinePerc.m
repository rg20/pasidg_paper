function combinePerc(h, str)

hText = findobj(h, 'Type', 'text');
percentValues = get(hText, 'String');

combinedStrings = strcat(str, percentValues);

oldExtents_cell = get(hText, 'Extent');
oldExtents = cell2mat(oldExtents_cell);

set(hText, {'String'}, combinedStrings);

newExtents_cell = get(hText, 'Extent');
newExtents = cell2mat(newExtents_cell);
width_change = newExtents(:,3) - oldExtents(:,3);

signValues = sign(oldExtents(:,1));
offset = signValues.*(width_change/2);

textPositions_cell = get(hText, {'Position'});
textPositions = cell2mat(textPositions_cell);
textPositions(:,1) = textPositions(:,1)+offset;

for i=1:length(percentValues)
    htext(i).Position = textPositions(i,:);
end
%set(hText, 'Position', num2cell(textPositions, [3,2]));
set(hText, 'FontSize', 18);