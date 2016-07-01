//
//  Util.swift
//  GoodWox
//
//  Created by Cody Liu on 7/1/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import Foundation

func getNaturalDateString(date: NSDate?) -> String?{
    
    let formatter = NSDateComponentsFormatter()
    formatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
    formatter.includesTimeRemainingPhrase = false
    formatter.allowedUnits = [.Year, .Month, .WeekOfMonth, .Day, .Hour, .Minute, .Second]
    formatter.maximumUnitCount = 1
    
    if let pastDate = date {
        return formatter.stringFromDate(pastDate, toDate: NSDate())
    }else{
        return nil
    }
}

