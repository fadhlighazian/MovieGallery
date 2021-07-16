//
//  MovieRepository.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
  func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error>
}

final class MovieRepostory: NSObject {
  
  typealias MovieInstance = (RemoteDataSource, LocaleDataSource) -> MovieRepostory
  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocaleDataSource
  
  private init(remote: RemoteDataSource, locale: LocaleDataSource) {
    self.remote = remote
    self.locale = locale
  }
  
  static let sharedInstance: MovieInstance = { remoteRepo, localeRepo in
    return MovieRepostory(remote: remoteRepo, locale: localeRepo)
  }
}

extension MovieRepostory: MovieRepositoryProtocol {
  
  func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error> {
    return self.locale.getNowPlaying()
      .flatMap { result -> AnyPublisher<[NowPlayingModel], Error> in
        if result.isEmpty {
          return self.remote.getNowPlaying()
            .map { NowPlayingMapper.mapMovieResponsesToEntities(input: $0) }
            .flatMap { self.locale.addNowPlaying(from: $0) }
            .filter { $0 }
            .flatMap { _ in self.locale.getNowPlaying()
              .map { NowPlayingMapper.mapMovieEntitiesToDomains(input: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return self.locale.getNowPlaying()
            .map { NowPlayingMapper.mapMovieEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
}
