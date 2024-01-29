//
//  main.swift
//  study
//
//  Created by Fadey Notchenko on 25.01.2024.
//

import Foundation

test()

func test() {
    let s = Solutions()
    
    let l1 = ListNode(1)
    let l2 = ListNode(2, l1)
    let l3 = ListNode(3, l2)
    let l5 = ListNode(2, l3)
    let l6 = ListNode(1, l5)
    
    s.isPalindrome(l6)
}

//MARK: Функции для тестов
func undirectedGraphTest() {
    let g = UndirectedGraph(graphType: .directed)
    
    g.addEdge(from: 1, to: 2)
    g.addEdge(from: 1, to: 3)
    
    g.printGraph()
    print(g.dfs(from: 1))
}
