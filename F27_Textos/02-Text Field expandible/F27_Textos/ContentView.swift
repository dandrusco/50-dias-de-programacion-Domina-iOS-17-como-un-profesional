//
//  ContentView.swift
//  F27_Textos
//
//  Created by Danilo Andrusco on 18-12-24.
//

//1. Creamos un nuevo fichero de SwiftUI llamado ExpandableTextField
import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    @State private var wordCount: Int = 0
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            TextEditor(text: self.$text)
                .font(.title2)
                .lineSpacing(24)
                .textInputAutocapitalization(.sentences)
                .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.all)
                .padding(.top, 24)
                .onChange(of: self.text) {
                    let words = self.text.split { $0 == " " || $0.isNewline}
                    self.wordCount = words.count
                }
            Text("\(self.wordCount) palabras")
                .font(.headline)
                .foregroundStyle(.secondary)
                .padding(.trailing)
        }
    }
}

#Preview {
    ContentView()
}
