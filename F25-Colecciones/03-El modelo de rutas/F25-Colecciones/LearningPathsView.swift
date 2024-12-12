//
//  LearningPathsView.swift
//  F25-Colecciones
//
//  Created by Danilo Andrusco on 12-12-24.
//

import SwiftUI

struct LearningPathsView: View {
    //5. Creamos un estado de layout, donde el GridItem sera adaptativo y a su vez tenndra otro flexible
    @State var layout = [GridItem(.adaptive(minimum: 300)), GridItem(.flexible())]
    
    //15. Si cambiamos la oriantacion del iPhone en la Preview vemos que las imagenes no se ven bien, para solucionar esto deberemos programar la vista tanto en vertical como en horizontal.
    //16. SwiftUI nos da la posibilidad de trabajar con ambas vistas atraves de un Environment, programaremos la horizontal con horizontalSizeClass, que sea del tipo UserInterfaceSizeClass pero con interrogante por si aun no es declarada
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    //17. Lo mismo para la version vertical utlizamos el  .verticalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?

    //23. Para mostrar u ocultar los cursos creamos una variable de estado en principio ocultos
    @State var showCourses = false
    
    
    var body: some View {
        //6. Creamos la NavigationStack con un ScrollView en vertical
        NavigationStack{
            ScrollView(.vertical){
                //7. El LazyVGrid sera por comunas del layout, alineado al centro con un espaciado de 16 puntos
                LazyVGrid(columns: self.layout, alignment: .center, spacing: 16, content: {
                    
                    //8. Recorremos el paths pintando las imagenes
                    ForEach(paths){ path in
                        Image(path.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            //12. Configuramos el fram vertical a 220 puntos
                            .frame(maxHeight: 220)
                            .cornerRadius(16)
                            .shadow(color: .primary.opacity(0.4), radius: 6)
                        
                        //24.El siguiente LazyVGrid, solo debe mostrarse si showCourses es verdadera
                        if self.showCourses {
                            //12. Vamos a mostrar una segunda parrilla, estas columnas tendran un arrays de GridItem adaptativo
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 100))], content: {
                                //13. Recorreremos cada foto de los cursos, segun la ruta de estudio
                                ForEach(path.photos){ photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 60)
                                        .cornerRadius(16)
                                }
                                
                            })
                            //14. Le pondremos un frame al LazyVGrid creado en el punto 12 incluyendo una animacion al layout
                            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                            .animation(.easeInOut, value: self.layout.count)
                        }
                    }
                })
                //9. Le metemos un pading a todo de 16 puntos
                .padding(.all, 16)
                //10. programamos la animacion
                .animation(.interactiveSpring(), value: self.layout.count)
            }
            //11. Ponemos el titulo
            .navigationTitle("Rutas de Frogames")
            //25. Programaremos los botones
            .toolbar{
                //26. Sera alineado arriba a la derecha
                ToolbarItem(placement: .topBarTrailing){
                    //27. Ambos botones los metemos en una HStack
                    HStack{
                        //28. Programamos el primer boton
                        Button{
                            //29 Al ser presionado pasamos de false a true la variable de estado showCourses
                            self.showCourses.toggle()
                        } label: {
                            //30. Ponemos la imagen de 9 cuadrados
                            Image(systemName: "square.grid.3x3.topleft.filled")
                                .font(.title)
                                .foregroundStyle(.teal)
                        }
                        //31. Programamos el segundo boton para cambiar el layaut
                        Button {
                            //32. Necesitamos calcular la anchura minima
                            let minWidth: CGFloat = {
                                
                                //33. Configuramos para el iPhone horizontal como compacto de 250 puntos
                                if self.verticalSizeClass == .compact {
                                    return 250
                                }
                                
                                //34. en el caso para el iPad, para horizontal como veertical seran regular de 500 puntos
                                if self.horizontalSizeClass == .regular && self.verticalSizeClass == .regular {
                                    return 500
                                }
                                
                                //35. en el caso del iPhone vertical, solo devolveremos 125 puntos
                                return 125
                                
                            }()
                            
                            //36. Ahora vamos a ver si qieremos una columna o dos, por lo tanto si layout.count es igual a 1, configuramos el minWidth configurado anterior mente y flexible. En caso contrario solo sera flexible
                            self.layout = self.layout.count == 1 ? [GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible())] : [GridItem(.flexible())]
                        } label: {
                            //37 utlizamos una imagen de 4 cuadrados
                            Image(systemName: "square.grid.2x2.fill")
                                .font(.title)
                                .foregroundStyle(.teal)
                        }
                    }
                }
            }
        }
        //18. Con .onChange podemos monitoriar si estamos en vertica u horizontal, por lo tanto tomaremos la opccion de vertical
        .onChange(of: verticalSizeClass){
            //19. De estar en vertivcal imprimiremos por pantall que cambiamos la orientacion
            print("Hemos cambiado orientación")
            //20. Por lo tanto el layout pasara a sar adaptativo, con el minimo que depéndera del verticalSizeClass sea igual a regular con dos paremetros, y el segundo GridItem sera flexible
            self.layout = [GridItem(.adaptive(minimum: verticalSizeClass == .regular ? 125 : 250)), GridItem(.flexible())]
            //21. Si queremos previsualizar los cambios en el iphone personal o en un simulador deberemos cambiar el archivo F25_ColeccionesApp
            
        }
        //38. Meteremos un .onAppear ya que cuando aparece dependiendo si estamos en horizontal o vertical deberemos realizar unos cambios
        .onAppear{
            switch(self.horizontalSizeClass, self.verticalSizeClass){
            //39. En el caso para el iphone sea compacto y regular
            case (.compact, .regular):
                //40. Si el iPhone esta en vertical solo mostraremos una sola columna al inicio
                self.layout = [GridItem()]
                break
            //41. EL segundo caso es que si el segundo caso es compacto, indepéndientemente del primero
            case (_, .compact):
                //42. En este caso estamos con el iPhone en horizontal, en este caso el layout sera adaptativo con 250 puntos y flexible en el segundo caso
                self.layout = [GridItem(.adaptive(minimum: 250)), GridItem(.flexible())]
                break
            //43. El tercer caso es que cuando ambos son regular
            case (.regular, .regular):
                //44. Nos encontramos en un iPad, donde el layout sera adaptativo de 500 puntos y flexible para el segundo GridItem
                self.layout = [GridItem(.adaptive(minimum: 500)), GridItem(.flexible())]
                break
            //45. Y ppor defecto solo metemos un quiebre
            default:
                break
            }
        }
    }
}

#Preview {
    LearningPathsView()
}
