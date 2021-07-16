//
//  Injection.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 26/02/21.
//

import Foundation
import RealmSwift

// Kelas yg bertugas menangani menyediakan repository
final class Injection: NSObject {
  
  // Pemanggilan MealRepository. Dengan ini kita bisa membagikan repository ke Interactor agar diteruskan Presenter
  private func provideRepository() -> MovieRepositoryProtocol {
    let realm = try? Realm()
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    return MovieRepostory.sharedInstance(remote, locale)
  }
  
  // Function untuk menyediakan HomeUseCase ke HomePresenter
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
}
