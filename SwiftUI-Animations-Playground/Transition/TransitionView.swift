//
//  Created on 2024/02/20
//

import SwiftUI

struct TransitionView: View {
    @Namespace var namespace
    @State var isShown = false
    @State var selectedID = 1
    
    var body: some View {
        ZStack {
            if !isShown {
                ScrollView {
                    Text("Transition")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    LazyVStack(spacing: 0) {
                        ForEach(1..<3, id: \.self) { id in
                            CardView(namespace: namespace, id: id, isShown: $isShown)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        selectedID = id
                                        isShown.toggle()
                                    }
                                }
                        }
                    }
                }
            } else {
                DetailView(namespace: namespace, id: selectedID, isShown: $isShown)
            }
        }
    }
}

#Preview {
    TransitionView()
}
