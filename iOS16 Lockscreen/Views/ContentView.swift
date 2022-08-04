//
//  ContentView.swift
//  iOS16 Lockscreen
//
//  Created by Nick Rice on 03/08/2022.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionManager.deviceMotionUpdateInterval = 1 / 30
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
}

struct ContentView: View {
    @StateObject private var motion = MotionManager()
    
    @State private var opacity: Double = 1.0
    @State private var scale: Double = 1.0
    
    var place: Place = examplePlaces[0]
    
    var body: some View {
        TabView {
            ForEach(examplePlaces, id: \.self) { place in
                ZStack {
                    // MARK: Background Image
                    
                    Image(place.backgroundImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .scaleEffect(1.2)
                        .blur(radius: 0.1)
                        .offset(x: 16)
                        .offset(x: motion.x * 8, y: motion.y * 8)
                    
                    // MARK: Time & Date
                    
                    VStack {
                        Text(place.date)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(place.time)
                            .font(.system(size: 72, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 90)
                    
                    // MARK: Foreground
                    
                    Image(place.foregroundImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .scaleEffect(1.2)
                        .offset(x: 12)
                        .offset(x: motion.x * -16, y: motion.y * -16)
                    
                    VStack {
                        Spacer()

                        BottomControls()
                    }
                    .frame(maxHeight: .infinity)
                    
                    // MARK: Notification
                    
                    Notification()
                        .offset(y: -100)
                        .opacity(opacity)
                        .scaleEffect(scale)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                opacity = 0
                                scale = 0
                            }
                        }
                        .frame(maxHeight: .infinity)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

struct DraggableModifier : ViewModifier {

    enum Direction {
        case vertical
        case horizontal
    }

    let direction: Direction
    let opacity: Double = 1.0

    @State private var draggedOffset: CGSize = .zero

    func body(content: Content) -> some View {
        content
        .offset(
            CGSize(width: direction == .vertical ? 0 : draggedOffset.width,
                   height: direction == .horizontal ? 0 : draggedOffset.height)
        )
        
        .gesture(
            DragGesture()
            .onChanged { value in
                self.draggedOffset = value.translation
            }
        )
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
