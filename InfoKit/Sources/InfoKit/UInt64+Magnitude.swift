//
//  UInt64+Magnitude.swift
//  
//
//  Created by Steven Nakhla on 4/16/21.
//

import Foundation

extension UInt64 {
    
    func toByteMagnitudeString() -> String {
        let s: String
        
        switch self {
        case 0..<(1024 * 1024):
            s = "\(String(format: "%.2f", (Double(self) / 1024))) KB"
        case 0..<(1024 * 1024 * 1024):
            s = "\(String(format: "%.2f", (Double(self) / 1024 / 1024))) MB"
        case (1024 * 1024 * 1024)...UInt64.max:
            s = "\(String(format: "%.2f", (Double(self) / 1024 / 1024 / 1024))) GB"
        default:
            s = "\(self) bytes"
        }
        
        return s
    }
}
