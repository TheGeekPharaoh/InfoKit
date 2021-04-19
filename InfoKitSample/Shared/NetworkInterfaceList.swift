//
//  NetworkInterfaceNamesList.swift
//  InfoKitSample
//
//  Created by Steven Nakhla on 4/16/21.
//

import InfoKit
import SwiftUI

struct NetworkInterfaceList: View {
    
    @State var devices: [NetworkDevice]
    
    var body: some View {
        List {
            ForEach(self.devices, id: \.self) { device in
                NavigationLink(destination: NetworkInterfaceDetails(device: device)) {
                    Text(device.interfaceName)
                }
            }
        }
        .navigationTitle("Network Devices")
    }
}

//struct NetworkInterfaceNamesList_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkInterfaceList(interfaceNames: ["Interface1", "Interface2"])
//    }
//}
