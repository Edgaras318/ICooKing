import SwiftUI

struct ContentView: View {
    @ObservedObject var store: RecipeStore
    
//    init() {
//        UITableView.appearance().backgroundColor = .green // Uses UIColor
//       }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.themeBackground
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    
                    ForEach(store.recipes) { sandwich in
                        RecipeCell(sandwich: sandwich)
                    }
                    //.onMove(perform: moveRecipees)
                    //.onDelete(perform: deleteRecipees)
                    
                    
                    HStack {
                        Spacer()
                        Text("\(store.recipes.count) Recipes")
                            .foregroundColor(Color(red: 0.3, green: 0.7, blue: 0.0))
                        Spacer()
                    }
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Recipes")
            //.foregroundColor(Color(red: 0.3, green: 0.7, blue: 0.0))
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("👑ICooKing")
                            .font(.title)
                            .foregroundColor(.themeForeground)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            //.background(Color.red)
                            
                    }
                }
            }
            
            
            //{      // these appear at bottom of List - NOT Top
                //Button("Add", action: makeRecipe)
                //Spacer()
                //EditButton()
            //}
            
            //Image("Recipe cartoon")       // for iPad/Mac - the right 2nd view
        }
        
    }
    
//    func makeRecipe() {
//        withAnimation {
//            store.recipes.append(Recipe(name: "Patty melt",
//                ingredientCount: 3 ))
//        }
//    }
    
    func moveRecipees(from: IndexSet, to: Int) {
        withAnimation {
            store.recipes.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteRecipees(offsets: IndexSet) {
        withAnimation {
            store.recipes.remove(atOffsets: offsets)
        }
    }
    
}



struct RecipeCell: View {
    var sandwich: Recipe      // passed in just ONE sandwich
    
    var body: some View {
        NavigationLink( destination: RecipeDetail(sandwich: sandwich)) {
            
            Image(sandwich.thumbnailName)
                .resizable()        // our thumbnails are not all the same size
                .aspectRatio(contentMode: .fit )
                .cornerRadius(8)
                .frame(width: 50, height: 50 )
            
            
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.3, green: 0.7, blue: 0.0))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
            .preferredColorScheme(.light)
        ContentView(store: testStore)
            .preferredColorScheme(.dark)
    }
}
