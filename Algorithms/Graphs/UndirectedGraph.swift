//
//  UndirectedGraph.swift
//  Algorithms
//
//  Created by Fadey Notchenko on 26.01.2024.
//

import Foundation

enum GraphType {
    case undirected, directed
}

//MARK: Неориентированный граф
class UndirectedGraph {
    
    var graphType: GraphType
    
    var g = [Int: [Int]]()
    
    init(graphType: GraphType) {
        self.graphType = graphType
    }
    
    func addEdge(from source: Int, to dest: Int) {
        if g[source] == nil {
            g[source] = []
        }
        
        g[source]?.append(dest)
        
        if case .undirected = graphType {
            if g[dest] == nil {
                g[dest] = []
            }
            
            g[dest]?.append(source)
        }
    }
    
    func printGraph() {
        for (vertex, edge) in g {
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
            
            if let edges = g[current] {
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
    
    //MARK: Обход в ширину из точки А и до конца
    func bfs(from start: Int) -> [Int] {
        var visited = Set<Int>()
        var queue = [Int]()
        var result = [Int]()
        
        visited.insert(start)
        queue.append(start)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            result.append(current)
            
            if let edges = g[current] {
                for edge in edges.sorted() {
                    if !visited.contains(edge) {
                        visited.insert(edge)
                        
                        queue.append(edge)
                    }
                }
            }
        }
        
        return result
    }
    
    //MARK: Обход в глубину из точки А и до конца
    func dfs(from start: Int) -> [Int] {
        var visited = Set<Int>()
        var stack = [Int]()
        var result = [Int]()
        
        stack.append(start)
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            guard !visited.contains(current) else { continue }
            
            visited.insert(current)
            result.append(current)
            
            if let edges = g[current] {
                for edge in edges {
                    stack.append(edge)
                }
            }
        }
        
        return result
    }
}
