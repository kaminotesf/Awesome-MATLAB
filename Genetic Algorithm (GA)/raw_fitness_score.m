function  [rfs, location_idx] = raw_fitness_score(population, a, b)

    % [a,b] stands for upper and lower bound   
    [population_size, chromosome_size] = size(population);
    
    % Clear rfs from the last generation 
    location_idx = zeros(population_size,1);
    rfs = zeros(population_size,1);

    
    for i = 1:population_size
        for j = 1:chromosome_size
            
            % Decode each chromosome into it's decimal value
            if population(i,j) == 1
                location_idx(i) = location_idx(i) + 2^(j-1);    
            end        
        end
        
        % Map the decimal value to the range of interest [a,b]
        location_idx(i) = a + location_idx(i)*(b-a)/(2^chromosome_size-1); 
        
        % Calculate the fitness score f(x_i) and assemble in a column
        rfs(i) = sqrt(location_idx(i)) + 5*sin(location_idx(i).^2) + 3*cos(4*location_idx(i));  
    end

end