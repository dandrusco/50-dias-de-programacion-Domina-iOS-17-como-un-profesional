//
//  FaqView.swift
//  F24-Desplegables
//
//  Created by Danilo Andrusco on 11-12-24.
//

import SwiftUI

struct FaqView: View {
    
    //1. De manera opcional podemos controlar el estado de un DisclosureGroup a traves de una variable de estado, para ello le pasaremos un arrays con 3 contenidos y con repeating en false para que todas aparezcan cerradas
    @State var showContent = Array(repeating: false, count: 3)
    
    //2. Crearmos una seccion de 3 arrays de preguntas y respuestas
    private let faqs = [
        (question: "1. ¿Qué incluye la suscripción anual de Frogames?", answer: "Nuestra suscripción anual contiene más de 150 cursos en línea organizados en rutas de programación, matemáticas, videojuegos, IA o desarrollo entre otras para iniciarte en cualquiera de nuestros campos. Los cursos están organizados por dificultad, contienen soporte de instructor, acceso mensual en vivo, acceso 24/7 durante todo el mes, y actualizaciones periódicas y nuevas versiones. Además, ahorras el valor de 3 meses de suscripción en comparación a la suscripción mensual."),
        
        (question: "2. ¿Las clases en qué formato son?", answer: "La clases están en vídeo. Con una duración de variable de entre 2 y 30 minutos, y con posibilidad de ver los vídeos las veces que necesites"),
        
        (question: "3. ¿Tendré certificado del curso?", answer: "Sí. Al terminar el curso obtendrás un certificado digital firmado único del curso avalado por Accredible con tecnología blockchain que certifica tu participación y aprovechamiento del curso."),
        
    ]
    
    
    
    var body: some View {
        //3. Creamos una NavigationStack
        NavigationStack {
            //4. Vamos por una lista
            List {
                //5. Recorremos las preguntas
                ForEach(faqs.indices, id: \.self) { idx in
                    //6. Crearemos el DisclosureGroup donde tendremos un conenido y una etiqueta. EL contenido es la respuesta y la etiqueta (label) vendria siendo la pregunta
                    DisclosureGroup(
                        //7. a traves del isExpanded le pasaremos el $showContent con el idx ya que algunos pueden estar abiertos como cerrados
                        isExpanded: self.$showContent[idx],
                        content: {
                            //8 Configuramos el contenido
                            Text(faqs[idx].answer)
                                .font(.body)
                                .fontWeight(.thin)
                        },
                        label: {
                            //9 Configuramos el pregunta
                            Text(faqs[idx].question)
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.teal)
                            
                        }
                    )
                    //10. Le metemos un padding
                    .padding()
                }
            }
            //11. La listStyle sera plain
            .listStyle(.plain)
            //12. Configuramos el titulo de la navigation
            .navigationTitle("Preguntas Frecuentes")
            //13. Utilizaremos una toolbar para generar el bton de abir todas
            .toolbar{
                //14. Lo mandamos a la derecha
                ToolbarItem(placement: .topBarTrailing){
                    //15. Ponemos el boton
                    Button(action: {
                        //16. Deberemos utilizar el MAP para pasar todos los valores showContent a true
                        self.showContent = self.showContent.map({ _ in
                            true
                        })
                        
                    }, label: {
                        //17. Configuramos el texto 
                        Text("Ver todas")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.teal)
                    })
                }
            }
        }
    }
}

#Preview {
    FaqView()
}
