//
//  main.swift
//  study
//
//  Created by Fadey Notchenko on 25.01.2024.
//

import Foundation

func undirectedGraphTest() {
    let g = UndirectedGraph()
    g.addVertex(vertex: 1)
    g.addVertex(vertex: 2)
    g.addVertex(vertex: 3)
    g.addVertex(vertex: 4)
    
    g.addEdge(from: 1, to: 2)
    g.addEdge(from: 2, to: 3)
    g.addEdge(from: 2, to: 4)
    g.addEdge(from: 3, to: 4)
    
    if let result = g.bfs(from: 4, to: 1) {
        print(result)
    } else {
        print("nil")
    }
}

undirectedGraphTest()
