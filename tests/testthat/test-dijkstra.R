library(testthat)

test_that("dijkstra calculates shortest distances correctly", {
  graph <- data.frame(
    v1 = c(1, 1, 2, 2, 3),
    v2 = c(2, 3, 3, 4, 4),
    w = c(4, 2, 1, 5, 3)
  )

  expect_equal(dijkstra(graph, 1), c(0, 4, 2, 5))
})


test_that("dijkstra handles disconnected vertices", {
  graph <- data.frame(
    v1 = c(1, 2, 4),
    v2 = c(2, 3, 5),
    w = c(2, 3, 1)
  )

  expect_equal(dijkstra(graph, 1), c(0, 2, Inf, 5, Inf))
})


test_that("dijkstra rejects a non-data-frame graph", {
  graph <- matrix(c(1, 2, 3), nrow = 1)

  expect_error(
    dijkstra(graph, 1),
    "graph must be data frame"
  )
})


test_that("dijkstra rejects a graph without v1, v2, and w", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3)
  )

  expect_error(
    dijkstra(graph, 1),
    "graph must contain v1,v2,w"
  )
})


test_that("dijkstra rejects non-numeric weights", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c("1", "2")
  )

  expect_error(
    dijkstra(graph, 1),
    "w must be numeric, non-missing, and non-negative"
  )
})


test_that("dijkstra rejects missing weights", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c(1, NA)
  )

  expect_error(
    dijkstra(graph, 1),
    "w must be numeric, non-missing, and non-negative"
  )
})


test_that("dijkstra rejects negative weights", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c(1, -2)
  )

  expect_error(
    dijkstra(graph, 1),
    "w must be numeric, non-missing, and non-negative"
  )
})


test_that("dijkstra rejects a non-numeric initial vertex", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c(1, 2)
  )

  expect_error(
    dijkstra(graph, "1"),
    "init must be a numeric scalar that exists in the graph"
  )
})


test_that("dijkstra rejects a non-scalar initial vertex", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c(1, 2)
  )

  expect_error(
    dijkstra(graph, c(1, 2)),
    "init must be a numeric scalar that exists in the graph"
  )
})


test_that("dijkstra rejects an initial vertex not in the graph", {
  graph <- data.frame(
    v1 = c(1, 2),
    v2 = c(2, 3),
    w = c(1, 2)
  )

  expect_error(
    dijkstra(graph, 10),
    "init must be a numeric scalar that exists in the graph"
  )
})


test_that("dijkstra works with wiki_graph", {
  data(wiki_graph)

  result <- dijkstra(wiki_graph, wiki_graph$v1[1])

  expect_type(result, "double")
  expect_length(result, length(unique(c(wiki_graph$v1, wiki_graph$v2))))
  expect_equal(result[match(wiki_graph$v1[1],
                            unique(c(wiki_graph$v1, wiki_graph$v2)))], 0)
})

