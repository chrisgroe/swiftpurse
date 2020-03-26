//
//  main.swift
//  LinkedList
//
//  Created by Christian Gröling on 26.03.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

var ll = LinkedList<String>()
ll.append("TEST1")
ll.append("TEST2")
ll.append("TEST3")
ll.append("TEST4")

ll.printList()
print(ll[2]!)
