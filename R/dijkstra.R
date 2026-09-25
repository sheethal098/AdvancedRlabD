#' Calculate shortest paths using Dijkstra's algorithm
#'
#' @param graph A data frame containing the graph edges with variables
#'   v1, v2, and w, where v1 is the starting vertex, v2 is the destination
#'   vertex, and w is the edge weight.
#' @param init A numeric scalar specifying the initial vertex.
#'
#' The algorithm calculates the shortest path from the initial vertex
#' to every other vertex in the graph.
#'
#' @return A numeric vector containing the shortest path from the initial
#' vertex to every other vertex.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Dijkstra's_algorithm}
#'
#' wiki_graph.R



dijkstra<-function(graph,init){   #init,The node where Dijkstra starts
  if(!is.data.frame(graph))
    stop("graph must be data frame")
  if(!all(c("v1","v2","w") %in% names(graph)))  #all is used to show all the validations r true or not)
    stop("graph must contain v1,v2,w")
  if(!is.numeric(init)||length(init) !=1|| !init %in% c(graph$v1,graph$v2))
     stop("init must be a numeric scalar that exists in the graph")
  nodes<-unique(c(graph$v1,graph$v2))  #unique removes the duplicates
  distance<-rep(Inf,length(nodes))  #rep() means it repeats the inf as its our initial weight
  distance[nodes == init]<-0
  visited<-c()
  neighbors<- graph[graph$v1 ==init,] # we want only v1 rows n all columns
  new_distance <- distance[nodes == init] + neighbors$w
  new_positions <- match(neighbors$v2, nodes)
  distance[new_positions] <- new_distance
  visited<-c(visited,init)
  while(length(visited)<length(nodes)){
    unvisited<-setdiff(nodes,visited)
    unvisited_distance<-distance[match(unvisited,nodes)]
    current<-unvisited[which.min(unvisited_distance)]
    neighbors<-graph[graph$v1 == current,]
    new_distance<- distance[nodes == current ]+neighbors$w
    new_positions <-match(neighbors$v2,nodes)
    shorter_distance <- pmin(  #pmin() gives the pair wise min distance
      distance[new_positions],
      new_distance
    )
    distance[new_positions] <- shorter_distance
    visited <- c(visited, current)
  }
  return(distance)
}

