//
//  MovieMapper.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation

final class NowPlayingMapper {
  
  static func mapMovieResponseToDomains(
    input movieResponses: [NowPlaying]
  ) -> [NowPlayingModel] {
    return movieResponses.map { result in
      return NowPlayingModel(
        id: result.id ,
        title: result.title ?? "Unknown",
        image: result.image ?? "Unknown"
      )
    }
  }
  
  static func mapMovieResponsesToEntities(
    input movieResponses: [NowPlaying]
  ) -> [NowPlayingEntity] {
    return movieResponses.map { result in
      let newMovie = NowPlayingEntity()
      newMovie.id = result.id 
      newMovie.title = result.title ?? "Unknow"
      newMovie.image = result.image ?? "Unknow"
      return newMovie
    }
  }
   
  static func mapMovieEntitiesToDomains(
    input movieEntities: [NowPlayingEntity]
  ) -> [NowPlayingModel] {
    return movieEntities.map { result in
      return NowPlayingModel(
        id: result.id,
        title: result.title,
        image: result.image
      )
    }
  }
  
}
