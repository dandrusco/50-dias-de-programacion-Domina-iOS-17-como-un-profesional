//
//  ContentView.swift
//  F08-Animaciones
//
//  Created by Danilo Andrusco on 05-01-24.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos 3 estados de procesando, completado y cargando
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    
    var body: some View {
        ZStack {
            //2. Dibujaremos el boton
            RoundedRectangle(cornerRadius: 40)
                .frame(width: processing ? 300 : 200, height: 80)
                .foregroundStyle(completed ? .green : .indigo)
            
            //3. Dependiendo de los estados pódemos tener 3 casos
            //4. Si aun no comenzamos a precesar el pago...
            if (!processing){
                Text("Comprar").font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            //5. Si en el caso de que estamos procesando pero no hemos completado aun...
            if(processing && !completed){
                HStack{
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 40, height: 40)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: loading)
                    Text("Procesando").font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                        .transition(.move(edge: .top))
                }.onAppear(){
                    //8. llamamos a la funcion para iniciar el procesamiento
                    startProcessing()
                }
            }
            //6. Si hemos completado...
            if completed {
                Text("Completado").font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
                    .onAppear(){
                        //9. llamamos a la funcion para finalizar el procesamiento
                        endProcessing()
                    }
            }
        }
        //10. Creamos las animaciones
        .animation(.spring(), value: loading)
        //11. Crearemos los estados al precionar el boton
        .onTapGesture {
            //12. Si aun no comienza la carga
            if !loading{
                processing.toggle()
            }
        }
    }
    
    //7. Crearemos dos funciones para el procesamiento
    private func startProcessing(){
        //13. Arrancamos la carga llamado al loading
        loading = true
        
        //14 Lanzaremos un hilo de ejecuncion en paralelo con DispatchQueue, quedandonos con el hilo principal (main), a traves del asyncAfter le indicamos que lo arrancaremos ahora pero esperaremos 5 segundos
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            completed = true
        }
    }
    
    private func endProcessing(){
        //15. Reseteamos la app al cabo de un par de segundo
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            processing = false
            completed = false
            loading = false
        }
    }
}

#Preview {
    ContentView()
}
