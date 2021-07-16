//
//  RemoteDataSource.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: class {
  func getNowPlaying() -> AnyPublisher<[NowPlaying], Error>
}

final class RemoteDataSource: NSObject {
  private override init() { }
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getNowPlaying() -> AnyPublisher<[NowPlaying], Error> {
    return Future<[NowPlaying], Error> { completion in
      if let url = URL(string: EndPoints.Gets.nowPlaying.url) {
        AF.request(url)
          .validate()
          .responseDecodable(of: NowPlayingResponse.self) { response in
            switch response.result {
            case .success(let value):
              completion(.success(value.result))
            case .failure:
              completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
  
}
