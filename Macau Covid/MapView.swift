//
//  MapView.swift
//  Macau Covid
//
//  Created by innovative on 2022/7/2.
//

import SwiftUI
import MAMapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MAMapView
    
    func makeUIView(context: Context) -> MAMapView {
        return MAMapView()
    }
    
    func updateUIView(_ uiView: MAMapView, context: Context) {
        
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
