//
//  ContentView.swift
//  watch-notes WatchKit Extension
//
//  Created by Rick Brown on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var notes: Array<Note> = Array()
  @State private var text: String = ""
  
  private func save() {
    dump(notes)
  }
  
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6.0) {
        TextField("Add a new note", text: $text)
        
        Button(action: {
          // Ensure the text variable is not empty
          guard text.isEmpty == false else { return }
          // Create a note using the input text
          let note = Note(id: UUID(), text: text)
          // Append the new note to the existing notes array
          notes.append(note)
          // Empty the input text variable
          text = ""
          // Save the notes array to local storage
          self.save()
        }, label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 42.0, weight: .semibold))
        })
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
        // .buttonStyle(BorderedButtonStyle(tint: .accentColor))
      }
      Spacer()
      
      Text("\(notes.count)")
    }
    .navigationTitle("Notes")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
