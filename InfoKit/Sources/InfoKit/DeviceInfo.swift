//
//  DeviceInfo.swift
//
//
//  Created by Steven Nakhla on 2/19/21.
//
#if canImport(UIKit)
import UIKit
#endif

public class DeviceInfo {
    
    private let deviceTypeMap: [String:DeviceType] = [
        "i386" : .simulator,
        "x86_64" : .simulator,
        "arm64" : .simulator,
        "iPhone1,1" : .iPhone,
        "iPhone1,2" : .iPhone3G,
        "iPhone2,1" : .iPhone3GS,
        "iPhone3,1" : .iPhone4,
        "iPhone3,2" : .iPhone4,
        "iPhone3,3" : .iPhone4,
        "iPhone4,1" : .iPhone4S,
        "iPhone5,1" : .iPhone5,
        "iPhone5,2" : .iPhone5,
        "iPhone5,3" : .iPhone5C,
        "iPhone5,4" : .iPhone5C,
        "iPhone6,1" : .iPhone5S,
        "iPhone6,2" : .iPhone5S,
        "iPhone7,1" : .iPhone6,
        "iPhone7,2" : .iPhone6,
        "iPhone8,1" : .iPhone6S,
        "iPhone8,2" : .iPhone6SPlus,
        "iPhone8,4" : .iPhoneSE,
        "iPhone9,1" : .iPhone7,
        "iPhone9,2" : .iPhone7Plus,
        "iPhone9,3" : .iPhone7,
        "iPhone9,4" : .iPhone7Plus,
        "iPhone10,1" : .iPhone8,
        "iPhone10,2" : .iPhone8Plus,
        "iPhone10,3" : .iPhoneX,
        "iPhone10,4" : .iPhone8,
        "iPhone10,5" : .iPhone8Plus,
        "iPhone10,6" : .iPhoneX,
        "iPhone11,2" : .iPhoneXS,
        "iPhone11,4" : .iPhoneXSMax,
        "iPhone11,6" : .iPhoneXS,
        "iPhone11,8" : .iPhoneXR,
        "iPhone12,1" : .iPhone11,
        "iPhone12,3" : .iPhone11Pro,
        "iPhone12,5" : .iPhone11ProMax,
        "iPhone12,8" : .iPhoneSE2,
        "iPhone13,1" : .iPhone12Mini,
        "iPhone13,2" : .iPhone12,
        "iPhone13,3" : .iPhone12Pro,
        "iPhone13,4" : .iPhone12ProMax,
        "iPod1,1" : .iPodTouch,
        "iPod2,1" : .iPodTouch2,
        "iPod3,1" : .iPodTouch3,
        "iPod4,1" : .iPodTouch4,
        "iPod5,1" : .iPodTouch5,
        "iPod7,1" : .iPodTouch6,
        "iPod9,1" : .iPodTouch7,
        "iPad1,1" : .iPad,
        "iPad1,2" : .iPad,
        "iPad2,1" : .iPad2,
        "iPad2,2" : .iPad2,
        "iPad2,3" : .iPad2,
        "iPad2,4" : .iPad2,
        "iPad3,1" : .iPad3,
        "iPad3,2" : .iPad3,
        "iPad3,3" : .iPad3,
        "iPad2,5" : .iPadMini,
        "iPad2,6" : .iPadMini,
        "iPad2,7" : .iPadMini,
        "iPad3,4" : .iPad4,
        "iPad3,5" : .iPad4,
        "iPad3,6" : .iPad4,
        "iPad4,1" : .iPadAir,
        "iPad4,2" : .iPadAir,
        "iPad4,3" : .iPadAir,
        "iPad4,4" : .iPadMini2,
        "iPad4,5" : .iPadMini2,
        "iPad4,6" : .iPadMini2,
        "iPad4,7" : .iPadMini3,
        "iPad4,8" : .iPadMini3,
        "iPad4,9" : .iPadMini3,
        "iPad5,1" : .iPadMini4,
        "iPad5,2" : .iPadMini4,
        "iPad5,3" : .iPadAir2,
        "iPad5,4" : .iPadAir2,
        "iPad6,3" : .iPadPro97,
        "iPad6,4" : .iPadPro97,
        "iPad6,7" : .iPadPro129,
        "iPad6,8" : .iPadPro129,
        "iPad6,11" : .iPad5,
        "iPad6,12" : .iPad5,
        "iPad7,1" : .iPadPro129_2gen,
        "iPad7,2" : .iPadPro129_2gen,
        "iPad7,3" : .iPadPro105,
        "iPad7,4" : .iPadPro105,
        "iPad7,5" : .iPad6,
        "iPad7,6" : .iPad6,
        "iPad7,11" : .iPad7,
        "iPad7,12" : .iPad7,
        "iPad8,1" : .iPadPro11,
        "iPad8,2" : .iPadPro11,
        "iPad8,3" : .iPadPro11,
        "iPad8,4" : .iPadPro11,
        "iPad8,5" : .iPadPro129_3gen,
        "iPad8,6" : .iPadPro129_3gen,
        "iPad8,7" : .iPadPro129_3gen,
        "iPad8,8" : .iPadPro129_3gen,
        "iPad8,9" : .iPadPro11_4gen,
        "iPad8,10" : .iPadPro11_4gen,
        "iPad8,11" : .iPadPro129_4gen,
        "iPad8,12" : .iPadPro129_4gen,
        "iPad11,1" : .iPadMini5,
        "iPad11,2" : .iPadMini5,
        "iPad11,3" : .iPadAir3,
        "iPad11,4" : .iPadAir3,
        "iPad11,6" : .iPad8,
        "iPad11,7" : .iPad8,
        "iPad13,1" : .iPadAir4,
        "iPad13,2" : .iPadAir4,
        "Watch1,1" : .watch38,
        "Watch1,2" : .watch42,
        "Watch2,6" : .watch38_series1,
        "Watch2,7" : .watch42_series1,
        "Watch2,3" : .watch38_series2,
        "Watch2,4" : .watch42_series2,
        "Watch3,1" : .watch38_series3_cellular,
        "Watch3,2" : .watch42_series3_cellular,
        "Watch3,3" : .watch38_series3,
        "Watch3,4" : .watch42_series3,
        "Watch4,1" : .watch40_series4,
        "Watch4,2" : .watch44_series4,
        "Watch4,3" : .watch40_series4_cellular,
        "Watch4,4" : .watch44_series4_cellular,
        "Watch5,1" : .watch40_series5,
        "Watch5,2" : .watch44_series5,
        "Watch5,3" : .watch40_series5_cellular,
        "Watch5,4" : .watch44_series5_cellular,
        "Watch5,9" : .watchSE40,
        "Watch5,10" : .watchSE44,
        "Watch5,11" : .watchSE40_cellular,
        "Watch5,12" : .watchSE44_cellular,
        "Watch6,1" : .watch40_series6,
        "Watch6,2" : .watch44_series6,
        "Watch6,3" : .watch40_series6_cellular,
        "Watch6,4" : .watch44_series6_cellular
    ]
    
