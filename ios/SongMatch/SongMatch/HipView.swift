//
//  BubbleView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/3/21.
//

import SwiftUI

struct HipView: View {

    var body: some View {
        FloatingClouds3()
    }
}



struct FloatingClouds3: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme3.generalBackground
                Cloud(proxy: proxy,
                      color: Theme3.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme3.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme3.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme3.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}


struct Theme3 {
    
    static var generalBackground: Color {
        Color(red: 42/255, green: 82/255, blue: 188/255)
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 0/255, green: 136/255, blue: 221/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 255/255, green: 211/255, blue: 2/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 255/255, green: 138/255, blue: 0/255, opacity: 0.9)
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 164/255, green: 0/255, blue: 1/255, opacity: 0.9)
        
            return any
        
    }
}

struct ContentView_Preview4: PreviewProvider {
    static var previews: some View {
        HipView()
    }
}
