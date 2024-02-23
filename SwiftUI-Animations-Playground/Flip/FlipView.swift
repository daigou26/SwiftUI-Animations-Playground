//
//  Created on 2024/02/23
//

import SwiftUI

struct FlipView: View {
    @State var isFlipped = false
    
    var body: some View {
        ZStack {
            FlipCard(color: .blue, text: "Blue", isFlipped: isFlipped, isFront: false)
            FlipCard(color: .orange, text: "Orange", isFlipped: isFlipped, isFront: true)
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}

struct FlipCard: View {
    let color: Color
    let text: String
    let isFlipped: Bool
    let isFront: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.2))
                .stroke(color, style: .init(lineWidth: 2))
                .frame(width: 300, height: 500)

            Text(text)
                .font(.largeTitle.bold())
                .foregroundStyle(color)
        }
        .rotation3DEffect(
            .degrees(degree),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(animation, value: isFlipped)
    }
    
    var degree: CGFloat {
        if isFlipped {
            return isFront ? 90 : 0
        } else {
            return isFront ? 0 : -90
        }
    }
    
    var animation: Animation {
        if isFlipped {
            return isFront ? .linear : .linear.delay(0.35)
        } else {
            return isFront ? .linear.delay(0.35) : .linear
        }
    }
}

#Preview {
    FlipView()
}
