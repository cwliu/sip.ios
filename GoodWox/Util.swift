//
//  Util.swift
//  GoodWox
//
//  Created by Cody Liu on 7/1/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import Foundation

func getNaturalDateString(_ date: Date?) -> String?{
    
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = DateComponentsFormatter.UnitsStyle.full
    formatter.includesTimeRemainingPhrase = false
    formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
    formatter.maximumUnitCount = 1
    
    if let pastDate = date {
        return formatter.string(from: pastDate, to: Date())
    }else{
        return nil
    }
}

