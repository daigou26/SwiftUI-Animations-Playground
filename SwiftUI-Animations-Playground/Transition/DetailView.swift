//
//  Created on 2024/02/21
//

import SwiftUI

struct DetailView: View {
    let namespace: Namespace.ID
    let id: Int
    @Binding var isShown: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack() {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 500)
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
                .overlay {
                    VStack(alignment: .leading, spacing: 12) {
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
                            .matchedGeometryEffect(id: "blur\(id)", in: namespace)
                    )
                    .offset(y: 250)
                    .padding(20)
                }
            }
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    isShown.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    @Namespace var namespace
    
    return DetailView(namespace: namespace, id: 1, isShown: .constant(false))
}
