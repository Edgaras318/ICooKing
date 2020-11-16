import SwiftUI

struct RecipeDetail: View {
    @State private var zoomed = false
    var sandwich: Recipe
    
    var body: some View {
        
        ZStack {
            
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer(minLength: 0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                
                .onTapGesture {
                    withAnimation{
                        self.zoomed.toggle()
                    }
                }
           
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Duration: \(sandwich.duration)")
                        
                    Text("\(sandwich.ingredientCount) ingredients")
                }
                Spacer()
                NavigationLink(
                    destination: RecipeRecipe(store: testStore, sandwich: sandwich),
                    label: {
                        Text("Start")
                            .fontWeight(.bold)
                            .padding(10)
                            .frame(width: 70.0)
                            
                            .foregroundColor(.white);
                        Image(systemName: "play.fill")
                            .font(.title)
                        Text(" ")
                    })
                .foregroundColor(.white)
                    .background(Color.themeAccent)
                .cornerRadius(15)
                
//                Button(action: {
//                    print("Start tapped!")
//                }) {
//                    HStack {
//                        Image(systemName: "play.fill")
//                            .font(.title)
//                        Text("Start")
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                    }
//                    .padding()
//                    .foregroundColor(.blue)
//                }
                
                
                Spacer()
            }
            
            Spacer()
            
//            if sandwich.isSpicy && !zoomed {
//                HStack {
//                    Spacer()
//                    Label("Spicy", systemImage: "flame.fill")
//                    Spacer()
//                }
//                .padding(.all)
//                .font(Font.headline.smallCaps() )
//                .background(Color.red)
//                .foregroundColor(.yellow)
//                .transition(.move(edge: .bottom))
//            }
            
            List(sandwich.ingredients)
            { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(ingredient.amount)
                            .foregroundColor(.themeForeground)

                           }
            }
            .background(Color.themeBackground)
            
        }
        .navigationBarTitle(sandwich.name, displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    
    }
}
    
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RecipeDetail(sandwich: testData[0] )
                    .preferredColorScheme(.dark)
            }
            NavigationView {
                RecipeDetail(sandwich: testData[1] )
            }
            NavigationView {
                RecipeDetail(sandwich: testData[2] )
            }
            NavigationView {
                RecipeDetail(sandwich: testData[3] )
            }
        }
    }
}
