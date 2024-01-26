//
//  UndirectedGraph.swift
//  Algorithms
//
//  Created by Fadey Notchenko on 26.01.2024.
//

import Foundation

//MARK: Неориентированный граф
class UndirectedGraph {
    var arr = [Int: [Int]]()
    
    func addVertex(vertex: Int) {
        if arr[vertex] == nil {
            arr[vertex] = []
        }
    }
    
    func addEdge(from source: Int, to dest: Int) {
        arr[source]?.append(dest)
        arr[dest]?.append(source)
    }
    
    func printGraph() {
        for (vertex, edge) in arr {
            print("\(vertex) -> \(edge)")
        }
    }
    
    //MARK: Обход в ширину из точки А в точку B
    func bfs(from start: Int, to dest: Int) -> [Int]? {
        var visited = Set<Int>()
        var queue = [(Int, [Int])]()
        
        visited.insert(start)
        queue.append((start, [start]))
        
        while !queue.isEmpty {
            let (current, path) = queue.removeFirst()
            
            if current == dest {
                return path
            }
            
            if let edges = arr[current] {
                for edge in edges.sorted() {
                    if !visited.contains(edge) {
                        visited.insert(edge)
                        
                        queue.append((edge, path + [edge]))
                    }
                }
            }
        }
        
        return nil
    }
}
