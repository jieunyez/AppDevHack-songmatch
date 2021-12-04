//
//  BubbleView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/3/21.
//

import SwiftUI

struct BubbleView: View {
    var body: some View {
        FloatingClouds()
    }
}

struct Cloud: View {
    @StateObject var provider = CloudProvider()
    @State var move = false
    let proxy: GeometryProxy
    let color: Color
    let rotationStart: Double
    let duration: Double
    let alignment: Alignment
    

    var body: some View {
        Circle()
            .fill(color)
            .frame(height: proxy.size.height /  provider.frameHeightRatio)
            .offset(provider.offset)
            .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.8)
            .onAppear {
                move.toggle()
            }
    }
}


class CloudProvider: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat

    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}


struct FloatingClouds: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme.generalBackground
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}


struct Theme {
    
    static var generalBackground: Color {
        Color(red: 154/255, green: 211/255, blue: 230/255)
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 112/255, green: 191/255, blue: 162/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 236/255, green: 112/255, blue: 74/255, opacity: 0.9)
        
            return any
        
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 242/255, green: 181/255, blue: 183/255, opacity: 0.9)
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 248/255, green: 191/255, blue: 62/255, opacity: 0.9)
        
            return any
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
