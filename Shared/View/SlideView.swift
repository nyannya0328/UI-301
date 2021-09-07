//
//  SlideView.swift
//  SlideView
//
//  Created by nyannyan0328 on 2021/09/07.
//

import SwiftUI

struct SlideView: View {
    @StateObject var baseViewModel =  BaseViewModel()
    @Binding var showMenu : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 15) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text("Beautiful Girl")
                    .font(.title.italic())
                
                
                Text("Girls")
                    .font(.title2.bold())
                
                HStack(spacing:15){
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            
                            Text("Followers")
                            
                            
                        } icon: {
                            
                            Text("190")
                        }

                        
                        
                    }
                    
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            
                            Text("Following")
                            
                            
                        } icon: {
                            
                            Text("2K")
                        }

                        
                        
                    }


                    
                    
                }
                .foregroundColor(.primary)
                .padding(.leading,3)
                .padding(.bottom)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    VStack{
                        
                        VStack(alignment:.leading,spacing:30){
                            
                            TabButton(image: "Home", title: "Home")
                            
                            
                             TabButton(image: "Lists", title: "Lists")
                         
                            
                            TabButton(image: "Topics", title: "Topics")
                          
                            TabButton(image: "Bookmarks", title: "BookMarks")
                            
                            
                            TabButton(image: "Moments", title: "Moments")
                       
                            TabButton(image: "Purchases", title: "Purchases")
                          
                            
                            TabButton(image: "Monetization", title: "Monetization")
                         
                            
                        }
                        .padding(.horizontal)
            
                        .padding(.top,45)
                        
                        
                        Divider()
                            .padding(.vertical)
                        
                        TabButton(image: "Ads", title: "Twitter Ads")
                            .padding()
                        
                        
                        
                        Divider()
                            .padding(.vertical)
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Button("Settings And Privacy"){
                                
                                
                                
                            }
                            
                            Button("Help Center"){
                                
                                
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.leading)
                        .padding(.bottom)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        
                        
                        
                    }
             
                    
                    
                    
                }
                
                
                VStack(spacing:0){
                    
                    Divider()
                    
                    HStack{
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                        Image("Light")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                        }
                        
                        
                        Spacer()
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                        Image("QR")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primary)
                        }
                        

                    }
                    .padding([.horizontal,.top],10)
                    .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            .padding(.horizontal)
            
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getScreenBounds().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color.primary.opacity(0.05).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth: .infinity, alignment: .leading)
     
    }
    
    @ViewBuilder
    func TabButton(image : String,title : String) -> some View{
        
        NavigationLink {
            
            
            Text("\(title)View")
                .font(.largeTitle)
                .navigationTitle("View")
            
        } label: {
            
            
            
            
            HStack(spacing:15){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                
                
                Text(title)
                 
                
                
                
                
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        
          
          
          

            
            
        }

        
        
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return null
            
            
        }
        
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            return null
        }
        
        return safeArea
        
    }
}
