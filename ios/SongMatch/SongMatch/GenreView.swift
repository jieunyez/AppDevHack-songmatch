//
//  BubbleView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/3/21.
//

import SwiftUI

struct GenreView: View {

    var body: some View {
        FloatingClouds5()
    }
}



struct FloatingClouds5: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme5.generalBackground
                Cloud(proxy: proxy,
                      color: Theme5.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme5.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme5.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme5.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}


struct Theme5 {
    
    static var generalBackground: Color {
            Color(red: 0.043, green: 0.467, blue: 0.494)
        }

        static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
            let any = Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81)
            let dark = Color(red: 0.000, green: 0.176, blue: 0.216, opacity: 80.0)
            switch scheme {
            case .light:
                return any
            case .dark:
                return dark
            @unknown default:
                return any
            }
        }

        static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
            let any = Color(red: 0.196, green: 0.796, blue: 0.329, opacity: 0.5)
            let dark = Color(red: 0.408, green: 0.698, blue: 0.420, opacity: 0.61)
            switch scheme {
            case .light:
                return any
            case .dark:
                return dark
            @unknown default:
                return any
            }
        }

        static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
            Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.7)
        }

        static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
            let any = Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55)
            let dark = Color(red: 0.525, green: 0.859, blue: 0.655, opacity: 0.45)
            switch scheme {
            case .light:
                return any
            case .dark:
                return dark
            @unknown default:
                return any
            }
        }
}

struct ContentView_Previews6: PreviewProvider {
    static var previews: some View {
        GenreView()
    }
}
