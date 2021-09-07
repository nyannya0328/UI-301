//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/09/07.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu : Bool
    var body: some View {
      
        
        VStack{
            
            VStack(spacing:0){
                
                HStack{
                    
                    
                    Button {
                        withAnimation{    showMenu.toggle()}
                    } label: {
                        
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    
                    NavigationLink {
                        
                        Text("Time Line")
                            .navigationBarTitle("Time Line")
                            .navigationBarTitleDisplayMode(.large)
                        
                    } label: {
                        
                        Image("Sparkles")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                        
                        
                    }

                        

                }
                .padding(.horizontal)
                .padding(.vertical,10)
                
                Divider()
                .background(.orange)
                
            }
            
            .overlay(
            Image("Logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
           
            
            )
            
            
            
            Spacer()
            
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
