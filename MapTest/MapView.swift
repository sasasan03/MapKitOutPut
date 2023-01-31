//
//  MapView.swift
//  ExperimentView
//
//  Created by sako0602 on 2023/01/15.
//

import SwiftUI
import MapKit//🟥CoreLocationフレームワークが組み込まれている。

struct MapView: UIViewRepresentable {
    let searchKey: String = "大阪"
        
        //表示する View を作成するときに実行
        func makeUIView(context: Context) -> MKMapView  {
            // MKMapViewのインスタンス生成
            MKMapView()
        } //makeUIView ここまで
        
        //表示した　View が更新されるたびに実行
        func updateUIView(_ uiView: MKMapView, context: Context) {
            
            //入力された文字をデバックエリアに表示
            print("検索キーワード：\(searchKey)")
            
            // CLGeocoderインスタンスを生成
           let geocoder = CLGeocoder()//🟥ジオコーディング/逆ジオコーディングを実装させている。(住所⇄軽度緯度)

         //入力された文字から位置情報を取得
            //🟥geocodeAddressString(逆ジオコードが可能 住所→軽度緯度)
            //🟨 非同期で処理される。completionHandler: CLGeocodeCompletionHandler <([CLPlacemark]?, Error?) -> Void>
            geocoder.geocodeAddressString(
                searchKey,
            //🟥completionHandler(ジオコーディングした結果を取得するためのハンドラーブロック)
//                <宣言>completionHandler: ([CLPlacemark]?, Error?) -> Void
            completionHandler: { (placemarks, error) in
                //リクエストの結果が存在し、１件目の情報から位置情報を取り出す
                //まとめてオプショナルバインディングしている
                //🟩自作
               
                //🟩終了
                
                //  🟦まとめてコメントアウト
                if let placemarks,//[CLPlacemark]? -> [CLPlacemark]
                   let firstPlacemark = placemarks.first,//🟥[CLPlacemark]の配列の最初の要素を取り出す。
                   let location = firstPlacemark.location {//🟥.locationプロパティ＝軽度と緯度を含むオブジェクト。こいつを使用してPlacemarkオブジェクトを初期化します。
                    //位置情報から緯度経度をtargetCoordinateに取り出す（🟥coodinateはアンラップしないと使えない（宣言から）？）
                    let targetCoordinate = location.coordinate//<宣言>var coordinate: CLLocationCoordinate2D { get }
                    //緯度経度をデバックエリアに表示
                    print("緯度経度:\(targetCoordinate)")
               
                }
                 //🟦
            }
            )
        }
    }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()//searchKey: "広島")
    }
}
