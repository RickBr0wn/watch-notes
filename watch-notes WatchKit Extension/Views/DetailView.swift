//
//  DetailView.swift
//  watch-notes WatchKit Extension
//
//  Created by Rick Brown on 12/09/2021.
//

import SwiftUI

struct DetailView: View {
  let note: Note
  let count: Int
  let index: Int
  
  var body: some View {
    VStack(alignment: .center, spacing: 3) {
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      }
      .foregroundColor(.accentColor)
      
      Spacer()
      
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      
      Spacer()
      
      HStack(alignment: .center) {
        Image(systemName: "gear")
          .imageScale(.large)
        
        Spacer()
        
        Text("\(index + 1)/\(count)")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
      }
      .foregroundColor(.secondary)
    }
    .padding(3)
  }
}

struct DetailView_Previews: PreviewProvider {
  static let note = Note(id: UUID(), text: "A sample note.")
  
  static var previews: some View {
    DetailView(note: note, count: 5, index: 1)
  }
}
