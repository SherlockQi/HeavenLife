//
//  NELog.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/13.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import Foundation

public func NELog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("<\((file as NSString).lastPathComponent) : \(line)>, \(method)  \(message)")
    #endif
}
