//
//  BloomFilter.swift
//  Circle
//
//  Created by Jonathan Dalrymple on 06/11/2015.
//

import Foundation

private struct Position {
    var first:Int
    var second:Int
    var third:Int
    
    init() {
        self.first = 0
        self.second = 0
        self.third = 0
    }
}

/*
    Bloom filters
    https://en.wikipedia.org/wiki/Bloom_filter

    Summary: A bloom filter provides an efficient way of determining if object is within a set
*/
class BloomFilter<T> {
    private var bloomset:Array<Bool!>
    private var empty = true
    
    var isEmpty:Bool {
        get {
            return self.empty
        }
    }
    
    init() {
        self.bloomset = Array<Bool!>(count:10000,repeatedValue: nil)
    }
    
    /// Add an element to the filter
    func addElement(item: T ) -> Bool {
        var position = Position()
        
        position.first = self.hash(item)
        position.second = self.hash(position.first)
        position.third = self.hash(position.second)
        
        if self.bloomset[position.first] != nil && self.bloomset[position.second] != nil && self.bloomset[position.third] != nil {
            return false
        }
        
        self.bloomset[position.first] = true
        self.bloomset[position.second] = true
        self.bloomset[position.third] = true
        
        self.empty = false
        
        return true
    }
    
    /// Determine if an element is possibly within the set
    func contains(item: T) -> Bool {
        
        if self.isEmpty {
            return false
        }
        
        var position = Position()
        
        position.first = self.hash(item)
        position.second = self.hash(position.first)
        position.third = self.hash(position.second)
        
        if self.bloomset[position.first] == nil {
            return false
        } else if self.bloomset[position.second] == nil {
            return false
        } else if self.bloomset[position.third] == nil {
            return false
        }
        
        return true
    }
    
    // Hash an item
    private func hash<T>(item: T) -> Int {
        var remainder: Int = 0
        var divisor: Int = 0

        
        for key in String(item).unicodeScalars {
            //print("the ascii value of \(key) is \(key.value)..")
            divisor += Int(key.value)
        }
        
        
        //assignment and divisibility check
        remainder = divisor % self.bloomset.count
        
        if remainder != 0 {
            remainder -= 1
        }
        
        return remainder
    }
}
