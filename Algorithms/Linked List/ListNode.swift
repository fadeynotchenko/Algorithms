//
//  ListNode.swift
//  Algorithms
//
//  Created by Fadey Notchenko on 29.01.2024.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0; self.next = nil;
    }
    
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
    
    func printNode() {
        var current: ListNode? = self
        
        while let node = current {
            print(node.val, terminator: " -> ")
            current = node.next
        }
        
        print("nil")
    }
}
