
//  joinview.swift
//  MoToBBC
//
//  Created by 澤木柊斗 on 2023/04/27.
//
//
//  joinview.swift
//  MoToBBC
//
//  Created by 澤木柊斗 on 2023/04/27.
//

import SwiftUI

struct joinview: View {
    
    @ObservedObject private var viewModel = ViewModel()
    @State var events: [Events] = []
    
    var body: some View {
        VStack{
            ZStack(alignment:.top){
                Image("Image 1").frame(width:420,height: 0,alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            } .padding(EdgeInsets(top: 23, leading: 40, bottom: 0, trailing: 0))
                .background(Color(red: 0.9, green: 0
                                  , blue: 0))
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .zIndex(10)
                .edgesIgnoringSafeArea(.bottom)
            NavigationView {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 70) {
                        ForEach(events, id: \.eventid) { event in
                            VStack(alignment: .leading) {
                                JoinListView_Card(eventid: event.eventid, whereis: event.whereis, detail: event.detail, title: event.title, dateStrig: event.dateString, how: event.how)
                            }.padding(EdgeInsets(top: 0, leading: 5
                                            , bottom: 0, trailing:0
                                                ))
                            .frame(width: 360, height: 600) // カードのサイズを設定
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .onAppear {
                    self.viewModel.fetchJoinedData { (events) in
                        self.events = events
                    }
                }
            }
        }
    }
}
struct joinview_Previews: PreviewProvider {
    static var previews: some View {
        joinview()
    }
}
