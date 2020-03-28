import Foundation

/// Generic singly linked list implementation
///
/// This class can be used like an Array. It implements all major protocols an Array implements.
/// For more information, see [Linked List - Wikipedia](https://en.wikipedia.org/wiki/Linked_list)
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
    
    /// The position of the first element in a nonempty array.
    public var startIndex : Index  = 0
    
    /// The array’s “past the end” position—that is, the position one greater than the last valid subscript argument.
    public var endIndex : Index = 0
    
    required public init() {
    }
    
    required public init<S>(_ s: S) where Element == S.Element, S : Sequence {
        // exhaust sequence
        for i in s {
            append(i)
        }
    }
    
    required public init(repeating repeatedValue: Element, count: Int) {
        for _ in 0..<count {
            append(repeatedValue)
        }
    }
    
    /// The first element of the LinkedList.
    ///
    /// Is nil when the LinkedList  is empty.
    var first : Element? {
        head?.data
    }

    
    /// The last node in the collection
    ///
    /// Is nil when the LinkedList is empty.
    var tail : Node? {
        get {
            if head == nil {
                return nil
            }
            
            var currentNode = head
            while (hasNext(currentNode)) {
                currentNode = next(currentNode)
            }
            return currentNode
        }
    }
    
    /// The last element of the LinkedList.
    ///
    /// Is nil  the LinkedList is empty.
    var last : Element? {
        tail?.data
    }
    
    func next(_ node : Node?) -> Node? {
        node?.next
    }
    
    func hasNext(_ node : Node?) -> Bool {
        next(node) != nil
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
    
    /// Adds a new element at the end of the LinkedList.
    /// - Parameters:
    ///     - newElement: The element to append to the LinkedList.
    public func append(_ newElement: Element) {
        // pack in Node
        let node = Node(data: newElement)
        
        endIndex += 1
        if head == nil {
            head = node
        } else {
            let lastNode = tail
            lastNode?.next = node
        }
    }
    
    /// Inserts a new element at the specified position.
    /// - Parameters:
    ///     - newElement: The element to insert into the LinkedList.
    ///     - index : The position at which to insert the new element.
    public func insert(_ newElement:Element, at index:Int ) {
        
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
    
    /// Removes and returns the element at the specified position.
    /// - Parameters:
    ///     - index: The position of the element to remove.
    /// - Returns: The element at the specified index.
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

// MARK: - Sequence Protocol
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

// MARK: - MutableCollection Protocol
extension LinkedList : MutableCollection
{
    public func index(after i: Int) -> Int {
        i+1
    }
    
    public subscript(position: Int) -> Element {
        
        set {
            let node_at = node(at: position)
            node_at!.data = newValue
        }
        get {
            node(at: position)!.data
        }
    }
}

// MARK: Operators
extension LinkedList {
    
    public static func + (lhs: LinkedList<Element>, rhs: LinkedList<Element>) -> LinkedList<Element>  {
        let new_ll = LinkedList<Element>(lhs) // create new linked list based on lhs
        for i in rhs {
            new_ll.append(i) // append elements from rhs
        }
        return new_ll
    }
    
    public static func + <Other>(lhs: Other, rhs: LinkedList<Element>) -> LinkedList<Element> where Other : Sequence, Element == Other.Element
    {
        let new_ll = LinkedList<Element>(lhs) // create new linked list based on lhs
        for i in rhs {
            new_ll.append(i) // append elements from rhs
        }
        return new_ll
        
    }
    
    public static func + <Other>(lhs: LinkedList<Element>, rhs:Other ) -> LinkedList<Element> where Other : Sequence, Element == Other.Element
    {
        let new_ll = LinkedList<Element>(lhs) // create new linked list based on lhs
        for i in rhs {
            new_ll.append(i) // append elements from rhs
        }
        return new_ll
        
    }
}


// MARK: - CustomStringConvertible Protocol
extension LinkedList: CustomStringConvertible where Element: CustomStringConvertible {
  
  public var description: String {
    
    var text = "["
    var node = head
    
    while node != nil {
        text += "\(node!.data)"
        node = node!.next
        if node != nil {
            text += ", "
        }
    }
    
    return text + "]"
  }
}

// MARK: - CustomStringConvertible Protocol
extension LinkedList : RangeReplaceableCollection {
    
}
