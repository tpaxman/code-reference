%% Comparison of static string concatenation with column of numbers:

regexprep(cellstr(num2str(GC.fluid)), '(\d+)', ['fluid' '$1'])               % Fastest (0.3 s)

strcat(cellstr(repmat('fluid',height(GC),1)), cellstr(num2str(GC.fluid)))    % Slightly (0.4 s)

cellfun(@(x) strcat('fluid', x), cellstr(num2str(GC.fluid)), 'uni', 0)       % Very slow (1.4 s)