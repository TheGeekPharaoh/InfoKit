//
//  NetworkInfo.swift
//  
//
//  Created by Steven Nakhla on 4/16/21.
//

import Foundation

public struct NetworkDevice: Hashable {
    
    public let interfaceName: String
    
    public let ipv4Address: String?
    public let ipv4SubnetMask: String?
    public let ipv6Address: String?
    
    public let ipv6SubnetMask: String?
}

public class NetworkInfo {
    
    public static let shared = NetworkInfo()
    
    private init() {}
    
    public var interfaceNames: [String] {
        get {
            var names: [String] = []
            
            var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
            if getifaddrs(&ifaddr) == 0 {
                var ptr = ifaddr
                while ptr != nil {
                    defer { ptr = ptr?.pointee.ifa_next }
                    
                    if let interface = ptr?.pointee {
                        let name: String = String(cString: (interface.ifa_name))
                        names.append(name)
                    }
                }
                freeifaddrs(ifaddr)
            }
            
            return names.unique()
        }
    }
    
    public var devices: [NetworkDevice] {
        get {
            var devices: [NetworkDevice] = []
            let interfaceNames = self.interfaceNames
            interfaceNames.forEach { name in
                devices.append(NetworkDevice(interfaceName: name,
                                             ipv4Address: self.ipv4Address(for: name),
                                             ipv4SubnetMask: self.ipv4SubnetMask(for: name),
                                             ipv6Address: self.ipv6Address(for: name),
                                             ipv6SubnetMask: self.ipv6SubnetMask(for: name)))
            }
            
            return devices
        }
    }
    
    // MARK: - Public methods
    
    public func ipv6Address(for interfaceName: String) -> String? {
        let ipAddress = self.ipAddress(for: interfaceName, ipSpec: UInt8(AF_INET6))
        
        return ipAddress
    }
    
    public func ipv4Address(for interfaceName: String) -> String? {
        let ipAddress = self.ipAddress(for: interfaceName, ipSpec: UInt8(AF_INET))
        
        return ipAddress
    }
    
    public func ipv4SubnetMask(for interfaceName: String) -> String? {
        let subnetMask = self.subnetMask(for: interfaceName, ipSpec: UInt8(AF_INET))
        
        return subnetMask
    }
    
    public func ipv6SubnetMask(for interfaceName: String) -> String? {
        let subnetMask = self.subnetMask(for: interfaceName, ipSpec: UInt8(AF_INET6))
        
        return subnetMask
    }
    
    // MARK: - Private methods
    
    private func ipAddress(for interfaceName: String, ipSpec: UInt8) -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                guard let interface = ptr?.pointee else {
                    return ""
                }
                
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == ipSpec {
                    let name: String = String(cString: (interface.ifa_name))
                    if name == interfaceName {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if getnameinfo(interface.ifa_addr,
                                       socklen_t(interface.ifa_addr.pointee.sa_len),
                                       &hostname,
                                       socklen_t(hostname.count),
                                       nil,
                                       socklen_t(0),
                                       NI_NUMERICHOST) == 0 {
                            address = String(cString: hostname)
                        }
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        
        return address
    }
    
    private func subnetMask(for interfaceName: String, ipSpec: UInt8) -> String? {
        var subnetMask: String? = nil
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                guard let interface = ptr?.pointee else {
                    return ""
                }
                
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == ipSpec {
                    let name: String = String(cString: (interface.ifa_name))
                    if name == interfaceName {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if getnameinfo(interface.ifa_netmask,
                                       socklen_t((interface.ifa_netmask.pointee.sa_len)),
                                       &hostname,
                                       socklen_t(hostname.count),
                                       nil,
                                       socklen_t(0),
                                       NI_NUMERICHOST) == 0 {
                            subnetMask = String(cString: hostname)
                        }
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        
        return subnetMask
    }
}

