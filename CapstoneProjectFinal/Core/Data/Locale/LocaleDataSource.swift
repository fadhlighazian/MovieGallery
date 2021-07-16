//
//  LocaleDataSource.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 28/02/21.
//

import Foundation
import RealmSwift
import Combine

// Protocol LocaleDataSource
protocol LocaleDataSourceProtocol: class {
  func getNowPlaying() -> AnyPublisher<[NowPlayingEntity], Error>
  func addNowPlaying(from movies: [NowPlayingEntity]) -> AnyPublisher<Bool, Error>
}

// Class LocaledataSource
final class LocaleDataSource: NSObject {
  private let realm: Realm?
  
  private init(realm: Realm?) {
    self.realm = realm
  }
  
  static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in return
    LocaleDataSource(realm: realmDatabase)
  }
}

// Implementasi LocaleDataSourceProtocol
extension LocaleDataSource: LocaleDataSourceProtocol {
  func getNowPlaying() -> AnyPublisher<[NowPlayingEntity], Error> {
    return Future<[NowPlayingEntity], Error> { completion in
      if let realm = self.realm {
        let movies: Results<NowPlayingEntity> = {
          realm.objects(NowPlayingEntity.self)
            .sorted(byKeyPath: "title", ascending: true)
        }()
        completion(.success(movies.toArray(ofType: NowPlayingEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func addNowPlaying(from movies: [NowPlayingEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            for movie in movies {
              realm.add(movie, update: .all)
            }
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
}

extension Results {
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
}
