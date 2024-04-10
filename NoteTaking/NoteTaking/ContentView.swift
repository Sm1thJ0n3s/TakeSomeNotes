//
//  ContentView.swift
//  NoteTaking
//
//  Created by StudentAM on 3/27/24.
//

import SwiftUI

struct Note: Equatable {
    var title: String
    var content: String
}

struct ContentView: View {
    
    @State var notes: [Note] = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                // Created to show a view of notes. Upon clicking on a note (this is where the navigation link comes into play), users can view the note more better.
                List {
                    ForEach(notes.indices, id: \.self) { index in
                        NavigationLink (destination: DetailNoteView(notes: $notes, noteIndex: index).navigationBarBackButtonHidden(true), label: {
                            
                            VStack(alignment: .leading) {
                                Text(notes[index].title)
                                    .font(.title)
                                    .bold(true)
                                Text(notes[index].content)
                            }
                        })
                    }
                    // Users are able to delete notes by sliding them.
                    .onDelete(perform: { indexSet in indexSet.forEach { index in
                                    deleteNote(offset: IndexSet(integer: index))
                                }
                            })
                    
                }
                // When the navigation link is pressed, users can create a new note.
                NavigationLink (destination: NoteMakingView(notes: $notes).navigationBarBackButtonHidden(true), label:{
                    Text("Create New Note")
                        .frame(width: 550, height: 30)
                        .padding(.top, 25)
                    }
                )
                .frame(width: 550, height: 20)
                .padding()
                .font(.system(size: 30))
                .background(.blue)
                .foregroundColor(.white)
                .ignoresSafeArea()
            }
            .navigationTitle("Notes")
        }
    }
    // This function helps perform the deletion of a note.
    func deleteNote (offset: IndexSet) {
        notes.remove(atOffsets: offset)
    }
    
    // For now, this may remain here but I will most likely get rid of this function
    func editNote(index: Int) {
            
    }
}

#Preview {
    ContentView()
}
