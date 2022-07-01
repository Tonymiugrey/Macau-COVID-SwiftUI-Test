import SwiftUI
import WebKit

struct SwiftUI_WKWebView: UIViewRepresentable {
  var url: String
  func makeUIView(context: Context) -> WKWebView {
    guard let url = URL(string: self.url) else {
      return WKWebView()
    }
    let request = URLRequest(url: url)
    let webview = WKWebView()
    webview.load(request)
    return webview
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {
    //
  }
}

struct WebViewPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        // 👍 联网的 URL, Canvas 必须开启 live preview, 动态的请求内容
        VStack(alignment: .leading) {
            Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            SwiftUI_WKWebView(url: "http://map.sheungtech.com")
              .edgesIgnoringSafeArea(Edge.Set.top)
        }

    }
    

}

// Previews 入口 ✅
struct WebViewPage_Previews: PreviewProvider {
  static var previews: some View {
      WebViewPage()
  }
}
