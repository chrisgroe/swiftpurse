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
    
    func next(_ node : Node?) -> Node? {
        node?.next
    }
    
    func prev(_ node : Node?) -> Node? {
        var nextNode = next(head)
        
        while (nextNode != nil) {
            if nextNode === node {
                return node
            }
            
            nextNode = next(nextNode)
        }
        return nil
    }
    
    func node(at index: Int) -> Node? {
        if (index >= startIndex) && (index<endIndex)
        {
            // special case
            if (index == 0) {
                return head
            }
            
            var next_node = next(head)
            var currentIdx = 1
            
            while (next_node != nil) {
                if index==currentIdx {
                    return next_node
                }
                next_node = next(next_node)
                currentIdx+=1
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
    
    func insert(_ newElement:Element, at index:Int ) {
        
        assert(index>=startIndex)
        
        
        // insert at start when collection is empty
        if count == 0 && index == startIndex {
            append(newElement)
            return
        }
        
        assert(count>0) // collection not empty
        
        
         let new_node = Node(data: newElement)
        
        
        // special case ... move head
        if index == 0 {
            let oldhead = head
            head = new_node
            head!.next = oldhead
            endIndex += 1
            return
        }
        
        assert(index < (endIndex + 1))
        
        let prev_idx = index  - 1 // get previous item index
        let prev_node = node(at: prev_idx)
        
        assert(prev_node != nil)
        
       
        // insert at end
        if index==endIndex {
            
            prev_node?.next = new_node
            endIndex += 1
        } else {
            assert(index<endIndex)
            
            let node = next(prev_node)
            
            
            assert(node != nil)
            
            prev_node?.next = new_node
            new_node.next = node
            endIndex += 1
        }
    }
    
    @discardableResult public func remove(at index:Int) -> Element {
        assert(count>0) // collection not empty
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
        let node = next(prev_node)
        
        assert(prev_node != nil)
        assert(node != nil)
        
        // special case ... last node
        if node!.next == nil {
            prev_node!.next = nil;
        }
        else
        {
            // replace connection
            prev_node!.next = node!.next
        }
        endIndex -= 1
        return node!.data
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
