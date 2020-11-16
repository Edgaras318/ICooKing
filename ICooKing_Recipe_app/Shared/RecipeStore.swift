import Foundation

class RecipeStore : ObservableObject {
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
}

let testStore = RecipeStore(recipes: testData)
