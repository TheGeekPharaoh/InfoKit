//
//  ContentView.swift
//  InfoKitSample (iOS)
//
//  Created by Steven Nakhla on 4/15/21.
//

import InfoKit
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
//                Text("Foo=\(NetworkInfo.shared.doFoo())")
                
                Section(header: Text("Device Hardware")) {
                    Text("Model ID: \(DeviceInfo.shared.modelName)")
                    Text("Device type (enum): .\(DeviceInfo.shared.deviceType.rawValue)")
                    Text("Device name: \(DeviceInfo.shared.deviceType.deviceName())")
                    Text("Device family (enum): .\(DeviceInfo.shared.deviceFamily.rawValue)")
                    Toggle("iPad", isOn: Binding.constant(DeviceInfo.shared.isDeviceIPad))
                        .disabled(true)
                    Toggle("iPhone", isOn: Binding.constant(DeviceInfo.shared.isDeviceIPhone))
                        .disabled(true)
                    Toggle("Apple Watch", isOn: Binding.constant(DeviceInfo.shared.isDeviceAppleWatch))
                        .disabled(true)
                    Toggle("Simulator", isOn: Binding.constant(DeviceInfo.shared.isSimulator))
                        .disabled(true)
                }
                
                Section(header: Text("System Info")) {
                    Group {
                        Text("OS Version: \(SystemInfo.shared.osVersion)")
                        Text("CPU Architecture: \(SystemInfo.shared.cpuArchitecture ?? "Unknown")")
                        Text("CPU Core Count: \(SystemInfo.shared.cpuCount)")
                        Text("Active CPU Core Count: \(SystemInfo.shared.activeCPUCount)")
                    }
                    Group {
                        Text("Physical Memory (bytes): \(SystemInfo.shared.physicalMemoryBytes)")
                        Text("Physical Memory: \(SystemInfo.shared.physicalMemory)")
                        Text("Available Memory (bytes): \(SystemInfo.shared.availableMemoryBytes)")
                        Text("Available Memory: \(SystemInfo.shared.availableMemory)")
                        Text("Used Memory (bytes): \(SystemInfo.shared.usedMemoryBytes)")
                        Text("Used Memory: \(SystemInfo.shared.usedMemory)")
                    }
                    Group {
                        Toggle("FaceID Supported", isOn: Binding.constant(SystemInfo.shared.isFaceIDSupported))
                            .disabled(true)
                        Toggle("TouchID Supported", isOn: Binding.constant(SystemInfo.shared.isTouchIDSupported))
                            .disabled(true)
                        Toggle("Secure Enclave", isOn: Binding.constant(SystemInfo.shared.isSecureEnclaveSupported))
                            .disabled(true)
                    }
                }
                
                Section(header: Text("Application Info")) {
                    Text("App Name: \(AppInfo.shared.applicationName ?? "Unknown")")
                    Text("App Version: \(AppInfo.shared.applicationVersion ?? "Unknown")")
                    Text("App Revision: \(AppInfo.shared.applicationRevision ?? "Unknown")")
                    Text("Bundle ID: \(AppInfo.shared.bundleIdentifier ?? "Unknown")")
                }
                
                Section(header: Text("Network Info")) {
                    NavigationLink(destination: NetworkInterfaceList(devices: NetworkInfo.shared.devices)) {
                        Text("Network Interfaces (\(NetworkInfo.shared.devices.count))")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("DeviceInfo Sample")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
