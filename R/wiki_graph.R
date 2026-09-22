#' Wiki graph dataset
#'
#' A graph represented as an edge list, where each row represents
#' an edge from one vertex to another with an associated weight.
#'
#' @format A data frame with 18 rows and 3 variables:
#' \describe{
#'   \item{v1}{The starting vertex of the edge.}
#'   \item{v2}{The destination vertex of the edge.}
#'   \item{w}{The weight of the edge.}
#' }
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Dijkstra's_algorithm}
#'
"wiki_graph"
