# Graph Algorithms

## Resumo

O desafio foi implementado em Ruby e os testes em Minitest.

### Problema 1

O problema 1 foi resolvido com o Algoritmo de Kahn. A entrada esperada é uma Hash, onde cada chave representa um vértice e o valor é o conjunto das arestas de entrada. A entrada do problema é representada da seguinte forma:

``` ruby
{
  0 => Set.new([]),
  1 => Set.new([]),
  2 => Set.new([1]),
  3 => Set.new([0]),
  4 => Set.new([]),
  5 => Set.new([3]),
  6 => Set.new([2, 4, 5]),
  7 => Set.new([5, 6])
}
```

A saída deste problema é:

``` ruby
[0, 1, 4, 3, 2, 5, 6, 7]
```

### Problema 2

O problema 2 foi resolvido com o Algoritmo de Dijkstra. A entrada esperada é uma matriz de adjacência. A entrada do problema é representada da seguinte forma:

``` ruby
[
  [nil, 2, nil, nil, 3, nil, nil, nil],
  [2, nil, nil, 8, nil, 9, 6, nil],
  [nil, nil, nil, nil, nil, 3, 7, nil],
  [nil, 8, nil, nil, nil, nil, nil, 6],
  [3, nil, nil, nil, nil, nil, 5, 9],
  [nil, 9, 3, nil, nil, nil, 4, 5],
  [nil, 6, 7, nil, 5, 4, nil, nil],
  [nil, nil, nil, 6, 9, 5, nil, nil]
]
```

A saída deste problema é:

``` ruby
Vertex, Cost,   Path
1,      2,      0-1
2,      14,     0-1-5-2
3,      10,     0-1-3
4,      3,      0-4
5,      11,     0-1-5
6,      8,      0-1-6
7,      12,     0-4-7
```

## Instruções

### Requisitos
* Ruby 2.5+

### Instalar as Dependências

``` bash
bundle install
```

### Rodar o Projeto

O comando abaixo carrega os algoritmos no IRB:

``` bash
irb -I . -r lib/graph_algorithms
```

Com isso, é possível testar os algoritmos manualmente com novas entradas.

### Rodar os Testes

``` bash
bundle exec rake test
```

### Executar o Problema 1

``` bash
exe/problem_1
```
### Executar o Problema 2

``` bash
exe/problem_2
```
