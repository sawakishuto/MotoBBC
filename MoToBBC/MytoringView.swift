//
//  MytoringView.swift
//  MoToBBC
//
//  Created by 澤木柊斗 on 2023/05/16.
//



import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

struct MytoringView: View {
    @State private var showlist = false
    @State private var userInfoArray: [[String]] = []
    @State var messa = "ツーリング終了！"
    @ObservedObject private var viewModel = ViewModel()
   
    @State  var datamodel = ViewModel().datamodel
    @State var isgo = false
    @State var pp:Int = 0
    @State var uid:String = ""
    @State var documentId = ""
    
   
    let eventid:String
    let  whereis:String
    let detail:String
    let title:String
    let dateString:String
    let how:String
    init(eventid:String,whereis:String,detail:String,title:String,dateStrig:String,how:String){
        self.eventid = eventid
        self.whereis = whereis
        self.detail = detail
        self.title = title
        self.dateString = dateStrig
        self.how = how
     
    }
  
    var body: some View {
      
            VStack{
                ScrollView{
                Text(title).font(.title).fontWeight(.bold)
                Spacer()
                
                
                
                    Text("開催予定日:" + dateString).fontWeight(.bold)
                
                Divider().background(Color.red)
                
                Text("集合場所:" + whereis).fontWeight(.bold)
             
                    Text("詳細:" + detail).frame(width: 350)}.frame(height: 400,alignment: .bottom
                    ).padding(EdgeInsets(top: 160, leading: 20, bottom: 0, trailing: 0))
                
                VStack{
                    Button("参加予定者一覧")
                        {
                               self.showlist.toggle()
                           }
                           .sheet(isPresented: $showlist) {
                               joinperlist(eventid: self.eventid, whereis: self.whereis, detail: self.detail, title: self.title, dateStrig: self.dateString, how: self.how)
                        }
                }
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
              
                
                Text(messa)
                    .frame(width: 190,height: 60)
                    .background(Capsule().fill( Color(red: 50, green: 10 / 255, blue: 10 / 255)))                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 260, trailing: 0))
                    .onTapGesture {
                        self.viewModel.deleteDocument()
                        self.isgo.toggle()
                        if isgo == true{
                            self.viewModel.AttendListclear(eventid: self.eventid)
                            self.viewModel.getUser()
                            messa = "お疲れ様でした！"
                            
                        }
                    }
            }
        
            .onAppear(){
                
                self.viewModel.fetchUserInfoFromAttendList(documentinfo: self.eventid) { userInfoArray in
                    self.userInfoArray = userInfoArray
                }
                
                self.viewModel.getUser()
            }
                
        
 
           
          
        }
        }
    
    

struct MytoringView_Previews: PreviewProvider {
    static var previews: some View {
       MytoringView(eventid: "現在募集中のツーリングはありません", whereis: "1", detail: "", title: "", dateStrig: "", how: "")
    }
}
