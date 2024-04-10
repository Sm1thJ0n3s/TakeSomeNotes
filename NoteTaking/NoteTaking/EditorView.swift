//
//  EditorView.swift
//  NoteTaking
//
//  Created by StudentAM on 4/9/24.
//

import SwiftUI

struct EditorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    var index: Int
    
    var body: some View {
        VStack {
            Text("Editing Note")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.title)
                .bold(true)
                
            // Allows user to change the title of the note
            TextField("Enter A Title", text: $notes[index].title)
                .frame(width: 330)
                .padding()
                .bold(true)
                .foregroundColor(.gray)
                .background(.gray.opacity(0.3))
                .cornerRadius(5)
                
            //Allows user to change the content of the note
            TextEditor(text: $notes[index].content)
                .frame(width: 330 , height: 450)
                .padding()
                .border(Color.gray.opacity(0.3), width: 10)
                .cornerRadius(10)
                
            // User can simply go back to the DetailNoteView once they are done editing.
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

#Preview {
    EditorView(notes: .constant([]), index: 0)
}
