//
//  HomeView.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 15/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
  let data: [ModelMovie] = [
    ModelMovie(id: 1, image: "image 1"),
    ModelMovie(id: 2, image: "image 2"),
    ModelMovie(id: 3, image: "image 3"),
    ModelMovie(id: 4, image: "image 4"),
    ModelMovie(id: 5, image: "image 5"),
    ModelMovie(id: 6, image: "image 6"),
    ModelMovie(id: 7, image: "image 7"),
    ModelMovie(id: 8, image: "image 8"),
    ModelMovie(id: 9, image: "image 9")
  ]
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    NavigationView {      
      VStack(alignment: .leading) {
        if presenter.loadingState {
          VStack {
            ActivityIndicator()
            Text("Loading...")
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            // Row 1
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(self.presenter.nowPlaying, id: \.id) { items in
                  VStack {
                    AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/original\(items.image)"))
                      .indicator(SDWebImageActivityIndicator.whiteLarge)
                      .resizable()
                      .frame(width: 150, height: 225)
                    Text("Breaking Bad")
                  }
                }
              }
            }            
          }
        }
      }.padding(.horizontal)
      .navigationBarTitle("The Movie")
    }.onAppear {
      if self.presenter.nowPlaying.count == 0 {
        self.presenter.getNowPlaying()
      }
    }
  }
}
