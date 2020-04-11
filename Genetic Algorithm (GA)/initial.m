function population = initial(population_size, chromosome_size)
        
    for i = 1:population_size
        for j = 1:chromosome_size
            population(i,j) = round(rand);  
        end
    end
    
end