//
//  SplashScreen.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 1.8.2022.
//

import SwiftUI

struct SplashScreen: View {

    @State private var splashShown: Bool = true
    @State private var splashBackgroundShown: Bool = true
    @State private var animationValues: Bool = false
    @State private var fillValue: Double = 0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.background)
                    .scaleEffect(splashBackgroundShown ? 1 : 0)
                VStack {
                    // Pitcher
                    ZStack {
                        // Handle
                        Path { path in
                            let startingX = (geometry.size.width / 2) + 70
                            let startingY = (geometry.size.height / 2) - 75
                            path.move(to: CGPoint(x: startingX, y: startingY))
                            path.addLine(to: CGPoint(x: startingX + 45, y: startingY))
                            path.addLine(to: CGPoint(x: startingX + 65, y: startingY + 60))
                            path.addLine(to: CGPoint(x: startingX + 40, y: startingY + 10))
                            path.addLine(to: CGPoint(x: startingX, y: startingY + 10))
                        }
                        .stroke(.primary, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .scaleEffect(animationValues ? 1 : 0, anchor: .center)
                        // Glass frame
                        ZStack {
                            Circle()
                                .foregroundColor(.primary)
                                .frame(width: 200, height: 200)
                                .scaleEffect(animationValues ? 1 : 0, anchor: .center)
                            Circle()
                                .foregroundColor(.background)
                                .frame(width: 170, height: 170)
                                .scaleEffect(animationValues ? 1 : 0, anchor: .center)
                            // Wave
                            ZStack {
                                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: self.fillValue)
                                    .fill(Color.coffee)
                                    .opacity(0.5)
                                    .frame(width: 200, height: 210)
                                    .offset(y: -5)
                                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: self.fillValue)
                                    .fill(Color.coffee)
                                    .opacity(0.5)
                                    .frame(width: 200, height: 210)
                                    .offset(x: 5)
                            }
                            .mask(Circle().frame(width: 150, height: 150, alignment: .center))
                        }
                        // Spout
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 165, height: 55)
                            .offset(y: -75)
                            .scaleEffect(animationValues ? 1 : 0, anchor: .center)
                        Path { path in
                            let startingX = (geometry.size.width / 2) - 65
                            let startingY = (geometry.size.height / 2) - 100
                            path.move(to: CGPoint(x: startingX, y: startingY))
                            path.addLine(to: CGPoint(x: startingX - 20, y: startingY - 30))
                            path.addLine(to: CGPoint(x: startingX + 125, y: startingY - 20))
                            path.addLine(to: CGPoint(x: startingX + 130, y: startingY))
                            path.closeSubpath()
                        }
                        .stroke(.primary, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .scaleEffect(animationValues ? 1 : 0, anchor: .center)
                    }
                }.scaleEffect(splashShown ? 1 : 0)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.2)) {
                    animationValues = true
                }
                withAnimation(.easeOut(duration: 1).delay(0.5)) {
                    self.fillValue = 0.5
                }
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
                    self.waveOffset2 = Angle(degrees: -180)
                }
                withAnimation(.linear(duration: 0.2).delay(2.2)) {
                    splashShown = false
                }
                withAnimation(.easeInOut(duration: 0.1).delay(2.4)) {
                    splashBackgroundShown = false
                }
            }
        }
    }
}

fileprivate struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waveHeight = 0.017 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let xPos = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: xPos, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }

        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }

    var offset: Angle
    var percent: Double

    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(offset.degrees, percent)
        }
        set {
            offset = Angle(degrees: newValue.first)
            percent = newValue.second
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
