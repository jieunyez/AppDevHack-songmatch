//
//  BubbleView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/3/21.
//

import SwiftUI

struct IndieView: View {

    var body: some View {
        FloatingClouds4()
    }
}



struct FloatingClouds4: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme4.generalBackground
                Cloud(proxy: proxy,
                      color: Theme4.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme4.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme4.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme4.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}


struct Theme4 {
    
    static var generalBackground: Color {
        Color(red: 131/255, green: 196/255, blue: 190/255)
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 252/255, green: 212/255, blue: 205/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 244/255, green: 142/255, blue: 138/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 216/255, green: 226/255, blue: 219/255, opacity: 0.9)
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 1/255, green: 109/255, blue: 118/255, opacity: 0.9)
        
            return any
        
    }
}

struct ContentView_Preview5: PreviewProvider {
    static var previews: some View {
        IndieView()
    }
}
