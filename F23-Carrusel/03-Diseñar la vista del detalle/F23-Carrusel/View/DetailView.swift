//
//  DatailView.swift
//  F23-Carrusel
//
//  Created by Danilo Andrusco on 10-12-24.
//

import SwiftUI

struct DetailView: View {
    //2. necesitaremos un titulo
    let title: String
    
    var body: some View {
        //5. Tomaremos las medidas de GeometryReader
        GeometryReader{ geometry in
            //6. Creamos una ScrollView que tenga una ZStack, y en su interior una VStack
            ScrollView{
                ZStack{
                    VStack(alignment: .leading, spacing: 8, content: {
                        //7. Comenzaremos con el titulo
                        Text(self.title)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        //8. Pondremos una HStack para las valoraciones
                        HStack(spacing: 8){
                            //9. Creamos las 5 estrellas
                            ForEach(1...5, id: \.self){ _ in
                                //10. Ponemos la imagen
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.teal)
                                    .font(.system(size: 20))
                            }
                            //11. Ponemos un texto de la valoracion
                            Text("5.0")
                                .font(.system(.headline))
                                .foregroundStyle(.teal)
                                .padding(.leading, 16)
                        }
                        //12. Ponemos un pading botton de 24
                        .padding(.bottom, 24)
                        
                        //13. Ponemos la descripcion del curso
                        Text("Descripción del curso")
                            .font(.system(.headline))
                            .fontWeight(.bold)
                        //14. Detallamos la descripcion
                        Text("""
                            Crear apps para iOS utilizando Swift y SpriteKit se ha convertido en uno de los trabajos mejor pagados, además de poder teletrabajar desde cualquier lugar. Nuestra ruta de ayudará a arrancar desde cero hasta terminar publicando más de 50 apps en el camino.\n\nEspecialización en iOS. Céntrate en solo en tu pasión. Tienes disponible todos los cursos sobre iOS.\n\nSuscripción más económica para todos los que tienen claro que solo quieren centrarse en iOS.\n\nUn año de formación. Hemos estimado que para completar la ruta completa se necesitan dedicarle 20 horas a la semana durante 52 semanas.\n\nAprende de lo más básico a lo más avanzado de iOS. Nuestra ruta esta creada para que puedas profundizar en los cursos de iOS.
                        """)
                        //15. Ponemos otro pading
                        .padding(.bottom, 24)
                        
                        //16. Cremos el boton
                        Button(action: {
                            //TODO: llevaría a la web del curso
                        }, label: {
                            Text("Apuntarme ahora al curso")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .padding(16)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.teal)
                                .cornerRadius(16)
                            
                        })
                    })
                    //17. metemos un pading global
                    .padding(16)
                    //18 Creamos el frame abarcando toda la pantalla
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                    //19 la píntamos blanca
                    .background(.white)
                    //20. le metemos unos bordes, ahora no se aprecian ya que elegimos el color blanco anterior mente (podemos cambiarlo para probar)
                    .cornerRadius(16)
                    
                    //21. Pondremos la imagen de in marcador
                    Image(systemName: "bookmark.fill")
                        .font(.system(size:40))
                        .foregroundStyle(.teal)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                    //22. Para llevar el marcador mas a la izquierda y un pelin mas arrbiba lo configuraremos a -20 x -5 puntos
                        .offset(x: -20, y: -5)
                }
                //23. Añadimoos un ofset para bajar todo unos 25 puntos, para que se pueda ver la imagen por debajo
                .offset(y:25)
            }
        }
    }
}

//3. Arreglamos la preview agregandole un titulo
#Preview {
    DetailView(title: "Curso de Desarrollo de Apps para iOS 10")
        //4. Le pondremos un fondo negro
        .background(.black)
}
