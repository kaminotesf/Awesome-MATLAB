function new_generation = crossover(dad, mom, elite, pc)

    % Read population shape
    [population_size, chromosome_size] = size(dad);
    
    new_generation = [];
    for i = 1:population_size
        rand_num = rand;
        % pc = probability of performing crossover
        if rand_num < pc
            % Generate an random integer as cross-over point
            cross_point = randi([1, chromosome_size-1]);
            new_generation(i,:) = [dad(i,1:cross_point), mom(i,cross_point+1:end)];
        else
            new_generation(i,:) = dad(i,:);
        end
    end
    
    % Add elite individual back
    new_generation = [new_generation; elite];
    
    
end