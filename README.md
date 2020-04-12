# Awesome-MATLAB [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

既然有时间，为何不写一写好玩的MATLAB程序。正好练习下写`markdown`的水平。:smiley:
>最好的学习方法就是试图去教会别人同样的事情  --导师费曼

---
## 内容
该项目包括以下几个内容

- [ ] 优化方法系列：
  - [x] 遗传算法
  - [ ] 模拟退火
  - [ ] 蚁群算法
- [ ] 机器学习方法：
  - [ ] 主成分分析
  - [ ] 神经网络
- [ ] 物理建模系列：
  - [ ] 三体问题
  - [ ] 元胞自动机 [^1]

---
## 对应的知乎文档
* [遗传算法 GA](https://zhuanlan.zhihu.com/p/115115086)

![](https://huanqiukexue.com/resources/image/20200325/1585099442913539.jpg)

* **MATLAB** 主程序代码
```MATLAB{.line-numbers, highlight=15}
% Run GA
for gen = 1:generation_max

    % Selection
    [dad, mom, elite] = roulette_wheel_selection(population, a, b);

    % Cross-over operator
    new_generation = crossover(dad, mom, elite, pc);

    % Mutation operator
    new_generation = mutation(new_generation, pm);
    population = new_generation;

    % Fitness of current generation
    [rfs, location_idx] = raw_fitness_score(population, a, b);

end
```

---
## 更新计划

| 程序           | 更新日期         | 文件数  |
| ------------- |:-------------:  | -----: |
| 遗传算法        | 04-11-2020     | 6      |
| 模拟退火        | 04-18-2020     |   ？？  |



---
## 参考资料
1.
1.
1.

[^1]: 严格来说，我完全需要单独创立一个项目来研究这个东西。
