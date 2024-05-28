//
//  CourseDetailView.swift
//  F16-BottomSheet
//
//  Created by Danilo Andrusco on 28-05-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    var body: some View {
        //6. Crearemos un VStack
        VStack{
            //7. Vamos a dividirnos en 4 estructuras que deberemos crear
            HandleBar()
            TitleBar()
            HeaderView()
            DetailView()
        }
    }
}

//8. Dejaremos declaradas las 4 estructuras
struct HandleBar: View {
    var body: some View {
        //9. De momento para que no nos de error le meteremos una EmptyView
        EmptyView()
    }
}

//10. Realizaremos lo mismo para las otras 3 restantes
struct TitleBar: View {
    var body: some View {
        EmptyView()
    }
}

struct HeaderView: View {
    var body: some View {
        EmptyView()
    }
}

struct DetailView: View {
    var body: some View {
        EmptyView()
    }
}

#Preview {
    CourseDetailView()
}
