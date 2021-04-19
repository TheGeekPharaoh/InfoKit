//
//  DeviceIdentifier.swift
//  
//
//  Created by Steven Nakhla on 4/15/21.
//

import Foundation

public enum DeviceFamily: String {
    
    case unknown
    case simulator
    case iPhone
    case iPad
    case appleWatch
    
}

public enum DeviceType: String {
    
    case unknown    // A placeholder for when an unknown device type is encountered
    
    // MARK: - Simulators
    case simulator
    
    // MARK: - iPhone Identifiers
    
    case iPhone
    case iPhone3G
    case iPhone3GS
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXSMaxChina
    case iPhoneXR
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhone12
    case iPhone12Mini
    case iPhone12Pro
    case iPhone12ProMax
    case iPhoneSE2
    
    // MARK: - iPad Identifiers
    
    case iPad
    case iPad2
    case iPad3
    case iPad4
    case iPad5
    case iPad6
    case iPad7
    case iPad8
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadMini5
    case iPadAir
    case iPadAir2
    case iPadAir3
    case iPadAir4
    case iPadPro97
    case iPadPro129
    case iPadPro129_2gen
    case iPadPro129_3gen
    case iPadPro129_4gen
    case iPadPro105
    case iPadPro11
    case iPadPro11_4gen
    
    // MARK: - iPod Touch Identifiers
    
    case iPodTouch
    case iPodTouch2
    case iPodTouch3
    case iPodTouch4
    case iPodTouch5
    case iPodTouch6
    case iPodTouch7
    
    // MARK: - Apple Watch Identifiers
    
    case watch38
    case watch42
    case watch38_series1
    case watch42_series1
    case watch38_series2
    case watch42_series2
    case watch38_series3
    case watch38_series3_cellular
    case watch42_series3
    case watch42_series3_cellular
    case watch40_series4
    case watch40_series4_cellular
    case watch44_series4
    case watch44_series4_cellular
    case watch40_series5
    case watch40_series5_cellular
    case watch44_series5
    case watch44_series5_cellular
    case watch40_series6
    case watch40_series6_cellular
    case watch44_series6
    case watch44_series6_cellular
    case watchSE40
    case watchSE40_cellular
    case watchSE44
    case watchSE44_cellular
    
}

public extension DeviceType {
    
