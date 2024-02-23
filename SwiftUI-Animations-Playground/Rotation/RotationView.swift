//
//  Created on 2024/02/23
//

import SwiftUI

struct RotationView: View {
    @State var rotation: CGFloat = 0
    @State var width: CGFloat = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.8))
                .ignoresSafeArea(.all, edges: .top)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 260, height: 340)
                .foregroundStyle(.black)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 130, height: 450 + width)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.green,  Color.blue, Color.purple,Color.purple, Color.purple, Color.red, Color.orange]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
                        .frame(width: 256, height: 336)
                }
            
            Text("CARD")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
        }
        .onAppear {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                rotation = 360
            }

            withAnimation(.linear(duration: 2).repeatForever()) {
                width = 200
            }
        }
    }
}

#Preview {
    RotationView()
}
