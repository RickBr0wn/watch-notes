//
//  CreditsView.swift
//  watch-notes WatchKit Extension
//
//  Created by Rick Brown on 12/09/2021.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack(spacing: 3) {
      Image("developer-no1")
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      HeaderView(title: "Credits")
      
      Text("Rick Brown")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      
      Text("iOS Developer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    }
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
