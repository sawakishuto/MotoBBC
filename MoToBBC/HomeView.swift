//
//  Alltabview.swift
//  MoToBBC
//
//  Created by 澤木柊斗 on 2023/04/27.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = ViewModel()
    var body: some View {
    TabView {
        // --- ここから ---
        // タブ内に表示するビュー
  textandview()
        // 実際には Text を使うのではなく、カスタムビューとなる
            .tabItem {
               Image(systemName:"person.3.fill"
                )
                // タブのラベル部分のビュー
             
            }
        joinview(whereis: "", detail: "", title: "", dateStrig: "", how: "")
            .tabItem{
                Image(systemName: "figure.wave")
            }
        // --- ここまで ---
        // --- ここから ---
        // タブ内に表示するビュー
        Mypageview(whereis: "", detail: "", title: "", dateStrig: "", how: "")
            .tabItem {
                // タブのラベル部分のビュー
                  Image(systemName:"person.crop.circle.fill")
            }            }
    }
}


struct Alltabview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
