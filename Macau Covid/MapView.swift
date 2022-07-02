//
//  MapView.swift
//  Macau Covid
//
//  Created by innovative on 2022/7/2.
//

import SwiftUI
import BaiduMapAPI_Map
import BaiduMapAPI_Base



class MapViewController: UIViewController, BMKMapViewDelegate {
    
    var mapView: BMKMapView?
    @State var time: Double = MapView().time
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView = BMKMapView(frame: self.view.frame)
        mapView?.delegate = self
        self.view.addSubview(mapView!);
        mapView?.zoomLevel = 15
        mapView?.centerCoordinate = CLLocationCoordinate2D(latitude: 22.146951, longitude: 113.564090)
        mapView?.overlooking = -40
        
        // 读取数据
        let jsonData = NSData(contentsOfFile: Bundle.main.path(forResource: "locations", ofType: "json")!)
        if jsonData != nil {
            let json = try? JSONSerialization.jsonObject(with: jsonData! as Data, options:JSONSerialization.ReadingOptions.allowFragments)
            let array: Array<Dictionary<String, Double>>? = json as? Array<Dictionary<String, Double>>

            if array != nil {
                let heatMap = BMKHeatMap()
                // 创建热力图数据数组
                let heatData = NSMutableArray()
                
                for dic in array!{
                    // 创建 BMKHeatMapNode
                    let heatMapNode = BMKHeatMapNode()
                    NSLog("JSON测试")
                    print(dic["timeframe"]!, dic["lat"]!, dic["lng"]!)
                    
                    let coordinate = CLLocationCoordinate2DMake(dic["lat"]!, dic["lng"]!)
                    heatMapNode.pt = coordinate
                    // 随机生成点强度
                    heatMapNode.intensity = Double(arc4random())
                    // 添加 BMKHeatMapNode 到数组
                    heatData.add(heatMapNode)
                        
                    

                }
                
                heatMap.mData = (heatData as! [BMKHeatMapNode])
                heatMap.mMaxHight = 160
                heatMap.mRadius = 30
                
                // 调用 mapView 中的方法根据热力图数据添加热力图
                mapView?.add(heatMap)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.viewWillAppear()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView?.viewWillDisappear()
    }


    
    
}






struct MapViewPresenter: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MapViewPresenter>) -> MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: UIViewControllerRepresentableContext<MapViewPresenter>) {
        
    }
    
}

struct MapMiniView: View {
    var body: some View {
        MapViewPresenter()
        
    }
}

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var time: Double = 1
    var body: some View {
        VStack(alignment: .leading) {
            Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            MapViewPresenter()
            
            Slider(value: self.$time, in: 1...11, step: 1)
                .padding(/*@START_MENU_TOKEN@*/.all, 46.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 13 Pro")
    }
}
