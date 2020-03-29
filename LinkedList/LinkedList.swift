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
    public var first : Element? {
        head?.data
    }

    
    /// The last node in the collection
    ///
    /// Is nil when the LinkedList is empty.
    var endNode : Node? {
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
    
    var pennultimateNode : Node? {
        get {
            if head == nil {
                return nil
            }
            
            var currentNode = head
            var penuNode : Node? = nil
            while (hasNext(currentNode)) {
                penuNode = currentNode
                currentNode = next(currentNode)
            }
            return penuNode
        }
    }
    
    
    /// The last element of the LinkedList.
    ///
    /// Is nil  the LinkedList is empty.
    public var last : Element? {
        endNode?.data
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
            
            var nextNode = next(head)
            var currIndex = 1
            
            while (nextNode != nil) {
                if index==currIndex {
                    return nextNode
                }
                nextNode = next(nextNode)
                currIndex+=1
            }
        }
        return nil
    } 
    
    /// Adds a new element at the start of the LinkedList.
    /// - Parameters:
    ///     - newElement: The element to append to the LinkedList.
    public func prepend(_ newElement: Element) {
        // pack Element in Node
        let node = Node(data: newElement)
        
        endIndex += 1
        node.next = head
        head = node
    }
    
    /// Adds a new element at the end of the LinkedList.
    /// - Parameters:
    ///     - newElement: The element to append to the LinkedList.
    public func append(_ newElement: Element) {
        // pack Element in Node
        let node = Node(data: newElement)
        
        endIndex += 1
        if head == nil {
            head = node
        } else {
            let tailNode = endNode
            tailNode!.next = node
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
        
        let newNode = Node(data: newElement)
        
        // special case ... move head
        if index == 0 {
            let oldhead = head
            head = newNode
            head!.next = oldhead
            endIndex += 1
            return
        }
        
        assert(index < (endIndex + 1))
        
        let prevNode = node(at: index  - 1)
        
        assert(prevNode != nil)
        
        // insert at end
        if index==endIndex {
            prevNode?.next = newNode
            endIndex += 1
        } else {
            assert(index<endIndex)
            
            let node = next(prevNode)
            
            assert(node != nil)
            
            prevNode?.next = newNode
            newNode.next = node
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
            head = next(head)
            endIndex -= 1
            return oldhead!.data
        }
        
        let prev = node(at: index  - 1)
        let node = next(prev)
        
        assert(prev != nil)
        assert(node != nil)
        
        // replace connection
        prev?.next = node?.next // node?.next can be nil
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
        return LinkedListIterator(start: head, end:endNode)
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
            let nodeAtPos = node(at: position)
            nodeAtPos!.data = newValue
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
    public func removeFirst() -> Element {
        assert(count != 0)
        let oldhead = head
        head=next(head)
        endIndex -= 1
        return oldhead!.data
    }
    
    
    public func removeFirst(_ k: Index) {
        assert(count != 0)
        assert(k>=startIndex)
        assert(k<=endIndex)
        
        for _ in 0..<k { // better performance than using node(at:)
            head = next(head)
        }
        endIndex -= k
    }
    
    public func removeLast() -> Element {
        assert(count != 0)
        let pennuNode = pennultimateNode
        
        endIndex -= 1
        var endNode : Node?
        
        // special case ... head exists but has no next node
        if head != nil && pennuNode == nil {
            endNode = head
            head = nil
        } else {
            endNode = pennuNode?.next
            pennuNode?.next = nil
        }
        return endNode!.data
    }
    
    public func removeLast(_ k: Index)  {
        assert(count != 0)
        assert(k>=startIndex)
        assert(k<=endIndex)
        
        let prevNodeIndex = endIndex - k - 1
        endIndex -= k
        
        if prevNodeIndex<0 {
            head=nil
        } else {
            let prevNode = node(at: prevNodeIndex)
            prevNode?.next = nil
        }
    }
    
    public func removeSubrange(_ bounds: Range<Index>) {
        assert(count != 0)
        assert(bounds.lowerBound>=startIndex)
        assert(bounds.upperBound<=endIndex)
        
        
        var fromNode : Node? = head
        if bounds.lowerBound - 1  < 0 {
            fromNode = nil
        } else {
            for _ in 0..<bounds.lowerBound - 1 { // better performance than using node(at:)
                fromNode = next(fromNode)
            }
        }
        var toNode : Node? = head
        for _ in 0..<bounds.upperBound { // better performance than using node(at:)
            toNode = next(toNode)
        }
        
        endIndex -= bounds.upperBound - bounds.lowerBound
        if fromNode == nil && toNode !=  nil {
            head = toNode
            
        } else if fromNode != nil && toNode == nil {
            fromNode?.next = nil
        } else {
            head = fromNode
            fromNode?.next = toNode
        }
    }
}
