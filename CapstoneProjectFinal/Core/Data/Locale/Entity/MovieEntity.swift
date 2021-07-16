//
//  MovieEntity.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 28/02/21.
//

import Foundation
import RealmSwift

// Model untuk Locale (sbgai table/graph)
class NowPlayingEntity: Object {
  @objc dynamic var id: Int64 = 0
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
