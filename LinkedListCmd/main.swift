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
 

print("---")
for item in ll {
    print(item)
}
print("---")
print(ll[2])
print("---")
ll.remove(at:2)
for item in ll {
    print(item)
}
print("---")
ll.remove(at:0)
for item in ll {
    print(item)
}
print("---")
ll.remove(at:1)
for item in ll {
    print(item)
}
print("---")
ll.remove(at:0)
for item in ll {
    print(item)
}
print("---")
