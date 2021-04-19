//
//  NetworkInterfaceDetails.swift
//  InfoKitSample
//
//  Created by Steven Nakhla on 4/16/21.
//

import InfoKit
import SwiftUI

struct NetworkInterfaceDetails: View {
    
    @State var device: NetworkDevice
    
    var body: some View {
        List {
            Section(header: Text("IPv4")) {
                Text("Address: \(self.device.ipv4Address ?? "None")")
                Text("Subnet Mask: \(self.device.ipv4SubnetMask ?? "None")")
            }
            Section(header: Text("IPv6")) {
                Text("Address: \(self.device.ipv6Address ?? "None")")
                Text("Subnet Mask: \(self.device.ipv6SubnetMask ?? "None")")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Device Details")
    }
}

//struct NetworkInterfaceDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkInterfaceDetails(interfaceName: "en0")
//    }
//}
