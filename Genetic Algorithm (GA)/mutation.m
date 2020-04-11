function new_generation = mutation(population,pm)
    
    % Read population shape
    [population_size, chromosome_size] = size(population);
    

    new_generation = zeros(population_size, chromosome_size);
    for i = 1:population_size
        mutation_point = randi([1, chromosome_size]);
        
        % pm = probability of mutation
        if rand < pm
            new_generation(i,:) = population(i,:);
            new_generation(i,mutation_point) = ~population(i,mutation_point);
        else
            new_generation(i,:) = population(i,:);
        end
    end
    
end