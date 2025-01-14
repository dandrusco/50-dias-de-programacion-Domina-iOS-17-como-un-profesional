//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    var body: some View {
        //1. Podemos indicarle donde queremos que comience el mapa, en la posicion inicial seleccionaremos por region, creando una instancia de MKCoordinateRegion. Especificaremos el centro de la clase CLLocationCoordinate2D indicandole la latitud y longitud. Adicional esta el parametro Span, que es la anchura en la que nosotros queremos observar
        Map(initialPosition: .region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -33.06, longitude: -71.62),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
    }
}

#Preview {
    ContentView()
}
