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

    func testIterator0Elements() {
        let ll = LinkedList<String>()
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssert(value0 == nil)
        
        let value1 = it.next()
        XCTAssert(value1 == nil)
    }

    func testIterator1Elements() {
        let ll = LinkedList<String>()
        ll.append("1 - Test String - 1")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssert(value0! == "1 - Test String - 1")
        
        let value1 = it.next()
        XCTAssert(value1 == nil)
    }
    
    func testIterator2Elements() {
        let ll = LinkedList<String>()
        ll.append("1 - Test String - 1")
        ll.append("2 - Test String - 2")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssert(value0! == "1 - Test String - 1")
        
        let value1 = it.next()
        XCTAssert(value1 == "2 - Test String - 2")
        
        let value2 = it.next()
        XCTAssert(value2 == nil)
    }
    
    
    func testSorting() {
        let ll = LinkedList<Int>()
        ll.append(2)
        ll.append(3)
        ll.append(1)
        ll.append(-2)
        ll.append(-10)
        
        let sortedArray = ll.sorted()
        XCTAssert(sortedArray[0] == -10)
        XCTAssert(sortedArray[1] == -2)
        XCTAssert(sortedArray[2] == 1)
        XCTAssert(sortedArray[3] == 2)
        XCTAssert(sortedArray[4] == 3)
        
    }
    
    

}
