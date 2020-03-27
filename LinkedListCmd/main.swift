//
//  main.swift
//  LinkedList
//
//  Created by Christian Gröling on 26.03.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation
import LinkedList

var ll = LinkedList<String>()
ll.append("TEST1")
ll.append("TEST2")
ll.append("TEST3")
ll.append("TEST4")
 
for item in ll {
    print(item)
}
print("---")
ll.printList()
print("---")
print(ll[2])
print("---")
try? ll.remove(2)
ll.printList()
print("---")
try? ll.remove(0)
ll.printList()
print("---")
try? ll.remove(1)
ll.printList()
print("---")
try? ll.remove(0)
ll.printList()
print("---")
