//
//  FavoriteView.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 19/02/21.
//

import SwiftUI

struct FavoriteView: View {
  
  let favorite = ["image 1", "image 2", "image 3", "image 4", "image 5"]
  let genres = ["Action", "Adventure", "Fantasy"]
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          ForEach(favorite, id: \.self) { items in
            HStack(alignment: .top) {
              Image(items)
                .resizable()
                .frame(width: 106, height: 159)
              VStack(alignment: .leading) {
                Text("Breaking Bad")
                  .font(.title3)
                  .fontWeight(.semibold)
                  .padding(.top, 3)
                Text("Released on Dec 17, 2021")
                  .font(.body)
                  .foregroundColor(.gray)
                  .padding(.top, 3)
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
            }.padding(.bottom)
          }
        }.padding(.horizontal)
      }
      .navigationBarTitle("Favorite Movie")
    }
  }
}

struct FavoriteView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteView()
  }
}
