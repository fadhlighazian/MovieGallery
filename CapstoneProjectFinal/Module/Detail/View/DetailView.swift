//
//  DetailView.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 16/02/21.
//

import SwiftUI

struct DetailView: View {
  let genres = ["Action", "Adventure", "Fantasy"]
  let companies = ["DC Entertainment", "Warner Bros", "DC Comics", "The Stone Quarry"]
  let languages = ["English", "Spanish", "Russian"]
  let countries = ["United States of America", "United Kingdom", "Spain"]
  let casts = ["cast 1", "cast 2", "cast 3", "cast 1"]
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          
          Image("backdrop")
            .resizable()
            .frame(height: 220)
            .scaledToFit()
            .padding(.bottom)
          
          // Top Section
          VStack(alignment: .leading) {
            Text("Wonder Worman 1984")
              .font(.title2)
              .fontWeight(.bold)
            Text("Released on Dec 17, 2021")
              .font(.body)
              .foregroundColor(.gray)
            HStack(alignment: .bottom) {
              Image("star")
              Text("7.8")
                .font(.title3)
                .fontWeight(.bold)
            }
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(genres, id: \.self) { items in
                  Text(items)
                    .foregroundColor(.gray)
                }
              }
            }
          }
          
          // Cast Section
          VStack(alignment: .leading) {
            Text("Cast and Crew")
              .fontWeight(.bold)
              .titleStyle()
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(casts, id: \.self) { items in
                  VStack {
                    Image(items)
                      .resizable()
                      .frame(width: 106, height: 106)
                    Text("Keanu Reeves")
                  }.padding(.trailing, 5)
                }
              }
            }
          }
          // Sinopsis Section
          VStack(alignment: .leading) {
            Text("Overview")
              .fontWeight(.bold)
              .titleStyle()
            Text("Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.")
              .font(.body)
              .foregroundColor(.gray)
          }
          // Languages Section
          VStack(alignment: .leading) {
            Text("Spoken Languages")
              .fontWeight(.bold)
              .titleStyle()
            ScrollView(.vertical, showsIndicators: false) {
              VStack(alignment: .leading) {
                ForEach(languages, id: \.self) { items in
                  Text(items)
                    .foregroundColor(.gray)
                }
              }
            }
          }
          // Companies Section
          VStack(alignment: .leading) {
            Text("Companies")
              .fontWeight(.bold)
              .titleStyle()
            ScrollView(.vertical, showsIndicators: false) {
              VStack(alignment: .leading) {
                ForEach(companies, id: \.self) { items in
                  Text(items)
                    .foregroundColor(.gray)
                }
              }
            }
          }
          // Production Countries Section
          VStack(alignment: .leading) {
            Text("Production Countries")
              .fontWeight(.bold)
              .titleStyle()
            ScrollView(.vertical, showsIndicators: false) {
              VStack(alignment: .leading) {
                ForEach(countries, id: \.self) { items in
                  Text(items)
                    .foregroundColor(.gray)
                }
              }
            }
          }
          
        }
      }.padding(.horizontal)
      .navigationBarTitle("Detail Movie")
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView()
  }
}

extension View {
  func titleStyle() -> some View {
    self.modifier(GeneralTitle())
  }
}

struct GeneralTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title2)
      .padding(.top)
      .padding(.bottom, 4)
  }
}
