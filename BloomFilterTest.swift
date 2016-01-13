//
//  BloomFilterTest.swift
//  Circle
//
//  Created by Jonathan Dalrymple on 06/11/2015.
//

import Foundation
import XCTest
@testable import Circle

class BloomFilterTest : XCTestCase {
    
    func testAddElement() {
        let subject = BloomFilter<String>()

        XCTAssertTrue(subject.isEmpty)
        
        XCTAssertTrue(subject.addElement("foo"))
        
        XCTAssertFalse(subject.isEmpty)
    }
    
    func testContainsElement() {
        let subject = BloomFilter<String>()
        
        subject.addElement("foo")
        
        XCTAssertTrue(subject.contains("foo"))
        XCTAssertFalse(subject.contains("bar"))
    }
    
    func testIsEmpty() {
        let subject = BloomFilter<String>()
        
        XCTAssertTrue(subject.isEmpty)
        
        subject.addElement("foo")
        
        XCTAssertFalse(subject.isEmpty)
    }
}
