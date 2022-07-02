//
//  GDMap.swift
//  MAMapTest
//
//  Created by 张平 on 2020/4/17.
//  Copyright © 2020 CN. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import MAMapKit
import AMapFoundationKit



struct MapView :UIViewRepresentable {
   typealias UIViewType = MAMapView
    
    class Coordinator: NSObject,MAMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        //Mark MAMapViewDelegate
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MAMapView {
        return MAMapView()
    }
    func updateUIView(_ uiView: MAMapView, context: Context) {
        
    }
}

#if DEBUG
struct GDMap_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            //.frame(width: 200, height: 200, alignment: .center)
    }
}
#endif
