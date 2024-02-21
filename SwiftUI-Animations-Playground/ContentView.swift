//
//  Created on 2024/02/20
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TransitionView()
                .tabItem { Text("Transition") }
        }
    }
}

#Preview {
    ContentView()
}
