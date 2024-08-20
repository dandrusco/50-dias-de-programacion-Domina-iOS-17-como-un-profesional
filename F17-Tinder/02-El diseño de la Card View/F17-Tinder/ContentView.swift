//
//  ContentView.swift
//  F17-Tinder
//
//  Created by Danilo Andrusco on 20-08-24.
//

//1. Crearemos una vista de SwiftUI que llamaremos CardView
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //8. Eliminamos todo esto:
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")*/
            
            //9. Meteremos una variable que sea igual al curso en la posicion 0
            let course = courses[0]
            //10. Ahora se la pasamos a la CardView
            CardView(name: course.name, image: course.image)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
