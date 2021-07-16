//
//  MovieModel.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation
import Combine

struct NowPlayingModel: Equatable, Identifiable, Hashable {
  let id: Int64
  let title: String
  let image: String
}
