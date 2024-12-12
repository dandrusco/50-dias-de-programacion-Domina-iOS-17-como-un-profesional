//
//  PhotosView.swift
//  F25-Colecciones
//
//  Created by Danilo Andrusco on 12-12-24.
//

import SwiftUI

//2. Nos llevaremos la carpeta de las fotos del F09 listas y la pegaremos en esta carpeta
//3. Como ahora tenemos fotos deberemos crear un modelo de datos, para ello creamos un nuevo fichero de swift que llamaremos Photo
struct PhotosView: View {
    //7. Vamos a definir un estado de layaut de tipo GridItem
    @State var layout : [GridItem] = [GridItem()]
    
    var body: some View {
        //8. Para que sea navegable la meteremos en una NavigationStack
        NavigationStack {
            //9. Creamos unas ScrollView vertical
            ScrollView(.vertical){
                //10. utilizaremos el LazyVGrid, pasandole la comumna (por que es en vertical) el layout, alineado al centro y con un espaciado de 16 puntos
                LazyVGrid(columns: self.layout, alignment: .center, spacing: 16) {
                    //11. Recorremos las fotos segun su indice
                    ForEach(photos.indices, id: \.self){ idx in
                        //12. Pintamos las fotos
                        Image(photos[idx].name)
                            .resizable()
                            .scaledToFill()
                            //13. Configuramos el frame a una minima anchura en 0 y la maxima anchura infinita
                            .frame(minWidth: 0, maxWidth: .infinity)
                            //14. Le meteremos otro frame para configurar el numero de columnas que se muestre por pantalla
                            .frame(height: self.layout.count == 1 ? 220: 120)
                            //15. Las fotos tendran ese efecto redondeado
                            .cornerRadius(16)
                            //16. Le metemos sombras
                            .shadow(color: Color.primary.opacity(0.4), radius: 4)
                    }
                    
                }
                //17. Le metemos un padding a todo de 16 puntos
                .padding(.all, 16)
                //18. Cuando cambiemos de pantalla y me metemos una animacion a la layout
                .animation(.interactiveSpring(), value: self.layout.count)
            }
            //19. Le metemos un titulo
            .navigationTitle("Cursos de Frogames")
            //20. Configuraremos una toolbar para meter un boton
            .toolbar{
                //21. Pondremos un ToolbarItem alineado arriba a la derecha
                ToolbarItem(placement: .topBarTrailing){
                    //22. Ponemos el boton
                    Button {
                        //23.El layout sera igual al arrays de repetir el GridItem(.flexible()), y el count sera layout.count%4+1 para ir aumentando las columnas en una en una hasta llegar a la 4/
                        self.layout = Array(repeating: GridItem(.flexible()), count: self.layout.count%4+1)
                    } label: {
                        //24. Pondremos una imagen de cuadrados
                        Image(systemName: "square.grid.2x2.fill")
                            .font(.title)
                    }
                    //25. el tint representa al color del boton
                    .tint(.teal)
                }
            }
        }
    }
}

#Preview {
    PhotosView()
}
