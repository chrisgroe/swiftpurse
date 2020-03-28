//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Christian Gröling on 27.03.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitBySequence() {
        let ll = LinkedList<Int>([1,2,3,4])
        
        XCTAssertEqual(ll.count,4)
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func testInitByRange() {
        let ll = LinkedList<Int>(1...4)
        
        XCTAssertEqual(ll.count,4)
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func testInitRepeating() {
           let ll = LinkedList<Int>(repeating: 123, count: 4)
           
           XCTAssertEqual(ll.count,4)
           XCTAssertEqual(Array<Int>(ll), [123,123,123,123])
       }

    func testFirst0Elements() {
        let ll = LinkedList<String>()

        XCTAssertNil(ll.first)
    }
    
    func testLast0Elements() {
        let ll = LinkedList<String>()
        
        XCTAssertNil(ll.last)
    }
    
    func testFirst1Elements() {
        let ll = LinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.first,123)
    }
    
    func testLast1Elements() {
        let ll = LinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.last,123)
    }
    
    func testFirst2Elements() {
        let ll = LinkedList<Int>()
        ll.append(123)
        ll.append(321)
        XCTAssertEqual(ll.first,123)
    }
    
    func testLast2Elements() {
        let ll = LinkedList<Int>()
        ll.append(123)
        ll.append(321)
        XCTAssertEqual(ll.last,321)
    }
    
    
    func testIterator0Elements() {
        let ll = LinkedList<String>()
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertNil(value0)
        
        let value1 = it.next()
        XCTAssertNil(value1)
    }

    func testIterator1Elements() {
        let ll = LinkedList<String>()
        ll.append("1 - Test String - 1")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertEqual(value0, "1 - Test String - 1")
        
        let value1 = it.next()
        XCTAssertNil(value1)
    }
    
    func testIterator2Elements() {
        let ll = LinkedList<String>()
        ll.append("1 - Test String - 1")
        ll.append("2 - Test String - 2")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertEqual(value0,"1 - Test String - 1")
        
        let value1 = it.next()
        XCTAssertEqual(value1, "2 - Test String - 2")
        
        let value2 = it.next()
        XCTAssertNil(value2)
    }
    
    
    func testGetNodeByIndexOutOfBonds() {
        let ll = LinkedList<Int>()
        ll.append(2) //0
        ll.append(3)
        ll.append(1) //2
        XCTAssertNil(ll.node(at: 3))
    }
    
    func testGetNodeByIndexEmpty() {
        let ll = LinkedList<Int>()
        XCTAssertNil(ll.node(at: 0))
        XCTAssertNil(ll.node(at: 1))
    }
    
    func testCount0Elements() {
        let ll = LinkedList<Int>()
        XCTAssertEqual(ll.count, 0)
    }
    
    func testCount3Elements() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        XCTAssertEqual(ll.count, 3)
    }
    
    func testFirstIndexOf() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(-3)
        ll.append(1)
        
        XCTAssertEqual(ll.firstIndex(of: -3), 2)
    }
    
    func testDistance() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(-3)
        ll.append(1)
        
        XCTAssertEqual(ll.distance(from: 0, to: 2), 2)
    }
    
    func testSubscriptMutating() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(-3)
        ll.append(1)
        XCTAssertEqual(ll[2], -3)
        ll[2] = 4
        XCTAssertEqual(ll[2], 4)
    }
    
    func testSorted() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        ll.append(-2)
        ll.append(-10)
        
        let sortedArray = ll.sorted()
        XCTAssertEqual(sortedArray[0], -10)
        XCTAssertEqual(sortedArray[1], -2)
        XCTAssertEqual(sortedArray[2], 1)
        XCTAssertEqual(sortedArray[3], 2)
        XCTAssertEqual(sortedArray[4], 3)
        
    }
    
    func testInsertEmpty() {
        let ll = LinkedList<Int>()
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(ll[0], 10)
    }
    
    func testInsertAtStart() {
        let ll = LinkedList<Int>()
        ll.append(11)
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 10)
        XCTAssertEqual(ll[1], 11)
    }
    
    func testInsertAtMid() {
        let ll = LinkedList<Int>()
        ll.append(11) // 0
        ll.append(12) // 1
        ll.append(13) // 2
        ll.insert(10, at: 1)
        XCTAssertEqual(ll.count, 4)
        XCTAssertEqual(ll[0], 11)
        XCTAssertEqual(ll[1], 10)
        XCTAssertEqual(ll[2], 12)
        XCTAssertEqual(ll[3], 13)
    }
    
    func testInsertAtEnd() {
        let ll = LinkedList<Int>()
        ll.append(11)
        ll.insert(10, at: 1)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 11)
        XCTAssertEqual(ll[1], 10)
    }
    
    func testRemoveStart() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        ll.append(-2)
        ll.append(-10)
        
        let removedElement = ll.remove(at:0)
        XCTAssertEqual(removedElement, 2)
        XCTAssertEqual(ll[0], 3)
        XCTAssertEqual(ll[1], 1)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func testRemoveMid() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        ll.append(-2)
        ll.append(-10)
        
        let removedElement = ll.remove(at:2)
        XCTAssertEqual(removedElement, 1)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func testRemoveEnd() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        ll.append(-2)
        ll.append(-10)

        let removedElement = ll.remove(at:ll.endIndex-1)
        XCTAssertEqual(removedElement, -10)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], 1)
        XCTAssertEqual(ll[3], -2)
    }
    
    func testConcat2LinkedLists() {
        let ll1 = LinkedList<Int>(1...5)
        let ll2 = LinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    
    func testConcatSequenceAndLinkedList() {
        let ll1 = 1...5
        let ll2 = LinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
       
    func testConcatLinkedListAndSequence() {
        let ll1 = LinkedList<Int>(1...5)
        let ll2 = 6...10
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    func testAppendPerformance100Elements() {
        let ll = LinkedList<Int>()
        measure {
            for _ in 0..<100 {
                ll.append(2)
            }
        }

        
    }
    

}
