//
//  SystemInfo.swift
//  
//
//  Created by Steven Nakhla on 4/16/21.
//

#if canImport(UIKit)
import UIKit
#endif
import Foundation
import LocalAuthentication
import MachO

public class SystemInfo {
    
    public static let shared = SystemInfo()
    
    private init() {}
    
    // TODO: OS major/minor/release version numbers
    // TODO: Free/used disk space
    // TODO: Battery level
    
    public var osVersion: String {
        get {
            let version = UIDevice.current.systemVersion
            return version
        }
    }
    
    public var isFaceIDSupported: Bool {
        get {
            let supported: Bool
            if #available(iOS 11.0, *) {    // FaceID is not supported prior to iOS 11
                let ctx = LAContext.init()
                
                var error: NSError?
                if ctx.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    if ctx.biometryType == .faceID {
                        supported = true
                    } else {
                        supported = false
                    }
                } else {
                    supported = false
                }
            } else {
                supported = false
            }
            
            return supported
        }
    }
    
    public var isTouchIDSupported: Bool {
        get {
            let supported: Bool
            
            let ctx = LAContext.init()
            var error: NSError?
            
            if ctx.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                if #available(iOS 11.0, *) {
                    if ctx.biometryType == .touchID {
                        supported = true
                    } else {
                        supported = false
                    }
                } else {
                    supported = true
                }
            } else {
                supported = false
            }
            
            return supported
        }
    }
    
    public var isSecureEnclaveSupported: Bool {
        get {
            let supported: Bool
            
            if #available(iOS 9.0, *) {
                let deviceType = DeviceInfo.shared.deviceType
                let unsupported: [DeviceType] = [
                    .iPhone4,
                    .iPhone4S,
                    .iPhone5,
                    .iPhone5C,
                    .iPad,
                    .iPad2,
                    .iPad3,
                    .iPad4,
                    .iPadAir,
                    .iPadMini,
                    .iPadMini2,
                    .iPodTouch,
                    .iPodTouch2,
                    .iPodTouch3,
                    .iPodTouch4,
                    .iPodTouch5,
                    .iPodTouch6,
                    .simulator,
                    .unknown
                ]
                
                supported = !(unsupported.contains(deviceType))
            } else {
                supported = false
            }
            
            return supported
        }
    }
    
    public var cpuArchitecture: String? {
        get {
            guard let info = NXGetLocalArchInfo(),
                  let arch = info.pointee.description else {
                return nil
            }
            
            return NSString(utf8String: arch)! as String
        }
    }
    
    public var cpuCount: Int {
        get {
            return ProcessInfo.processInfo.processorCount
        }
    }
    
    public var activeCPUCount: Int {
        get {
            return ProcessInfo.processInfo.activeProcessorCount
        }
    }
    
    public var physicalMemoryBytes: UInt64 {
        get {
            return ProcessInfo.processInfo.physicalMemory
        }
    }
    
    public var physicalMemory: String {
        get {
            return physicalMemoryBytes.toByteMagnitudeString()
        }
    }
    
    public var availableMemoryBytes: UInt64 {
        get {
            var pageSize: vm_size_t = 0

            let hostPort: mach_port_t = mach_host_self()
            var hostSize: mach_msg_type_number_t = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.stride / MemoryLayout<integer_t>.stride)
            host_page_size(hostPort, &pageSize)

            var vmStat: vm_statistics = vm_statistics_data_t()
            withUnsafeMutablePointer(to: &vmStat) { (vmStatPointer) -> Void in
                vmStatPointer.withMemoryRebound(to: integer_t.self, capacity: Int(hostSize)) {
                    if (host_statistics(hostPort, HOST_VM_INFO, $0, &hostSize) != KERN_SUCCESS) {
                        // Handle error
                    }
                }
            }

            let mem: UInt64 = UInt64(vmStat.free_count) * UInt64(pageSize)
            return mem
        }
    }
    
    public var availableMemory: String {
        get {
            return availableMemoryBytes.toByteMagnitudeString()
        }
    }
    
    public var usedMemoryBytes: UInt64 {
        get {
            var pageSize: vm_size_t = 0

            let hostPort: mach_port_t = mach_host_self()
            var hostSize: mach_msg_type_number_t = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.stride / MemoryLayout<integer_t>.stride)
            host_page_size(hostPort, &pageSize)

            var vmStat: vm_statistics = vm_statistics_data_t()
            withUnsafeMutablePointer(to: &vmStat) { (vmStatPointer) -> Void in
                vmStatPointer.withMemoryRebound(to: integer_t.self, capacity: Int(hostSize)) {
                    if (host_statistics(hostPort, HOST_VM_INFO, $0, &hostSize) != KERN_SUCCESS) {
                        // Handle error
                    }
                }
            }

            /* Stats in bytes */
            let mem: UInt64 = UInt64(vmStat.active_count +
                    vmStat.inactive_count +
                    vmStat.wire_count) * UInt64(pageSize)
            
            return mem
        }
    }
    
    public var usedMemory: String {
        get {
            return usedMemoryBytes.toByteMagnitudeString()
        }
    }
    
    // MARK: - Public methods
    
    public func osVersionEqual(to version: String) -> Bool {
        return self.osVersion.compare(version, options: .numeric, range: nil, locale: nil) == .orderedSame
    }
    
    public func osVersionLessThan(_ version: String) -> Bool {
        return self.osVersion.compare(version, options: .numeric, range: nil, locale: nil) == .orderedAscending
    }
    
    public func osVersionGreaterThan(_ version: String) -> Bool {
        return self.osVersion.compare(version, options: .numeric, range: nil, locale: nil) == .orderedDescending
    }
    
    public func osVersionLessThanOrEqual(to version: String) -> Bool {
        return self.osVersion.compare(version, options: .numeric, range: nil, locale: nil) != .orderedDescending
    }
    
    public func osVersionGreaterThanOrEqual(to version: String) -> Bool {
        return self.osVersion.compare(version, options: .numeric, range: nil, locale: nil) != .orderedAscending
    }
}
