function result = GA_main()
    
    % Basic set up
    clear all; clc;
    a = 3; b = 9;
    my_eps = 1e-4;
    
    % Hyper-parameter
    pc = 0.9; pm = 0.1;
    population_size = 100;
    chromosome_size = ceil(log2((b-a)/my_eps+1));
    generation_max = 200;
    
    % Initialize the popuation
    population = initial(population_size, chromosome_size);
    
    % Visualize the first generation
    x = linspace(a,b,1e3);
    f = sqrt(x) + 5*sin(x.^2) + 3*cos(4.*x);  
    plot(x,f)
    hold on; grid on;
    xlabel("x"); ylabel("f(x)");
    [rfs1, location_idx1] = raw_fitness_score(population, a, b);
    scatter(location_idx1, rfs1,'b*')
    
    
    % Run GA
    for gen = 1:generation_max
        
        % Selection
        [dad, mom, elite] = roulette_wheel_selection(population, a, b);
        
        % Cross-over operator
        new_generation = crossover(dad, mom, elite, pc);
        
        % Mutation operator
        new_generation = mutation(new_generation,pm);
        population = new_generation;
        
        % Fitness of current generation
        [rfs, location_idx] = raw_fitness_score(population, a, b);
        
    end
    
    scatter(location_idx, rfs,'r*')
    result = max(rfs);
    disp(['best_max = ', num2str(max(rfs))])
    disp(['exact_max = ', num2str(max(f))])


end