    func deviceName() -> String {
        let name: String
        
        switch self {
        case .simulator:
            name = "Simulator"
        case .iPhone:
            name = "iPhone"
        case .iPhone3G:
            name = "iPhone 3G"
        case .iPhone3GS:
            name = "iPhone 3GS"
        case .iPhone4:
            name = "iPhone 4"
        case .iPhone4S:
            name = "iPhone 4S"
        case .iPhone5:
            name = "iPhone 5"
        case .iPhone5C:
            name = "iPhone 5C"
        case .iPhone5S:
            name = "iPhone 5S"
        case .iPhone6:
            name = "iPhone 6"
        case .iPhone6Plus:
            name = "iPhone 6 Plus"
        case .iPhone6S:
            name = "iPhone 6S"
        case .iPhone6SPlus:
            name = "iPhone 6S Plus"
        case .iPhoneSE:
            name = "iPhone SE"
        case .iPhone7:
            name = "iPhone 7"
        case .iPhone7Plus:
            name = "iPhone 7 Plus"
        case .iPhone8:
            name = "iPhone 8"
        case .iPhone8Plus:
            name = "iPhone 8 Plus"
        case .iPhoneX:
            name = "iPhone X"
        case .iPhoneXS:
            name = "iPhone XS"
        case .iPhoneXSMax:
            name = "iPhone XS Max"
        case .iPhoneXSMaxChina:
            name = "iPhone XS Max (China)"
        case .iPhoneXR:
            name = "iPhone XR"
        case .iPhone11:
            name = "iPhone 11"
        case .iPhone11Pro:
            name = "iPhone 11 Pro"
        case .iPhone11ProMax:
            name = "iPhone 11 Pro Max"
        case .iPhone12:
            name = "iPhone 12"
        case .iPhone12Mini:
            name = "iPhone 12 Mini"
        case .iPhone12Pro:
            name = "iPhone 12 Pro"
        case .iPhone12ProMax:
            name = "iPhone 12 Pro Max"
        case .iPhoneSE2:
            name = "iPhone SE (2nd Gen.)"
        case .iPad:
            name = "iPad"
        case .iPad2:
            name = "iPad 2nd Generation"
        case .iPad3:
            name = "iPad 3rd Generation"
        case .iPad4:
            name = "iPad 4th Generation"
        case .iPad5:
            name = "iPad 5th Generation"
        case .iPad6:
            name = "iPad 6th Generation"
        case .iPad7:
            name = "iPad 7th Generation"
        case .iPad8:
            name = "iPad 8th Generation"
        case .iPadMini:
            name = "iPad Mini"
        case .iPadMini2:
            name = "iPad Mini 2nd Generation"
        case .iPadMini3:
            name = "iPad Mini 3rd Generation"
        case .iPadMini4:
            name = "iPad Mini 4th Generation"
        case .iPadMini5:
            name = "iPad Mini 5th Generation"
        case .iPadAir:
            name = "iPad Air"
        case .iPadAir2:
            name = "iPad Air 2nd Generation"
        case .iPadAir3:
            name = "iPad Air 3rd Generation"
        case .iPadAir4:
            name = "iPad Air 4th Generation"
        case .iPadPro97:
            name = "iPad Pro 9.7-inch"
        case .iPadPro129:
            name = "iPad Pro 12.9-inch"
        case .iPadPro129_2gen:
            name = "iPad Pro 12.9-inch 2nd Generation"
        case .iPadPro129_3gen:
            name = "iPad Pro 12.9-inch 3rd Generation"
        case .iPadPro129_4gen:
            name = "iPad Pro 12.9-inch 4th Generation"
        case .iPadPro105:
            name = "iPad Pro 10.5-inch"
        case .iPadPro11:
            name = "iPad Pro 11-inch"
        case .iPadPro11_4gen:
            name = "iPad Pro 11-inch 4th Generation"
        case .iPodTouch:
            name = "iPod Touch"
        case .iPodTouch2:
            name = "iPod Touch 2nd Generation"
        case .iPodTouch3:
            name = "iPod Touch 3rd Generation"
        case .iPodTouch4:
            name = "iPod Touch 4th Generation"
        case .iPodTouch5:
            name = "iPod Touch 5th Generation"
        case .iPodTouch6:
            name = "iPod Touch 6th Generation"
        case .iPodTouch7:
            name = "iPod Touch 7th Generation"
        case .watch38:
            name = "Apple Watch 38mm"
        case .watch42:
            name = "Apple Watch 42mm"
        case .watch38_series1:
            name = "Apple Watch 38mm Series 1"
        case .watch42_series1:
            name = "Apple Watch 42mm Series 1"
        case .watch38_series2:
            name = "Apple Watch 38mm Series 2"
        case .watch42_series2:
            name = "Apple Watch 42mm Series 2"
        case .watch38_series3:
            name = "Apple Watch 38mm Series 3"
        case .watch38_series3_cellular:
            name = "Apple Watch 38mm Series 3 (Cellular)"
        case .watch42_series3:
            name = "Apple Watch 42mm Series 3"
        case .watch42_series3_cellular:
            name = "Apple Watch 42mm Series 3 (Cellular)"
        case .watch40_series4:
            name = "Apple Watch 40mm Series 4"
        case .watch40_series4_cellular:
            name = "Apple Watch 40mm Series 4 (Cellular)"
        case .watch44_series4:
            name = "Apple Watch 44mm Series 4"
        case .watch44_series4_cellular:
            name = "Apple Watch 44mm Series 4 (Cellular)"
        case .watch40_series5:
            name = "Apple Watch 40mm Series 5"
        case .watch40_series5_cellular:
            name = "Apple Watch 40mm Series 5 (Cellular)"
        case .watch44_series5:
            name = "Apple Watch 44mm Series 5"
        case .watch44_series5_cellular:
            name = "Apple Watch 44mm Series 5 (Cellular)"
        case .watch40_series6:
            name = "Apple Watch 40mm Series 6"
        case .watch40_series6_cellular:
            name = "Apple Watch 40mm Series 6 (Cellular)"
        case .watch44_series6:
            name = "Apple Watch 44mm Series 6"
        case .watch44_series6_cellular:
            name = "Apple Watch 44mm Series 6 (Cellular)"
        case .watchSE40:
            name = "Apple Watch SE 40mm"
        case .watchSE40_cellular:
            name = "Apple Watch SE 40mm (Cellular)"
        case .watchSE44:
            name = "Apple Watch SE 44mm"
        case .watchSE44_cellular:
            name = "Apple Watch SE 44mm (Cellular)"
        default:
            name = "Unknown Device"
        }
        
        return name
    }
}
