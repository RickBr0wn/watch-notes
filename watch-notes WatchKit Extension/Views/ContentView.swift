//
//  ContentView.swift
//  watch-notes WatchKit Extension
//
//  Created by Rick Brown on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var notes: Array<Note> = Array<Note>()
  @State private var text: String = ""
  
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  func save() {
    // dump(notes)
    
    do {
      // 1. Convert the notes array to data using JSONEncoder
      let data = try JSONEncoder().encode(notes)
      // 2. Create a new URL to save the file using the getDocumentDirectory
      let url = getDocumentDirectory().appendingPathComponent("notes")
      // 3. Write the data to the given URL
      try data.write(to: url)
    } catch {
      print("Saving data has failed!")
    }
  }
  
  func load() {
    DispatchQueue.main.async {
      do {
        // 1. Get the notes URL path
        let url = getDocumentDirectory().appendingPathComponent("notes")
        // 2. Create a new property for the data
        let data = try Data(contentsOf: url)
        // 3. Decode the data
        notes = try JSONDecoder().decode(Array<Note>.self, from: data)
      } catch {
        // Do nothing
      }
    }
  }
  
  func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
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
      
      if notes.count >= 1 {
        List {
          ForEach(0..<notes.count, id: \.self) { i in
            HStack {
              Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
              Text(notes[i].text)
                .lineLimit(1)
                .padding(.leading, 5)
            }
          }
          .onDelete(perform: delete)
        }
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray.opacity(0.25))
          .padding(25)
        
        Spacer()
      }
    }
    .navigationTitle("Notes")
    .onAppear(perform: load)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

