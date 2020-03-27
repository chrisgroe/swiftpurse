import Foundation

enum LinkedListErrors : Error {
    case IndexOutOfRange
}



public class LinkedList<Element>
{
    public typealias Index = Int
    
    class Node {
        var data : Element
        var next : Node?
        
        init(data: Element) {
            self.data = data
            self.next = nil
        }
    }
    
    var head : Node?
    
    public var startIndex : Index
    public var endIndex : Index
    
    public init() {
        startIndex = 0
        endIndex = 0
    }

    
    var tail : Node? {
        get {
            if head == nil {
                return nil
            }
            
            var currentNode = head
            while (currentNode!.next != nil) {
                currentNode = currentNode!.next
            }
            return currentNode
        }
    }
    
    func node(at index: Int) -> Node?{
        if head == nil {
            return nil
        }
        assert(index>=0)
        
        if (index == 0)
        {
            return head
        }
        var currentNode = head
        var currentIdx = 0
        
        while (currentNode!.next != nil) {
            currentNode = currentNode!.next
            
            if currentNode != nil {
                currentIdx+=1
                
                if index==currentIdx {
                    return currentNode
                }
            }
            
        }
        
        return nil
    } 
    
    public func append(_ element: Element) {
        // pack in Node
        let node = Node(data: element)
        
        endIndex += 1
        if head == nil {
            head = node
        } else {
            let lastNode = tail
            lastNode?.next = node
        }
    }
    
    public func remove(at index:Int) -> Element{
        
        assert(index>=startIndex)
        assert(index<endIndex)

        
        // special case ... move head
        if index == 0 {
            let oldhead = head
            head = head!.next
            endIndex -= 1
            return oldhead!.data
        }
        
        let prev_idx = index  - 1 // get previous item
        let prev_node = node(at: prev_idx)
        
        
        let node = prev_node!.next
        
        assert(node != nil)
        
        // special case ... last node
        if node!.next == nil {
            endIndex -= 1
            prev_node!.next = nil;
            return node!.data
        } else {
            // replace connection
            prev_node!.next = node!.next
            endIndex -= 1
            return node!.data
        }
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

extension LinkedList : Sequence
{
    public typealias Iterator = LinkedListIterator
    
    public class LinkedListIterator : IteratorProtocol
    {
        var head : Node?
        var current : Node?
        
        internal init(start : Node?, end: Node?) {
            self.head = start
            current = start
        }
        public func next() -> Element? {
            if current == nil {
                return nil
            }
            
            if current === head {
                head = nil
                return current?.data
            }
            
            current = current?.next
            return current?.data
        }
    }
    
    public func makeIterator()->LinkedListIterator {
        return LinkedListIterator(start: head, end:tail)
    }
    
    
}
extension LinkedList : MutableCollection
{
    public func index(after i: Int) -> Int {
        return i+1
    }
    
    public subscript(position: Int) -> Element {
        
        set {
            let node_at = node(at: position)
            node_at!.data = newValue
        }
        get {
            return node(at: position)!.data
        }
    }
}

/*
extension LinkedList {
    
    public class LinkedListSlice {
        var startIndex : Index
        var endIndex : Index
        
        init(startIndex : Index, endIndex:Index) {
            self.startIndex = startIndex
            self.endIndex = endIndex
        }
        

        
    }
    
    public func prefix(through: Index ) -> LinkedListSlice {
        return LinkedListSlice(startIndex: 0, endIndex: through)
    }
    
}*/
