//
//  RemoteDataSource.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation

// NowPlaying
struct NowPlayingResponse: Decodable, Hashable {
  let result: [NowPlaying]
}

struct NowPlaying: Decodable, Hashable {
  let id: Int64
  let title: String?
  let image: String?
  
  private enum CodingKeys: String, CodingKey {
    case id, title
    case image = "poster_path"
  }
}
