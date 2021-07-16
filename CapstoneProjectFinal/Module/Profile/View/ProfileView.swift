//
//  ProfileView.swift
//  CapstoneProjectFinal
//
//  Created by Ghazian Fadhli Fakhrusy on 19/02/21.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Text("Profile")
      }
      .navigationBarTitle("Profile Developer")
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
