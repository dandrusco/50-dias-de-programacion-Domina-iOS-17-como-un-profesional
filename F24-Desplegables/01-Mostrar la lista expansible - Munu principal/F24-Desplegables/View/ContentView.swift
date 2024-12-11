//
//  ContentView.swift
//  F24-Desplegables
//
//  Created by Danilo Andrusco on 11-12-24.
//

//1. Nos vamos a ir a la carpeta F09-Listas y copiaremos toda la carpeta Assets.xcassets para traernos la imagenes
//2. EN recursos hay una carpeta llama Rutas, en ella hay 3 archivos que deberemos arrastras hacia el Assets
//3. COmo ya es costumbre creamos 2 carpetas, una para Model y la otra para las vistas
//4. La ContentView va dentro de la carpeta View
//5. En el Model creamos un nuevo fichero de swift llamado MenuItems
import SwiftUI

struct ContentView: View {
    var body: some View {
        //12. Programaremos la Lista  donde le pasaremos los learningPaths (munu principal)
        List(learningPaths){ item in
            //13 Creamos una HStack
            HStack{
                //14. llamamos a la imagen
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 40)
                //15. llamamos el texto
                Text(item.name)
                    .font(.system(.subheadline))
                    .fontWeight(.heavy)
            }
        }
    }
}

#Preview {
    ContentView()
}
