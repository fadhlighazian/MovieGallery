//
//  HomeInteractor.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation
import Combine

// Protocol Interactor/UseCase
protocol HomeUseCase {
  func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error>
}

// Implementasi protocol Interactor/UseCase
class HomeInteractor: HomeUseCase {

  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error> {
    return repository.getNowPlaying()
  }

}

