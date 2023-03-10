//
//  MapView.swift
//  ExperimentView
//
//  Created by sako0602 on 2023/01/15.
//

import SwiftUI
import MapKit//ð¥CoreLocationãã¬ã¼ã ã¯ã¼ã¯ãçµã¿è¾¼ã¾ãã¦ããã

struct MapView: UIViewRepresentable {
    let searchKey: String = "å¤§éª"
        
        //è¡¨ç¤ºãã View ãä½æããã¨ãã«å®è¡
        func makeUIView(context: Context) -> MKMapView  {
            // MKMapViewã®ã¤ã³ã¹ã¿ã³ã¹çæ
            MKMapView()
        } //makeUIView ããã¾ã§
        
        //è¡¨ç¤ºãããView ãæ´æ°ããããã³ã«å®è¡
        func updateUIView(_ uiView: MKMapView, context: Context) {
            
            //å¥åãããæå­ããããã¯ã¨ãªã¢ã«è¡¨ç¤º
            print("æ¤ç´¢ã­ã¼ã¯ã¼ãï¼\(searchKey)")
            
            // CLGeocoderã¤ã³ã¹ã¿ã³ã¹ãçæ
           let geocoder = CLGeocoder()//ð¥ã¸ãªã³ã¼ãã£ã³ã°/éã¸ãªã³ã¼ãã£ã³ã°ãå®è£ããã¦ããã(ä½æâè»½åº¦ç·¯åº¦)

         //å¥åãããæå­ããä½ç½®æå ±ãåå¾
            //ð¥geocodeAddressString(éã¸ãªã³ã¼ããå¯è½ ä½æâè»½åº¦ç·¯åº¦)
            //ð¨ éåæã§å¦çããããcompletionHandler: CLGeocodeCompletionHandler <([CLPlacemark]?, Error?) -> Void>
            geocoder.geocodeAddressString(
                searchKey,
            //ð¥completionHandler(ã¸ãªã³ã¼ãã£ã³ã°ããçµæãåå¾ããããã®ãã³ãã©ã¼ãã­ãã¯)
//                <å®£è¨>completionHandler: ([CLPlacemark]?, Error?) -> Void
            completionHandler: { (placemarks, error) in
                //ãªã¯ã¨ã¹ãã®çµæãå­å¨ããï¼ä»¶ç®ã®æå ±ããä½ç½®æå ±ãåãåºã
                //ã¾ã¨ãã¦ãªãã·ã§ãã«ãã¤ã³ãã£ã³ã°ãã¦ãã
                //ð©èªä½
               
                //ð©çµäº
                
                //  ð¦ã¾ã¨ãã¦ã³ã¡ã³ãã¢ã¦ã
                if let placemarks,//[CLPlacemark]? -> [CLPlacemark]
                   let firstPlacemark = placemarks.first,//ð¥[CLPlacemark]ã®éåã®æåã®è¦ç´ ãåãåºãã
                   let location = firstPlacemark.location {//ð¥.locationãã­ããã£ï¼è»½åº¦ã¨ç·¯åº¦ãå«ããªãã¸ã§ã¯ããããã¤ãä½¿ç¨ãã¦Placemarkãªãã¸ã§ã¯ããåæåãã¾ãã
                    //ä½ç½®æå ±ããç·¯åº¦çµåº¦ãtargetCoordinateã«åãåºãï¼ð¥coodinateã¯ã¢ã³ã©ããããªãã¨ä½¿ããªãï¼å®£è¨ããï¼ï¼ï¼
                    let targetCoordinate = location.coordinate//<å®£è¨>var coordinate: CLLocationCoordinate2D { get }
                    //ç·¯åº¦çµåº¦ããããã¯ã¨ãªã¢ã«è¡¨ç¤º
                    print("ç·¯åº¦çµåº¦:\(targetCoordinate)")
               
                }
                 //ð¦
            }
            )
        }
    }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()//searchKey: "åºå³¶")
    }
}
