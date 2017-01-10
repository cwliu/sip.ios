//
//  Log.swift
//  Haneke
//
//  Created by Hermes Pique on 11/10/14.
//  Copyright (c) 2014 Haneke. All rights reserved.
//

import Foundation

struct Log {
    
    fileprivate static let Tag = "[HANEKE]"
    
    fileprivate enum Level : String {
        case Debug = "[DEBUG]"
        case Error = "[ERROR]"
    }
    
    fileprivate static func log(_ level: Level, _ message: @autoclosure () -> String, _ error: NSError? = nil) {
        if let error = error {
            NSLog("%@%@ %@ with error %@", Tag, level.rawValue, message(), error)
        } else {
            NSLog("%@%@ %@", Tag, level.rawValue, message())
        }
    }
    
    static func debug(_ message: @autoclosure () -> String, _ error: NSError? = nil) {
        #if DEBUG
            log(.Debug, message, error)
        #endif
    }
    
    static func error(_ message: @autoclosure () -> String, _ error: NSError? = nil) {
        log(.Error, message, error)
    }
    
}
