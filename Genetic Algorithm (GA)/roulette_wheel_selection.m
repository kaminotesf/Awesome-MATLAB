function  [dad, mom, elite]= roulette_wheel_selection(old_generation, a, b)
    
    % Read population shape
    [population_size, chromosome_size] = size(old_generation);
    
    % Choose the elite
    rfs = [];
    [rfs, ~] = raw_fitness_score(old_generation, a, b);  
    [elite_rfs, elite_idx] = max(rfs);
    elite = old_generation(elite_idx,:);
    
    % Clean elite information
    old_generation(elite_idx,:)= [];
    rfs(elite_idx) = [];
    
    % Normalize the fitness score
    if any(rfs < 0) 
        % Fitness scaling in case of negative values scaled(f) = a * f + b
        a = 1;
        b = abs(min(rfs));
        Scaled_fitness = a.*rfs + b;
        normalized_fitness = Scaled_fitness./sum(Scaled_fitness);
    else
        normalized_fitness = rfs./sum(rfs);
    end
    prob_wheel = cumsum(normalized_fitness);
    
    % Choose dad
    dad = [];
    for i = 1:population_size - 1
        for j = 1:population_size - 1
            rand_num1 = rand;
                if rand_num1 <= prob_wheel(j)
                    dad(i,:) = old_generation(j,:);
                    break
                end
        end
    end
    
    % Choose mom
    mom = [];
    for i = 1:population_size - 1
        for j = 1:population_size - 1
            rand_num2 = rand;
                if rand_num2 <= prob_wheel(j)
                    mom(i,:) = old_generation(j,:);
                    break
                end
        end
    end
                    
end