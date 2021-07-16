//
//  SearchView.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 19/02/21.
//

import SwiftUI

struct SearchView: View {
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          Text("Search Movie")
        }
      }
      .navigationBarTitle("Search Movie")
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
