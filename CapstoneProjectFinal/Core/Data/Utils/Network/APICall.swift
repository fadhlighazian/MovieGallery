//
//  APICall.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation

struct API {
  static let baseURL = "https://api.themoviedb.org/3/movie/"
}

protocol EndPoint {
  var url: String { get }
}

enum EndPoints {
  enum Gets: EndPoint {
    case nowPlaying
    case details
    
    public var url: String {
      switch self {
      case .nowPlaying: return "\(API.baseURL)now_playing?api_key=02b26526598c878b02d249743e3f3373&language=en-US&page=1"
      case .details: return "\(API.baseURL)"
      }
    }
  }
}
