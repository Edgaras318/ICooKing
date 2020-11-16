//
//  RecipeFinish.swift
//  iOS
//
//  Created by Josh on 05/11/2020.
//

import SwiftUI

struct RecipeFinish: View {
    @ObservedObject var store: RecipeStore
    var sandwich: Recipe
    
    var body: some View {
        Text("🥳")
            .font(.title)
            .fontWeight(.bold)
        Text("Congratulations! You have succesfully finished cooking " + sandwich.name + "!")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        Text("Enjoy your meal!")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        NavigationLink(
            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
            label: {
                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
            })
    }
}

struct RecipeFinish_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFinish(store: testStore, sandwich: testData[0])
    }
}
