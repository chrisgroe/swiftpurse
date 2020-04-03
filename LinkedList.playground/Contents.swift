import Cocoa
import LinkedList

var ll = LinkedList<String>()
ll.append("TEST1")
ll.append("TEST2")
ll.append("TEST3")
ll.append("TEST4")
 

print("---")
print(ll)
print("---")
print(ll[2])
print("---")
ll.remove(at:2)
print(ll)
print("---")
ll.remove(at:0)
print(ll)
print("---")
ll.remove(at:1)
print(ll)
print("---")
ll.removeFirst()
print(ll)
print("---")
ll.removeAll()

var arr = Array<Int>(1...3)


// Find out whether a linked list is a palindrome.

extension LinkedList where Element: Equatable{
    public func isPalindrome() -> Bool {
        var stack = LinkedList<Element>()
        self.forEach { i in
            stack.prepend(i)
        }
        
        for (i1, i2) in zip(stack, self) {
            guard i1 == i2 else {
                return false
            }
        }
        
        return true
    }
}


let l1 = LinkedList(1,2,3,2,1)
l1.isPalindrome()

let l2 = LinkedList(1,2,3,3,2,1)
l2.isPalindrome()

let l3 = LinkedList(1,2,3,4,2,1)
l3.isPalindrome()



let l4 = LinkedList<Any>(LinkedList<Any>(1, 1), 2, LinkedList<Any>(3, LinkedList<Any>(5, 8)))


l4.flatten()

for i in l4 {
    i
}

