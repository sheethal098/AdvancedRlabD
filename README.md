# AdvancedRlabD

**Algorithms for Advanced R**

`AdvancedRlabD` is an R package implementing classic graph and number-theoretic algorithms. It provides:

- The **Euclidean algorithm** for computing the greatest common divisor (GCD) of two integers.
- **Dijkstra's algorithm** for finding the shortest paths from a starting node in a weighted graph.
- A sample **weighted graph dataset** for testing and demonstrating the graph algorithm.

This package was developed as part of the Advanced Programming in R course at Linköping University (LiU).

## Installation

You can install the development version of `AdvancedRlabD` from GitHub using `devtools`:

```r
# install.packages("devtools")
devtools::install_github("sheethal098/AdvancedRlabD")
```

## Usage

```r
library(AdvancedRlabD)

# Euclidean algorithm: greatest common divisor
euclidean(56, 98)
#> 14

# Dijkstra's algorithm: shortest paths from a source node
# using the bundled weighted graph dataset
dijkstra(wiki_graph, 1)
```

### `euclidean(x, y)`

Computes the greatest common divisor of two numbers `x` and `y` using the Euclidean algorithm.

**Arguments**

| Argument | Description         |
|----------|----------------------|
| `x`      | First number (numeric) |
| `y`      | Second number (numeric) |

**Returns:** the greatest common divisor of `x` and `y`.

### `dijkstra(graph, init_node)`

Finds the shortest path from a given start node to every other node in a weighted graph, using Dijkstra's algorithm.

**Arguments**

| Argument    | Description                                                                 |
|-------------|-------------------------------------------------------------------------------|
| `graph`     | A `data.frame` representing a weighted graph, with columns for the two connected nodes and the edge weight |
| `init_node` | The starting node from which shortest paths are calculated                    |

**Returns:** a vector of shortest distances from `init_node` to every node in the graph.

### Dataset: `wiki_graph`

A small example weighted graph (based on the graph used in Wikipedia's illustration of Dijkstra's algorithm), included with the package for testing and examples.

```r
data(wiki_graph)
head(wiki_graph)
```

## Testing

Unit tests are written with [`testthat`](https://testthat.r-lib.org/) and can be run with:

```r
devtools::test()
```

## Documentation

The full package documentation, including an overview of all functions and datasets, is available via:
 
```r
?AdvancedRlabD
```

The function-level documentation is available via:

```r
?euclidean
?dijkstra
?wiki_graph
```

## Authors

- Mariam Yayloyan
- Sheethal Lakshmana

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Issues

Found a bug or have a feature request? Please open an issue on the [GitHub issue tracker](https://github.com/sheethal098/AdvancedRlabD/issues).
