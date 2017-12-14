//
//  Dictionary+helper.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/14/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: AnyObject {

    func stringForKey (key: Key) -> String {
        if let value = self[key] as? String {
            return value
        }
        return ""
    }

    func intForKey (key: Key) -> Int {
        if let value = self[key] as? Int {
            return value
        }
        return 0
    }

    func int64ForKey (key: Key) -> Int64 {
        if let value = self[key] as? NSNumber {
            return value.int64Value
        }
        return 0
    }

    func doubleForKey (key: Key) -> Double {
        if let value = self[key] as? Double {
            return value
        }
        return 0.0
    }

    func boolForKey (key: Key) -> Bool {
        if let value = self[key] as? Bool {
            return value
        }
        return false
    }

    func arrayForKey (key: Key) -> [AnyObject] {
        if let value = self[key] as? [AnyObject] {
            return value
        }
        return []
    }

    func dictionaryForKey (key: Key) -> [String: AnyObject] {
        if let value = self[key] as? [String: AnyObject] {
            return value
        }
        return [String: AnyObject]()
    }

    func dictionaryByRemovingNulls () -> [String: AnyObject] {
        var newDictionary: [String: AnyObject] = [String: AnyObject]()

        for (key, value) in self {
            if self[key] != nil {
                if value is [String: AnyObject] {
                    newDictionary[key as! String] = (value as! [String: AnyObject]).dictionaryByRemovingNulls() as AnyObject
                } else {
                    newDictionary[key as! String] = value
                }

            }
        }

        return newDictionary
    }
}
