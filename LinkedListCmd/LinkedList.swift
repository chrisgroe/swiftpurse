import Foundation

enum LinkedListErrors : Error {
    case IndexOutOfRange
}

public class LinkedList<Element>
{
    class Node {
        var data : Element
        var next : Node?
        
        init(data: Element) {
            self.data = data
            self.next = nil
        }
    }
    
    var head : Node?
    
    public init() {
    }
    
    func getTail() -> Node? {
        if head == nil {
            return nil
        }
        
        var currentNode = head
        while (currentNode!.next != nil) {
            currentNode = currentNode!.next
        }
        return currentNode
    }
    
    func getNodeByIndex(idx: Int) -> Node?{
        if head == nil {
            return nil
        }
        assert(idx>=0)
        
        if (idx == 0)
        {
            return head
        }
        var currentNode = head
        var currentIdx = 0
        
        while (currentNode!.next != nil) {
            currentNode = currentNode!.next
            
            if currentNode != nil {
                currentIdx+=1
                
                if idx==currentIdx {
                    return currentNode
                }
            }
            
        }
        
        return nil
    }
    
    subscript(index:Int)  ->  Element? {
        if let node = getNodeByIndex(idx: index)
        {
            return node.data
        }
        return nil
    }
    
    public func append(_ element: Element) {
        // pack in Node
        let node = Node(data: element)
        
        if head == nil {
            head = node
            return
        }
        
        let lastNode = getTail()
        lastNode?.next = node
    }
    
    public func remove(_ idx:Int) throws {
        
        assert(idx>=0)
        if head == nil {
            throw LinkedListErrors.IndexOutOfRange
        }
        
        // special case ... remove head
        if idx == 0 {
            head = head!.next
            return
        }
        
        let prev_idx = idx  - 1 // get previous item
        
        let prev_node = getNodeByIndex(idx: prev_idx)
        
        if prev_node == nil {
            throw LinkedListErrors.IndexOutOfRange
        }
        
        let node = prev_node!.next
        
        assert(node != nil)
        
        // special case ... last node
        if node!.next == nil {
            prev_node!.next = nil;
            return
        }
         
        // replace connection
        prev_node!.next = node!.next
    }
    
    public func printList() {
        if head == nil {
            return
        }
    
        var currentNode = head
        print(currentNode!.data)
        
        while (currentNode!.next != nil) {
            currentNode = currentNode!.next
            
            if currentNode != nil {
                print(currentNode!.data)
            }
        }
    
    }
    
}
