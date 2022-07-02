//
//  ContentView.swift
//  Macau Covid
//
//  Created by miuGrey on 2022/7/1.
//

import SwiftUI

struct ContentView: View {
    @State var isMapPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: true) {
                VStack(alignment: .leading, spacing: 24) {
                    Group {
                        Text("Current Situation")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.leading)

                        
                        
                    HStack (alignment: .center, spacing: 26.0) {
                        Text("{NUM_Current}")
                            .padding(.all)
                            .frame(width: 165.0, height: 165.0)
                            .background {
                                Rectangle()
                                    .frame(width: 165.0, height: 165.0)
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                                    .cornerRadius(12)
                                    .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.216, opacity: 0.2), radius: 6, x: 0, y: 0)
                            }
                        
                        Text("{NUM_New}")
                            .padding(.all)
                            .frame(width: 165.0, height: 165.0)
                            .background {
                                Rectangle()
                                    .frame(width: 165.0, height: 165.0)
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                                    .cornerRadius(12)
                                    .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.216, opacity: 0.2), radius: 6, x: 0, y: 0)
                            }
                    }
                    .padding(.leading)
                    
                    Group {
                        Text("Map")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .center, spacing: 24.0) {
                        Button(action:{
                            
                        }) {
                            Text("{MAP_Native}")
                                .foregroundColor(.black)
                                .frame(width: 356.0, height: 180.0)
                                .background {
                                    Rectangle()
                                        .frame(width: 356.0, height: 180.0)
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                                        .cornerRadius(12)
                                        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.216, opacity: 0.2), radius: 6, x: 0, y: 0)
                                }
                            
                        }

                        Button(action:{
                            self.isMapPresented = true
                        }) {
                            Text("Map in Web (by Wilson)")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                                .frame(width: 356.0, height: 72.0)
                                .background {
                                    Rectangle()
                                        .frame(width: 356.0, height: 72.0)
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                                        .cornerRadius(12)
                                        .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.216, opacity: 0.2), radius: 6, x: 0, y: 0)
                                }
                        }
                        .fullScreenCover(isPresented: self.$isMapPresented) {
                            WebViewPage()
                        }

                        
                    }
                    .padding(.leading)

                    Spacer()
                }
                .padding([.top, .trailing])
                .navigationTitle("Macau COVID Tracker")
            }
            .padding(.horizontal, 20.0)
            
            
        }
        
        
        
        
        
            }

        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .previewDevice("iPhone 13 Pro Max")
    }
}
