//
//  BaseView.swift
//  BaseView
//
//  Created by nyannyan0328 on 2021/09/07.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu : Bool = false
    @State var currentTab = "Home"
    @State var offset : CGFloat = 0
    @State var lastoffset : CGFloat = 0
   @GestureState var gestureOffset : CGFloat = 0
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        let sideWidth = getScreenBounds().width - 90
        NavigationView{
            
           
            HStack(spacing:0){
                
           SlideView(showMenu: $showMenu)
                
                VStack(spacing:0){
                    
                    TabView(selection:$currentTab){
                        
                        
                       Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Notifications")
                        
                        Text("Message")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Message")
                            
                        
                    }
                    
                    VStack(spacing:0){
                        
                     
                        Divider()
                            
                            
                        HStack(spacing:0){
                            
                            TabButton(image: "Home")
                            
                            TabButton(image: "Search")
                            
                            TabButton(image: "Notifications")
                            
                            TabButton(image: "Message")
                        }
                        .padding(.top,15)
                        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
                        
             
                        
                        
                        
                    }
                  
                }
                .frame(width: getScreenBounds().width)
                .overlay(
                
                Rectangle()
                    .fill(Color.primary)
                    .opacity(Double((offset / sideWidth) / 5))
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture {
                        withAnimation{
                            
                            showMenu.toggle()
                        }
                    }
                
                
                )
              
                
                
                
                
                
                
            }
            .frame(width: getScreenBounds().width + sideWidth)
            .offset(x: -sideWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .gesture(
            
            DragGesture()
                .updating($gestureOffset, body: { value, out, _ in
                    
                    out = value.translation.width
                    
                }).onEnded(onEnded(value:))
            
            )
            
            
        }
        .animation(.easeInOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            if showMenu && offset == 0{
                
                offset = sideWidth
                lastoffset = offset
                
            }
            
            if !showMenu && offset == sideWidth{
                
                offset = 0
                lastoffset = 0
                
                
            }
            
            
        }
        .onChange(of: gestureOffset) { newValue in
            
            onChanged()
            
        }
        
        
    }
    
    func onChanged(){
        
        let sideWidth = getScreenBounds().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastoffset < sideWidth ? gestureOffset  + lastoffset : offset) : offset
        
        
         
    }
    
    
    func onEnded(value : DragGesture.Value){
        
        let sideWidth = getScreenBounds().width - 90
      
        let tranSition = value.translation.width
        
        
        lastoffset = offset
        
        
        withAnimation{
            
            
            if tranSition > 0{
                
                
                if tranSition > (sideWidth / 2){
                    
                    offset = sideWidth
                    showMenu = true
                    
                    
                    
                }
                
                else{
                    
                    if offset != 0 && showMenu{
                        
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
                
                
            }
            
            else{
                
                if -tranSition > (sideWidth / 2){
                    
                    offset = 0
                    showMenu = false
                    
                    
                    
                }
                else{
                    
                    if offset == 0{
                        
                        return
                    }
                    
                    offset = sideWidth
                    showMenu = true
                }
                
                
            }
            
        }
    
        
        
        
    }
    @ViewBuilder
    
    func TabButton(image : String) -> some View{
        
        
        Button {
            
            withAnimation{  currentTab = image}
            
        } label: {
       
                
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(currentTab == image ? .orange : .gray)
                    .frame(maxWidth: .infinity)
          
            
            
        }

        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