    public static let shared = DeviceInfo()
    
    private init() {}

    public var modelName: String {
        get {
            var info = utsname()
            uname(&info)
            
            let machineMirror = Mirror(reflecting: info.machine)
            let modelName = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else {
                    return identifier
                }
                
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
            
            return modelName
        }
    }
    
    public var deviceType: DeviceType {
        get {
            return deviceTypeMap[modelName] ?? .unknown
        }
    }
    
    public var deviceFamily: DeviceFamily {
        get {
            let type: String = deviceType.rawValue
            let family: DeviceFamily
            
            if type.starts(with: "simulator") {
                family = .simulator
            } else if type.starts(with: "iPhone") {
                family = .iPhone
            } else if type.starts(with: "iPad") {
                family = .iPad
            } else if type.starts(with: "watch") {
                family = .appleWatch
            } else {
                family = .unknown
            }
            
            return family
        }
    }
    
    public var isDeviceIPad: Bool {
        get {
            return deviceFamily == .iPad
        }
    }
    
    public var isDeviceIPhone: Bool {
        get {
            return deviceFamily == .iPhone
        }
    }
    
    public var isDeviceAppleWatch: Bool {
        get {
            return deviceFamily == .appleWatch
        }
    }
    
    public var isSimulator: Bool {
        get {
            return deviceFamily == .simulator
        }
    }}
