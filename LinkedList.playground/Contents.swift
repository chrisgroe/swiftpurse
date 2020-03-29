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


