//
//  DetailScreen.swift
//  recipesApp
//
//  Created by Pierre Juarez U. on 11/01/23.
//

import SwiftUI

struct DetailScreen: View {
  var body: some View {
    ZStack {
      Color("background-color")
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        Image("recipe-01")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .edgesIgnoringSafeArea(.top)
        
        DescriptionView()
          .offset(y: -40)
      }
      
      HStack {
        Text("S/. 30.00")
          .font(.title)
          .foregroundColor(Color.white)
        
        Spacer()
        
        Button(action: {}, label: {
          Text("Add to cart")
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10.0)
            .foregroundColor(Color("text-color"))
          
        })
      }
      .padding()
      .padding(.horizontal)
      .background(Color("text-color"))
      /** Right now there is no direct method to apply a corner radius to specific side on SWIFTUI
       That's only we created our own extension */
      .cornerRadius(50, corners: .topLeft)
      .frame(maxHeight: .infinity, alignment: .bottom)
      
      
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
  var body: some View {
    VStack(alignment: .leading){
      Text("Fetuccine Alfredo")
        .font(.title)
        .fontWeight(.bold)
      
      HStack(spacing: 4){
        ForEach(0 ..< 5) { item in
          Image("star")
        }
        Text("(4.9)")
          .opacity(0.5)
          .padding(.leading, 8)
        Spacer()
      }
      
      Text("Description")
        .fontWeight(.medium)
        .padding(.vertical, 8)
      
      Text("Fettuccine Alfredo is a classic Italian pasta dish made with rich, creamy sauce of butter and parmesan cheese, served over tender noodles. Perfect comfort food!")
        .lineSpacing(8.0)
        .opacity(0.6)
      
      HStack(alignment: .top){
        VStack(alignment: .leading){
          Text("Features")
            .fontWeight(.semibold)
            .padding(.bottom, 4)
          Text("Creamy")
            .opacity(0.6)
          Text("Rich")
            .opacity(0.6)
          Text("Buttery")
            .opacity(0.6)
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        VStack(alignment:.leading){
          Text("Ingredients")
            .fontWeight(.semibold)
          Text("Fettuccine, cup,")
            .opacity(0.6)
          Text("pepper, parsley")
            .opacity(0.6)
        }.frame(maxWidth: .infinity, alignment: .leading)
        
      }
      .padding(.vertical)
      
      HStack(alignment: .bottom){
        VStack(alignment: .leading){
          Text("Colors")
            .fontWeight(.bold)
          
          HStack {
            ColorDotView(color: .white)
            ColorDotView(color: .black)
            ColorDotView(color: Color("text-color"))
          }
          
        }
        
        Spacer()
        
        VStack(alignment: .leading){
          Text("Quantity")
            .fontWeight(.semibold)
          
          HStack {
            Button(action: {}){
              Image(systemName: "minus")
                .padding(.all, 8)
            }
            .frame(width: 30, height: 30)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
            .foregroundColor(Color("text-normal"))
            
            Text("1")
              .font(.title3)
              .fontWeight(.semibold)
              .padding(.horizontal, 8)
            
            
            Button(action: {}){
              Image(systemName: "plus")
                .padding(.all, 8)
            }
            //.frame(width: 30, height: 30)
            .background(Color("text-color"))
            .clipShape(Circle())
            .foregroundColor(Color.white)
          }
          
        }
        
      }.padding(.bottom, 50)
      
    }
    .padding()
    .padding(.top)
    .background(Color("background-color"))
    .cornerRadius(40.0)
  }
}

struct ColorDotView: View {
  let color: Color
  var body: some View {
    color
      .frame(width: 24, height: 24)
      .clipShape(Capsule())
  }
}
