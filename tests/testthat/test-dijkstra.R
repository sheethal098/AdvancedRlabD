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


#from course github

wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))

test_that("outputs are correct in the Dijkstra algorithm.", {
  expect_equal(dijkstra(wiki_graph,1), c(0,7,9,20,20,11))
  expect_equal(dijkstra(wiki_graph,3), c(9,10,0,11,11,2))
})


test_that("Error messages are returned for erronous input in the Dijkstra algorithm.", {
  wiki_wrong_graph <- wiki_graph
  names(wiki_wrong_graph) <- c("v1, v3, w")
  expect_error(dijkstra(wiki_wrong_graph, 3))
  wiki_wrong_graph <- wiki_graph[1:2]
  expect_error(dijkstra(wiki_wrong_graph, 3))
  expect_error(dijkstra(wiki_graph, 7))
  expect_error(dijkstra(as.matrix(wiki_graph), 3))
})
