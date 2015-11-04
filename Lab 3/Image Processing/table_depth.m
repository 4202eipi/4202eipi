function [depth] = table_depth(img)

randomRows = randi(size(img,2), 1, 50);
temp = size(randomRows);
avg = zeros(temp(2),1);
for rowIndex = 1:temp(2);
    sam = datasample(img(:,randomRows(rowIndex)), 50, 'Replace',false);
    avg(rowIndex) = mean(sam);
end
depth = mean(avg);
% sz = size(img);
% depth = mean([img(1,1),img(1,sz(2)),img(sz(1),sz(2)),img(sz(1),1)]);
end


