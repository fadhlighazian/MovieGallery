//
//  DummyData.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 16/02/21.
//

import Foundation

struct ModelMovie: Identifiable {
  let id: Int
  let image: String
  
  init(id: Int, image: String) {
    self.id = id
    self.image = image
  }
}
