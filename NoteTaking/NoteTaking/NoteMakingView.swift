//
//  NoteMakingView.swift
//  NoteTaking
//
//  Created by StudentAM on 3/27/24.
//

import SwiftUI

struct NoteMakingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    @State var title: String = ""
    @State var note: String = ""
    
    var body: some View {
        
        
            ZStack {
                VStack {
                    Text("New Note")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .font(.title)
                        .bold(true)
                    
                    // The title of the new note
                    TextField("Enter A Title", text: $title)
                        .frame(width: 330)
                        .padding()
                        .bold(true)
                        .foregroundColor(.gray)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(5)
                    
                    // The content of the new note.
                    TextEditor(text: $note)
                        .frame(width: 330 , height:550)
                        .padding()
                        .border(Color.gray.opacity(0.3), width: 10)
                        .cornerRadius(10)
                    
                    HStack {
                        // If users wants to create the note, they must have a title and content otherwise, it won't be created.
                        Button(action: {
                            createNote()
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Make New Note")
                        })
                        .frame(width: 155, height: 55)
                        .font(.system(size: 20))
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        // Allows users to go back to the content view. Although, the create new note button has the same function.
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Go Back")
                        })
                        .frame(width: 155, height: 55)
                        .font(.system(size: 20))
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
        }
    }
    // The function that checks if the new note is viable for creation.
    func createNote () {
        let newNote = Note(title: title, content: note)
        if title.isEmpty || note.isEmpty {
            return
        } else {
            print(newNote)
            notes.append(newNote)
        }
    }
}

#Preview {
    NoteMakingView(notes: .constant([]))
}
