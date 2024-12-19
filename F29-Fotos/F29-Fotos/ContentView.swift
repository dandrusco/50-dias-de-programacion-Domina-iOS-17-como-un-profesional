//
//  ContentView.swift
//  F29-Fotos
//
//  Created by Danilo Andrusco on 19-12-24.
//

//1. Vamos a necesitar fotos, por lo tanto copiaremos todas las fotos de del F09 Listas y las pegaremos en esta carpeta
//2. Entraremos en Assets y las reemplazaremos por numeros del 1 al 14
//3. Creamos una carpeta para el modelo
//4. Creamos un nuevo fichero dentro de esta carpeta que sea de Swift File llamdo Photo
import SwiftUI

struct ContentView: View {
    //7. Creamos la variable de fotos que sean de las fotos creadas anteriormente
    @State private var photos = samplePhotos
    //18. Ahora queremos que al señeccionar una imagen, esta se vaya al doc, por lo tanto necesitamos una variable de estado que sea un arrays de phpto en principio vacio
    @State private var selectedPhotos: [Photo] = []
    //19. Como las fotos tienen un ID, creamos la variable de estado, pero como opcional por si aun no se selecciona ninguna imagen
    @State private var selectedPhotoID: UUID?
    
    //29. Implementaremos el @Namespace para crear las animaciones
    @Namespace private var photoTransition
    
    
    var body: some View {
        //8. Creamos la vista en vertical
        VStack {
            //9. Como no sabemos la cantidad de imagenes al futuro, pondremos una ScrollView
            ScrollView{
                //10. Ahora una HStack
                HStack{
                    //11. Ponemos un titulo
                    Text("Fotos")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                    //12. Tiramos el titulo hacia arriba
                    Spacer()
                }
                //13. Creamos un LazyVGrid de columnas que sea adaptativo de unos 80 puntos
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                    //14. En el contenido recorreremos las imagenes de photo
                    ForEach(self.photos){ photo in
                        Image(photo.name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .cornerRadius(5)
                            //20. Para gestionar la seleccion de fotos necesitoamos un onTapGesture
                            .onTapGesture {
                                //21. La foto la añadimos a la selectedPhotos
                                self.selectedPhotos.append(photo)
                                //22. a selectedPhotoID le pasamos el ID de la foto actual
                                self.selectedPhotoID = photo.id
                                //23. Ahora que ya sabemos que foto se selecciono, deberemos eliminarla, en la variable IDX se quedara con los datos de la foto actual
                                if let idx = self.photos.firstIndex(where: { $0.id == self.selectedPhotoID }){
                                    //24. Ahora la eliminamos de photos
                                    self.photos.remove(at: idx)
                                }
                            }
                            //30. Debemos utilizar matchedGeometryEffect dandole el identificador de las imagenes del photoTransition
                            .matchedGeometryEffect(id: photo.id, in: self.photoTransition)
                    }
                    
                })
            }
            
            
            //15 DOCK INFERIOR: Creamos un ScrollViewReader que nos sirve para crear un deslizamiento automaticamente
            ScrollViewReader { scrollProxy  in
                //16 Creamos otra ScrollView que sea horizontal y false el showsIndicators
                ScrollView(.horizontal, showsIndicators: false){
                    //25. Ahora creamos un LazyHGrid pero de filas
                    LazyHGrid(rows: [GridItem()], content: {
                        //26 Ahora creamos otro ForEach pero de selectedPhotos para ir apilandolas abajo en el docs
                        ForEach(self.selectedPhotos){ photo in
                            Image(photo.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                                .frame(height: 100)
                                .cornerRadius(5)
                                //27 Creamos el .id pasandole el identificador de la foto, para que sea utilizado por la ScrollViewReader
                                .id(photo.id)
                                //28 programamos el onTapGesture pero al revez, añadiendo las fotos a photos y eliminandolas de selectedPhotos
                                .onTapGesture {
                                    self.photos.append(photo)
                                    self.selectedPhotoID = photo.id
                                    if let idx = self.selectedPhotos.firstIndex(where: {$0.id == photo.id}){
                                        self.selectedPhotos.remove(at: idx)
                                    }
                                }
                            //31. Debemos utilizar matchedGeometryEffect tambien aqui. pasandole el identificador de las imagenes del photoTransition
                                .matchedGeometryEffect(id: photo.id, in: self.photoTransition)
                            
                        }
                    })
                }
                //17. Configuramos la ScrollView
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                //33. Deberemos crear el onChange para que cuando cambie el selectedPhotoID, deberemos disponer del antiguo y nuevo ID
                .onChange(of: self.selectedPhotoID){ oldID, newID in
                    //34. Creamos una animacion
                    withAnimation {
                        //35.Usamos el scrollProxy pasandole el nuevo ID
                        scrollProxy.scrollTo(newID)
                    }
                }
            }
            
        }
        //32. despues del padding meteremos una animacion solo al selectedPhotoID
        .padding()
        .animation(.interactiveSpring(), value: self.selectedPhotoID)
    }
}

#Preview {
    ContentView()
}
