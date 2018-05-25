%% Arrays
  Cellfun to replace loop
	fileNames = {'f1.txt', 'f2.txt', 'f3.txt'};

  
%% Cellfun
  figure(1); hold on;
  tb = cellfun( @(x) readtable(x, 'Delimiter', '\t', 'ReadVariableNames', true), fileNames, 'uniformoutput', false);
  cellfun( @(x) plot(x.flowRate, x.pDrop, '-o'), tb, 'uniformoutput', false);

%% for-loop
figure(2); hold on;
for j = 1:length(fileNames)
   x = readtable(fileNames{j}, 'Delimiter', '\t', 'ReadVariableNames', true);
   plot(x.flowRate, x.pDrop, '-o')
end

%% Cell array of numbers to array
  cellfun(@(x) sum(min(strfind(x, 'aaa'))), stringCell)
  
%% Accumarray
  tbCriteria = tbRaw(:, criteriaNames);
  [tbUnique, ~, subs] = unique(tbCriteria, 'rows', 'sorted');
  pDropMean = accumarray(subs, tbRaw.pDrop, [], @mean);
  tbFinal = table(tbUnique, pDropMean);
  % (NB: I made a function for this: “accumtable”)