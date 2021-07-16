//
//  HomePresenter.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private let homeUseCase: HomeUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var nowPlaying: [NowPlayingModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getNowPlaying() {
    loadingState = true
    homeUseCase.getNowPlaying()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { movies in
        self.nowPlaying = movies
      })
      .store(in: &cancellables)
  }
}
