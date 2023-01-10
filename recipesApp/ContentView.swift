//
//  ContentView.swift
//  recipesApp
//
//  Created by Pierre Juarez U. on 7/01/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedIndex: Int = 0
  private let categories = ["All","Apps", "Mains", "Sids", "Dess", "Dris","Other"]
  private let recipeNames = ["Fetuccine Alfredo", "Chivito uruguayo", "Walnut Roll", "Fresh sardines"]
    var body: some View {
        ZStack {
          Color("background-color")
            .edgesIgnoringSafeArea(.all)
         
          ScrollView {
            VStack(alignment: .leading){
              AppBarView()
              TagLineView()
                .padding()
              SearchAndScanView()
              
              ScrollView(.horizontal, showsIndicators: false){
                HStack{
                  ForEach(0 ..< categories.count) { i in
                    // If index(i) == 1 then isActive is true
                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                      .onTapGesture {
                        selectedIndex = i
                      }
                  }
                }.padding()
              }
              
              Text("Popular")
                .font(.custom("Inter-Bold", size: 26))
                .padding(.horizontal)
                .foregroundColor(Color("text-normal"))
              
              ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                  ForEach(0 ..< 4) { index in
                    ProductCardView(image: Image("recipe-0\(index + 1)"), size: 210, recipeName: recipeNames[index])
                  }
                }.padding(.trailing)
              }
              .padding(.leading)
              
              Text("Best")
                .font(.custom("Inter-Bold", size: 26))
                .padding(.horizontal)
                .foregroundColor(Color("text-normal"))
              
              ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                  ForEach(0 ..< 4) { index in
                    ProductCardView(image: Image("recipe-0\(index + 1)"), size: 180, recipeName: recipeNames[index])
                  }
                }.padding(.trailing)
              }
              .padding(.leading)
               
              
            }
          }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
  var body: some View {
    HStack {
      Button(action: {}) {
        Image("menu")
          .padding()
          .background(Color(.white))
          .cornerRadius(10.0)
      }
      Spacer()
      Button(action: {}){
        Image("profile")
          .resizable()
          .frame(width: 42, height: 42)
          .cornerRadius(10.0)
      }
    }.padding(.horizontal)
  }
}

struct TagLineView: View {
  var body: some View {
    Text("Find the \nbest")
      .font(.custom("Inter-Regular", size: 32))
      .foregroundColor(Color("text-color"))
    +
    Text(" RECIPES")
      .font(.custom("Inter-Bold", size: 32))
      .foregroundColor(Color("text-color"))
  }
}

struct SearchAndScanView: View {
  @State private var search : String = ""
  var body: some View {
    HStack {
      HStack {
        Image("search")
          .padding(.trailing, 8)
        TextField("Search recipe", text: $search)
      }
      .padding(.all, 20)
      .background(Color(.white))
      .cornerRadius(10.0)
      .padding(.trailing)
      
      
      Button(action:{}){
        Image("qr")
          .resizable()
          .frame(width: 25, height: 25)
          .padding()
          .background(Color("text-color"))
          .cornerRadius(10.0)
      }
      
    }.padding(.horizontal)
  }
}

struct CategoryView: View {
  let isActive: Bool
  let text: String
  var body: some View {
    VStack(alignment: .leading, spacing: 0){
      Text(text)
        .font(.system(size: 18))
        .fontWeight(.medium)
        .foregroundColor(isActive ? Color("text-color") : Color.black.opacity(0.5))
      
      if(isActive){
        Color("text-color")
          .frame(width: 15, height: 2)
          .clipShape(Capsule())
      }
    }
    .padding(.trailing)
  }
}

struct ProductCardView: View {
  let image: Image
  let size: CGFloat
  let recipeName: String
  var body: some View {
    VStack {
      image
        .resizable()
        .frame(width: size, height: 200 * (size/210))
        .cornerRadius(20.0)
      
      Text(recipeName)
        .font(.title3)
        .fontWeight(.bold)
        .foregroundColor(Color("text-normal"))
      
      HStack(spacing: 2){
        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
          Image("star")
        }
        Spacer()
        Text("S/. 30.00")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(Color("text-normal"))
        
      }
      
    }
    .frame(width: size)
    .padding()
    .background(Color.white)
    .cornerRadius(20.0)
  }
}
