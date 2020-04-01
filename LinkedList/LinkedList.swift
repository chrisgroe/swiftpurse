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
    
    convenience public init(_ values: Element...) {
        self.init(values)
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
    var end : Node? {
        get {
            if head == nil {
                return nil
            }
            
            var node = head
            while (hasNext(node)) {
                node = node?.next
            }
            return node
        }
    }
    
    var pennultimateNode : Node? {
        get {
            if head == nil {
                return nil
            }
            
            var node = head
            var pennu : Node? = nil
            while (hasNext(node)) {
                pennu = node
                node = node?.next
            }
            return pennu
        }
    }
    
    
    /// The last element of the LinkedList.
    ///
    /// Is nil  the LinkedList is empty.
    public var last : Element? {
        end?.data
    }
    
    
    func hasNext(_ node : Node?) -> Bool {
        node!.next != nil
    }

    func gotoNode(at index: Int) -> Node? {
        if (index >= startIndex) && (index<endIndex)
        {
            // special case
            if (index == 0) {
                return head
            }
            
            var next = head?.next
            var currIndex = 1
            
            while (next != nil) {
                if index==currIndex {
                    return next
                }
                next = next?.next
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
            let tail = end
            tail!.next = node
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
        
        let new = Node(data: newElement)
        
        guard index != 0 else {
            // special case ... move head
            let oldhead = head
            head = new
            head!.next = oldhead
            endIndex += 1
            return
        }
        
        assert(index < (endIndex + 1))
        
        let prev = gotoNode(at: index  - 1)
        
        assert(prev != nil)
        
        // insert at end
        if index==endIndex {
            prev?.next = new
            endIndex += 1
        } else {
            assert(index<endIndex)
            
            let node = prev?.next
            
            assert(node != nil)
            
            prev?.next = new
            new.next = node
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

        
        guard index != 0 else {
            // special case ... index 0 is head
            let oldHead = head
            head = head?.next // move head
            endIndex -= 1
            return oldHead!.data
        }
        
        let prev = gotoNode(at: index  - 1)
        let node = prev?.next
        
        assert(prev != nil)
        assert(node != nil)
        
        // replace connection
        prev?.next = node?.next // node?.next can be nil
        endIndex -= 1
        
        return node!.data
    }
    
    /// Reverses the linked list
    /// - Complexity: O(n), where n is the length of the list
    public func reverse() {
        
        guard (count>=2) else {
            return
        }
        
        var prev = head
        var node = head?.next
        prev?.next = nil
        
        repeat {
            let oldNext = node?.next
            
            node?.next = prev
            
            prev = node
            node = oldNext
 
        } while (node != nil)
        
        head=prev
    }
}

// MARK: - Sequence Protocol
extension LinkedList : Sequence
{
    public typealias Iterator = LinkedListIterator
    
    public class LinkedListIterator : IteratorProtocol
    {
        var head : Node?
        var node : Node?
        
        internal init(start : Node?, end: Node?) {
            self.head = start
            node = start
        }
        public func next() -> Element? {
            if node == nil {
                return nil
            }
            
            if node === head {
                head = nil
                return node?.data
            }
            
            node = node?.next
            return node?.data
        }
    }
    
    public func makeIterator()->LinkedListIterator {
        return LinkedListIterator(start: head, end:end)
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
            let node = gotoNode(at: position)
            node!.data = newValue
        }
        get {
            gotoNode(at: position)!.data
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
        let oldHead = head
        head=head?.next
        endIndex -= 1
        return oldHead!.data
    }
    
    
    public func removeFirst(_ k: Index) {
        assert(count != 0)
        assert(k>=startIndex)
        assert(k<=endIndex)
        
        for _ in 0..<k { // better performance than using node(at:)
            head = head?.next
        }
        endIndex -= k
    }
    
    public func removeLast() -> Element {
        assert(count != 0)
        let pennu = pennultimateNode
        
        endIndex -= 1
        var end : Node?
        
        // special case ... head exists but has no next node
        if head != nil && pennu == nil {
            end = head
            head = nil
        } else {
            end = pennu?.next
            pennu?.next = nil
        }
        return end!.data
    }
    
    public func removeLast(_ k: Index)  {
        assert(count != 0)
        assert(k>=startIndex)
        assert(k<=endIndex)
        
        let prevIndex = endIndex - k - 1
        endIndex -= k
        
        if prevIndex<0 {
            head=nil
        } else {
            let prev = gotoNode(at: prevIndex)
            prev?.next = nil
        }
    }
    
    public func removeSubrange(_ bounds: Range<Index>) {
        assert(count != 0)
        assert(bounds.lowerBound>=startIndex)
        assert(bounds.upperBound<=endIndex)
        
        var from : Node? = head
        if bounds.lowerBound - 1  < 0 {
            from = nil
        } else {
            for _ in 0..<bounds.lowerBound - 1 { // better performance than using node(at:)
                from = from?.next
            }
        }
        var to : Node? = head
        for _ in 0..<bounds.upperBound { // better performance than using node(at:)
            to = to?.next
        }
        
        endIndex -= bounds.upperBound - bounds.lowerBound
        if from == nil && to !=  nil {
            head = to
            
        } else if from != nil && to == nil {
            from?.next = nil
        } else {
            head = from
            from?.next = to
        }
    }
}


//MARK: - Equatable Conformance
extension LinkedList: Equatable where Element: Equatable {
    public static func ==(lhs: LinkedList<Element>, rhs: LinkedList<Element>) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        for (a, b) in zip(lhs, rhs) {
            guard a == b else {
                return false
            }
        }
        return true
    }
}


// Flatten a nested linked list structure.
extension LinkedList where Element : Any{
    public func flatten() {
        var node = head
        var prevNode : Node? = nil
        var idx = 0
        repeat
        {
            
            if let data =  node!.data as? LinkedList<Element> {
                
                // Step 1: flatten the list contained in the list
                data.flatten()
                
                // Step 2:
                // remove the list from the containing list
                endIndex -= 1
                if prevNode == nil {
                    head = node!.next
                    
                } else
                {
                    prevNode = node!.next
                }
                
                // insert the elements at the respective positions
                for (ni,i) in data.enumerated() {
                    self.insert(i, at:idx+ni) // this can be more efficient if needed
                    
                }
                idx += data.count - 1
            }
            prevNode = node
            node = node!.next
            
            idx += 1
        } while (node != nil)
        
        
    }
}

