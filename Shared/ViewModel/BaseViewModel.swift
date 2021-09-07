//
//  BaseViewModel.swift
//  BaseViewModel
//
//  Created by nyannyan0328 on 2021/09/07.
//

import SwiftUI

class BaseViewModel: ObservableObject {
  
    
    @Published var currentTab : Tab = .Home
    
}

enum Tab : String{
    
    case Home = "Home"
    case Lists = "Lists"
    case  Topics = "Topics"
    case  Bookmarks = "Bookmarks"
    case  Moments = "Moments"
    case  Purchases = "Purchases"
    case Monetization = "Monetization"
    
    
    
}

