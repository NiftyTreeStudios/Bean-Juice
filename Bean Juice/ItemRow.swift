//
//  ItemRowView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    var item: Method
    
    @Binding var cupSize: Double
    @Binding var ratio: Double
    @Binding var cups: Double
    @Binding var customColor: Color
    
    enum BrewMethod: String {
        case aeropress = "Aeropress"
        case chemex = "Chemex"
        case custom = "Custom"
        case frenchpress = "French Press"
        case v60 = "V60"
    }
    
    var body: some View {

        NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: item.name, maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, customColor: self.$customColor)) {
                HStack {
                    Image(item.name)
                    Text(item.name)
                }
        }
        
//        if let brewMethod = BrewMethod(rawValue: item.name) {
//            switch brewMethod {
//                case .custom:
//                    print("Custom")
//                    return CustomView(customColor: self.$customColor)
//                case .frenchpress:
//                    print("French Press")
//                    
//                default:
//                    print("Default")
//                    return NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: item.name, maxCups: Double(item.cupAmount), maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, customColor: self.$customColor)) {
//                            HStack {
//                                Image(item.name)
//                                Text(item.name)
//                            }
//                    }
//            }
//        }

//        if item.name == "Custom" {
//            return AnyView(NavigationLink(destination: CustomView(customColor: self.$customColor))) {
//                HStack {
//                    Image(systemName: "gear")
//                    Text(item.name)
//                }
//            }
//        } else if item.name == "French Press" {
//            return AnyView(NavigationLink(destination: CustomView(customColor: self.$customColor))) {
//                HStack {
//                    Image(systemName: "gear")
//                    Text(item.name)
//                }
//            }
//        } else {
//            return AnyView(NavigationLink(destination: MethodView(cupSize: self.$cupSize, ratio: self.$ratio, cups: self.$cups, methodName: item.name, maxCups: Double(item.cupAmount), maxWater: item.waterAmount, groundLevel: item.grounds, startRatio: item.startRatio, customColor: self.$customColor))) {
//                HStack {
//                    Image(item.name)
//                    Text(item.name)
//                }
//            }
//        }
    }
}

//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRowView(item: Method(name: "Aeropress", waterAmount: 230, waterAmountOz: 8, cupAmount: 4, grounds: "Medium/Fine", startRatio: 13), cupSize: self.$cupSize, ratio: 13, cups: 2)
//    }
//}
