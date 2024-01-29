//
//  TwoSum.swift
//  Algorithms
//
//  Created by Fadey Notchenko on 29.01.2024.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func printNode() {
        var current: ListNode? = self
        
        while let node = current {
            print(node.val, terminator: " -> ")
            current = node.next
        }
        
        print("nil")
    }
}

class Solutions {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head
        var slow = head
        var fast = head?.next
        
        // 1
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        // 2
        slow = reverseList2(slow?.next)
        
        // 3
        while slow != nil {
            guard head?.val == slow?.val else { return false }
            
            head = head?.next
            slow = slow?.next
        }
        
        return true
    }
    
    //MARK: Рекурсивный подход
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let current = head, let next = current.next else { return head }
        
        let rec = reverseList(next)
        
        current.next = nil
        next.next = current
        
        return rec
    }
    
    //MARK: Нерекурсивный подход
    func reverseList2(_ head: ListNode?) -> ListNode? {
        var current = head
        var prev: ListNode? = nil
        
        while current != nil {
            let nextNode = current?.next
            current?.next = prev
            prev = current
            current = nextNode
        }
        
        return prev
    }
    
    //MARK: Два указателя
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var l = 0
        var r = nums.count - 1
        let s = nums.sorted()
        
        while l < r {
            let sum = s[l] + s[r]
            
            if sum == target, let i1 = nums.firstIndex(of: s[l]), let i2 = nums.lastIndex(of: s[r]) {
                return [i1, i2]
            } else if sum < target {
                l += 1
            } else {
                r -= 1
            }
        }
        
        return []
    }
}
