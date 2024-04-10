//
//  DetailNoteView.swift
//  NoteTaking
//
//  Created by StudentAM on 3/27/24.
//

import SwiftUI
// This view is meant to be for a more better read of the note
struct DetailNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    var noteIndex: Int
    @State private var isPresentingEditorView = false
    
    var body: some View {
        VStack {
            Text(notes[noteIndex].title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 50))
                .font(.title)
                .bold(true)
                .padding()
            
            Text(notes[noteIndex].content)
                .padding()
                .frame(width: 350, height: 600, alignment: .topLeading)
                .background(.gray.opacity(0.3))
                .padding(.top, 0)
                .cornerRadius(10)
            
            HStack {
                // Sends the user to the EditorView. This allows the user to change the note that has already been created.
                Button(action: {
                    isPresentingEditorView = true
                }, label: {
                    Text("Edit Note")
                })
                .frame(width: 155, height: 55)
                .font(.system(size: 20))
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .sheet(isPresented: $isPresentingEditorView) {
                    EditorView(notes: $notes, index: noteIndex)
                }
                
                // The user goes back to the ContentView upon pressing this button.
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
    func printInfo () {
        print("Note #\(noteIndex): ")
        print("Note Title: \(notes[noteIndex].title)")
        print("Note: \(notes[noteIndex].content)")
    }
}

#Preview {
    DetailNoteView(notes: .constant([]), noteIndex: 0)
}
