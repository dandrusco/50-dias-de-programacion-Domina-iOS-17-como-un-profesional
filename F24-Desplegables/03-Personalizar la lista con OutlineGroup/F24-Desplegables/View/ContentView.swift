//
//  ContentView.swift
//  F24-Desplegables
//
//  Created by Danilo Andrusco on 11-12-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Para meter un OutlineGroup deberemos cerrar la lista con {}
        List {
            //3. Programaremos un ForEach para el enabezado
            ForEach(learningPaths){ path in
                //4. Creamos una seccion donde la cabeza sera una HStack
                Section(header: HStack{
                    //5. Le pondemos la imagen y el texto como en la anterior, pero en vez de item sera path
                    Image(path.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 40)
                    
                    Text(path.name)
                        .font(.system(.subheadline))
                        .fontWeight(.heavy)
                    
                    
                }
                //8. Meteremos un pading para que respire mejor
                    .padding()
                ) {
                    //6. Identamos el punto 2
                    //2. Le pasamos el OutlineGroup para poder tener mas control sobre la aparaciencia, por ejempplo meterle un encabezado
                    OutlineGroup(learningPaths, children: \.submenuitems){ item in
                        HStack{
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 40)
                            Text(item.name)
                                .font(.system(.subheadline))
                                .fontWeight(.heavy)
                        }
                    }
                    //7. Y cerramos los }} que nos faltan
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
