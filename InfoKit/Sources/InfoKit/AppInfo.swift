//
//  AppInfo.swift
//  
//
//  Created by Steven Nakhla on 4/19/21.
//
#if canImport(UIKit)
import UIKit
#endif
import Foundation

public class AppInfo {
    
    public static let shared = AppInfo()
    
    private init() {}
    
    public var applicationName: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleName"] as? String
        }
    }
    
    public var applicationVersion: String? {
        get {
            // TODO: Multi-platform support
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        }
    }
    
    public var applicationRevision: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        }
    }
    
    public var bundleIdentifier: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
        }
    }
    
    // TODO: Major/minor/release version
    // TODO: Target OS version
    
}
