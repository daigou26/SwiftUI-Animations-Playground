//
//  Created on 2024/02/21
//

import SwiftUI

struct CardView: View {
    let namespace: Namespace.ID
    let id: Int
    @Binding var isShown: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "title\(id)", in: namespace)
                
                Text("subtitle")
                    .font(.footnote.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "subtitle\(id)", in: namespace)
                
                Text("bodybodybodybodybodybody")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "text\(id)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    }
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(id)", in: namespace)
            )
        }
        .padding(20)
        .foregroundStyle(.white)
        .background(
            Image("Background\(id)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(id)", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(id)", in: namespace)
        }
        .frame(height: 340)
        .padding(10)
    }
}

#Preview {
    @Namespace var namespace
    return CardView(namespace: namespace, id: 1, isShown: .constant(false))
}
