//
//  Created on 2024/02/23
//

import SwiftUI

struct CarouselView: View {
    @State var currentIndex = 1
    @GestureState var dragOffset: CGFloat = 0
    
    let threshold: CGFloat = 50
    
    var body: some View {
        ZStack {
            ForEach(1..<6) { index in
                Image("Background\(index)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 500)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(currentIndex == index ? 1 : 0.5)
                    .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                    .offset(x: dragOffset, y: 0)
                    .offset(x: currentIndex == index ? 0 : (CGFloat(index - currentIndex) * 300), y: 0)
            }
        }
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    let offset = value.translation.width
                    if offset > threshold {
                        state = threshold
                    } else if offset < -threshold {
                        state = -threshold
                    } else {
                        state = offset
                    }
                }
                .onEnded({ value in
                    if value.translation.width > threshold {
                        currentIndex = max(1, currentIndex - 1)
                    } else if value.translation.width < -threshold {
                        currentIndex = min(5, currentIndex + 1)
                    }
                })
        )
        .animation(.interpolatingSpring(mass: 0.6, stiffness: 150, damping: 80, initialVelocity: 0.1), value: dragOffset)
    }
}

#Preview {
    CarouselView()
}
