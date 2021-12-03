//
//  WaveView.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 12/2/21.
//

import SwiftUI

struct WaveView: View {
    let size = UIScreen.main.bounds
    let col : Color
    
    @State var isAnimated = false
    var body: some View {
        ZStack {
            getSinWave(interval: size.width, baseline: size.height/2)
                .foregroundColor(col)
                .offset(x: isAnimated ? -1 * size.width: 0)
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: isAnimated)
            getSinWave(interval: size.width, amplitude: 140, baseline: -100 + size.height/2)
                .foregroundColor(col)
                .offset(x: isAnimated ? -1 * size.width: 0)
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimated)
            getSinWave(interval: size.width, amplitude: 90, baseline: -205 + size.height/2)
                .foregroundColor(col)
                .offset(x: isAnimated ? -1 * size.width: 0)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: isAnimated)
//            getSinWave(interval: size.width, baseline: -30 + size.height/2)
//                .foregroundColor(col)
//                .offset(x: isAnimated ? -1 * size.width: 0)
//                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: isAnimated)
//            getSinWave(interval: size.width, amplitude: 30, baseline: -100 + size.height/2)
//                .foregroundColor(col)
//                .offset(x: isAnimated ? -1 * size.width: 0)
//                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimated)
//            getSinWave(interval: size.width, amplitude: 70, baseline: -140 + size.height/2)
//                .foregroundColor(col)
//                .offset(x: isAnimated ? -1 * size.width: 0)
//                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: isAnimated)
        }.onAppear() {
            self.isAnimated = true
        }
    }
    
    
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
            
        }
    
    }
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        let color = Color.blue.opacity(0.3)
        WaveView(col: color)
    }
}
