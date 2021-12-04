//
//  BubbleView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/3/21.
//

import SwiftUI

struct RockView: View {

    var body: some View {
        FloatingClouds2()
    }
}



struct FloatingClouds2: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme2.generalBackground
                Cloud(proxy: proxy,
                      color: Theme2.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme2.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme2.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme2.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}


struct Theme2 {
    
    static var generalBackground: Color {
        Color(red: 150/255, green: 26/255, blue: 30/255)
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 218/255, green: 43/255, blue: 43/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 244/255, green: 142/255, blue: 138/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 242/255, green: 103/255, blue: 100/255, opacity: 0.9)
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 253/255, green: 215/255, blue: 210/255, opacity: 0.9)
        
            return any
        
    }
}

struct ContentView_Preview3: PreviewProvider {
    static var previews: some View {
        RockView()
    }
}
