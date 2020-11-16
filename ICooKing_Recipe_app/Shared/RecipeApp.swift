import SwiftUI

@main
struct RecipeApp: App {

    @StateObject private var store = testStore
    
    var body: some Scene {
        
        WindowGroup {
            ContentView(store: store)
        }
    }
}
