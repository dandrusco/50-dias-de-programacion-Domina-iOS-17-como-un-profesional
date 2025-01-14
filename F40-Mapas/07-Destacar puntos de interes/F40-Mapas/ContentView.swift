//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    //9. Creamos una variable de estado para almacenar los resultados de las busquedas, que sea del tipo arrays de MKMapItem
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        Map(position: self.$position) {
            Annotation("Tu conductor te espera aquí",
                       coordinate: .towerbridge,
                       anchor: .bottom){
                ZStack{
                    Circle()
                        .foregroundStyle(.indigo.opacity(0.5))
                        .frame(width: 75, height: 75)
                    
                    Image(systemName: "car.rear.waves.up")
                        .symbolEffect(.variableColor)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            //12. Ahora deberemos agregar los restaurantes encontrados, para ello a traves de un ForEach recorreremos los resultados obtenidos para ir agregandolos a los marcadores
            ForEach(self.searchResults, id: \.self) { result in
                Marker(item: result)
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
        
            .onAppear{
                self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button(action:{
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .towerbridge, distance: 800, heading: 90, pitch: 40))
                        }
                    }) {
                        Text("Puente de la Torre")
                    }
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .bigben, distance: 500, heading: 150, pitch: 70))
                            //11. Aqui realizaremos la busqueda de restaurantes en bigben
                            search(location: .bigben, query: "restaurants")
                        }
                    }, label: {
                        Text("Big Ben")
                    })
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                }
            }
    }
    //1. Crearemos una funcion para las busquedas de puntos de interes, donde la location sea del tipo CLLocationCoordinate2D y quue la query de busqueda sea del tipo String
    private func search(location: CLLocationCoordinate2D, query: String) {
        
        //2. Creamos una peticion de busqueda de MKLocalSearch.Request()
        let request = MKLocalSearch.Request()
        //3. donde el request tiene la posibilidad de que el naturalLanguageQuery se asigne al predicado de busqueda
        request.naturalLanguageQuery = query
        //4. donde el request.resultTypes sea de tipo del punto de interes
        request.resultTypes = .pointOfInterest
        //5. Y que la regin de busqueda sea igual al MKCoordinateRegion pasandole la location con una latitus y longitud de un radio de 300 metros
        request.region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: 300,
                                            longitudinalMeters: 300)
        //6. lanzamos una tarea
        Task {
            //7. lanzamos la MKLocalSearch con la request planteada al inicio de la busqueda
            let search = MKLocalSearch(request: request)
            //8. la respuesta sera opcional para esperar el resultado de la busqueda
            let response = try? await search.start()
            //10. Y la respuesta recivida la guardamos en searchResults, de lo contrario con un arrays vacio
            self.searchResults = response?.mapItems ?? []
        }
        
    }
    
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let valparaiso = CLLocationCoordinate2D(latitude: -33.044, longitude: -71.62)
    
    static let manhattan = CLLocationCoordinate2D(latitude: 40.75, longitude: -73.98)
    
    static let bigben = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.1245)
    
    static let towerbridge = CLLocationCoordinate2D(latitude: 51.5055, longitude: -0.0754)
}
