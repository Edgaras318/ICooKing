import Foundation

struct Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var amount: String
}
struct Step: Identifiable {
    var id = UUID()
    var text: String
}

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredientCount: Int {
        ingredients.count
    }
    var isSpicy: Bool = false
    var ingredients : [Ingredient]
    var steps : [Step]
    var duration: String
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

let testData = [
    Recipe(name: "Chicken Pot Pie",
             isSpicy: false,
             ingredients: [
                Ingredient(name: "Chicken", amount: "0,45 kg"),
                Ingredient(name: "Sliced carrots", amount: "a cup"),
                Ingredient(name: "Frozen green peas", amount: "a cup"),
                Ingredient(name: "Sliced celery", amount: "1/2 cup"),
                Ingredient(name: "Butter", amount: "1/3 cup"),
                Ingredient(name: "Chopped onion", amount: "1/3 cup"),
                Ingredient(name: "Flour", amount: "1/3 cup"),
                Ingredient(name: "Salt", amount: "1/2 tsp"),
                Ingredient(name: "Black pepper", amount: "1/4 tsp"),
                Ingredient(name: "Celery seed", amount: "1/4 tsp"),
                Ingredient(name: "Chicken broth", amount: "1 3/4 cups"),
                Ingredient(name: "Milk", amount: "2/3 cup"),
                Ingredient(name: "Unbaked pie crusts", amount: "2"),
             ],
             steps: [
                Step(text: "Preheat the oven to 425 degrees F (220 degrees C.)"),
                Step(text: "In a saucepan, combine chicken, carrots, peas, and celery. Add water to cover and boil for 15 minutes. Remove from heat, drain and set aside."),
                Step(text: "In the saucepan over medium heat, cook onions in butter until soft and translucent. Stir in flour, salt, pepper, and celery seed."),
                Step(text: "Slowly stir in chicken broth and milk. Simmer over medium-low heat until thick. Remove from heat and set aside."),
                Step(text: "Place the chicken mixture in the bottom pie crust. Pour hot liquid mixture over. Cover with top crust, seal edges, and cut away excess dough. Make several small slits in the top to allow steam to escape."),
                Step(text: "Bake in the preheated oven for 30 to 35 minutes, or until pastry is golden brown and filling is bubbly. Cool for 10 minutes before serving."),
             ],
             duration: "1 hour & 10 minutes"),
            
    
    Recipe(name: "French Spring Soup",
             isSpicy: false,
             ingredients: [
                Ingredient(name: "Butter", amount: "1/4 cup"),
                Ingredient(name: "Chopped Leeks", amount: "0,45 kg"),
                Ingredient(name: "Chopped Onion", amount: "1"),
                Ingredient(name: "Water", amount: "2 quarts"),
                Ingredient(name: "Large chopped potatoes", amount: "3"),
                Ingredient(name: "Large chopped carrots", amount: "2"),
                Ingredient(name: "Fresh asparagus", amount: "1 bunch"),
                Ingredient(name: "White rice", amount: "1/3 cup"),
                Ingredient(name: "Salt", amount: "4 tsp"),
                Ingredient(name: "Fresh spinach", amount: "0,22 kg"),
                Ingredient(name: "Heavy cream", amount: "a cup"),
             ],
             steps: [
                Step(text: "Melt the butter in a large pot over medium heat. Stir in the leeks and onion, and cook until tender."),
                Step(text: "Pour water into the pot. Mix in potatoes, carrots, asparagus, and rice. Season with salt. Bring to a boil, reduce heat, and simmer for 30 minutes, until vegetables and rice are tender."),
                Step(text: "Stir spinach and heavy cream into the soup mixture, and continue cooking for about 5 minutes before serving."),
             ],
             duration: "1 hour"),
    
    Recipe(name: "Breakfast Pancakes",
             isSpicy: false,
             ingredients: [
                Ingredient(name: "Flour", amount: "1 1/2 cups flour"),
                Ingredient(name: "Baking powder", amount: "3 1/2 tsp"),
                Ingredient(name: "Salt", amount: "1 tsp"),
                Ingredient(name: "White sugar", amount: "1 Tbsp"),
                Ingredient(name: "Milk", amount: "1 1/4 cups"),
                Ingredient(name: "Egg", amount: "1"),
                Ingredient(name: "Melted butter", amount: "3 Tbsp"),
             ],
             steps: [
                Step(text: "In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter. Mix until smooth."),
                Step(text: "Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approx. ¼ cup for each pancake."),
                Step(text: "Brown on both sides and serve hot."),
             ],
             duration: "20 minutes"),
    
    Recipe(name: "Shrimp De Jonghe",
             isSpicy: false,
             ingredients: [
                Ingredient(name: "Cooked shrimp", amount: "1,35 kg"),
                Ingredient(name: "Bread crumbs", amount: "2/3 cup"),
                Ingredient(name: "Dry sherry", amount: "1/2 cup"),
                Ingredient(name: "Butter", amount: "0,11 kg"),
                Ingredient(name: "Minced garlic", amount: "1 large clove"),
                Ingredient(name: "Salt", amount: "1 tsp"),
                Ingredient(name: "Tarragon", amount: "1 pinch"),
                Ingredient(name: "Marjoram", amount: "1,35 kg"),
                Ingredient(name: "Parsley", amount: "1 tsp"),
             ],
             steps: [
                Step(text: "Preheat the oven to 400 degrees F (200 degrees C)"),
                Step(text: "Place shrimp in a baking dish."),
                Step(text: "Combine bread crumbs, sherry, butter, garlic, salt, tarragon, and marjoram in a bowl. Sprinkle mixture on top of shrimp in the baking dish. Sprinkle parsley on top."),
                Step(text: "Bake in the preheated oven until golden brown for about 25 minutes."),
             ],
             duration: "40 minutes"),
    
    Recipe(name: "Milk cakes",
             isSpicy: false,
             ingredients: [
                Ingredient(name: "Flour", amount: "1 1/2 cups"),
                Ingredient(name: "Baking powder", amount: "1 tsp"),
                Ingredient(name: "Unsalted butter", amount: "1/2 cup"),
                Ingredient(name: "White sugar", amount: "1 cup"),
                Ingredient(name: "Eggs", amount: "5 large"),
                Ingredient(name: "Vanilla extract", amount: "1/2 tsp"),
                Ingredient(name: "Whole milk", amount: "2 cups"),
                Ingredient(name: "Sweetened condensed milk", amount: "1 can"),
                Ingredient(name: "Evaporated milk", amount: "1 can"),
                Ingredient(name: "Heavy whipping cream", amount: "1 1/2 cups"),
                Ingredient(name: "White sugar", amount: "1 cup"),
                Ingredient(name: "Vanilla extract", amount: "1 tsp"),
             ],
             steps: [
                Step(text: "Preheat the oven to 350 degrees F (175 degrees C). Grease and flour one 9x13 inch baking pan."),
                Step(text: "Sift the flour and baking powder together and set aside.."),
                Step(text: "Cream butter or margarine and the 1 cup of sugar together until fluffy. Add eggs and the ½ teaspoon vanilla extract; beat well."),
                Step(text: "Add the flour mixture to the butter mixture 2 tablespoons at a time; mix until well blended. Pour batter into the prepared pan."),
                Step(text: "Bake at 350 degrees F (175 degrees C) for 30 minutes. Pierce cake several times with a fork."),
                Step(text: "Combine the whole milk, condensed milk, and evaporated milk together. Pour over the top of the cooled cake."),
                Step(text: "Whip whipping cream, the remaining 1 cup of the sugar, and the remaining 1 teaspoon vanilla together until thick. Spread over the top of the cake."),
                Step(text: "Be sure and keep the cake refrigerated, enjoy!"),
             ],
             duration: "1 hour")
   
]
