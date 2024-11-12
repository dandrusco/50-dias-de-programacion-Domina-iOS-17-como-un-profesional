//
//  ContentView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 02-04-24.
//

import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal", price: 19.99),
        Course(name: "Cálculo", image: "calculo", author: "Arnau Mir y Llorenç Valverde", difficulty: 2, description: "Descubre todo el mundo del cálculo en una variable y practica con Wolfram Alpha y Python", price: 24.99),
        Course(name: "Estadística Descriptiva", image: "descriptiva", author: "María Santos y Juan Gabriel", difficulty: 2, description: "Descubre la Estadística Descriptiva con R y Python", price: 18.99),
        Course(name: "Estadística Inferencial", image: "inferencia", author: "Ricardo Alberich y Arnau Mir", difficulty: 4, description: "Descubre el poder de la inferencia estadística implementando tus tests con R", price: 29.99),
        Course(name: "Matemática Discreta", image: "discreta", author: "Juan Gabriel Gomila", difficulty: 2, description: "Piensa como todo un matemático con los ejerciicos prácticos", price: 14.99),
        Course(name: "Probabilidad", image: "probabilidad", author: "Arnau Mir y  Ricardo Alberich", difficulty: 3, description: "Resuelve problemas de probabilidad y variables aleatoria desde cero y sin experiencia previa", price: 27.99),
        Course(name: "Curso de Latex", image: "latex", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Redacta documentos profesionales gracias al poder de LaTeX", price: 14.99),
        Course(name: "Curso de Sage", image: "sage", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Aprovecha el poder de Sage para resolver problemas matemáticos sin esfuerzo", price: 13.99),
        Course(name: "Prepara la Selectividad", image: "selectividad", author: "María Santos", difficulty: 2, description: "Más de 100 ejercicios resueltos de matemáticas de bachillerato para preparar tu examen de selectividad", price: 22.99),
        Course(name: "Curso de Swift 5 desde cero", image: "swift5", author: "Juan Gabriel Gomila", difficulty: 1, description: "Aprende a programar con el lenguaje oficial para crear apps para dispositivos de iOS", price: 34.99),
        Course(name: "Curso de iOS 10", image: "ios10", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 11", image: "ios11", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 12", image: "ios12", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple y el nuevo Framework de Swift UI", price: 29.99)
    ]
    
    @State private var selectedCourse: Course?
    
    init(){
        let navbarApparance = UINavigationBarAppearance()
        
        navbarApparance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 30)!
        ]
        navbarApparance.titleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        UINavigationBar.appearance().standardAppearance = navbarApparance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarApparance
        UINavigationBar.appearance().compactAppearance = navbarApparance
        
        navbarApparance.setBackIndicatorImage(UIImage(systemName: "arrow.uturn.backward"), transitionMaskImage: UIImage(systemName: "arrow.uturn.backward"))
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(courses) { course in
                    /*NavigationLink(destination: CourseDetailView(course: course)){*/
                        InfoImagenRow(course: course)
                        .onTapGesture {
                            selectedCourse = course
                        }
                    //}
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .tint(.teal)
    }
}

#Preview {
    ContentView()
}

struct InfoImagenRow: View {
    
    var course: Course
    
    var body: some View {
        HStack{
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 16)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(course.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    //1. Como los cursos tienen una dificultad del 1 al 4, a la imagen le pondremos un parametro adicional donde la barra se incrementara dependiendo de su valor (1/4 mostrara 1 barra, 2/4 mostrara dos barras...)
                    Image(systemName: "cellularbars", variableValue: Double(course.difficulty)/4)
                        .font(.subheadline)
                        .foregroundStyle(.teal)
                    //2. Con esto ya podemos borrar el TODO
                    /*//TODO: ajustar el numero de barra a la dificultad*/
                }
                Text(course.author)
                    .font(.system(.footnote, design: .rounded))
                    .foregroundStyle(.secondary)
                
                //3. Como podemos apreciar el valor nos muestra muchos ceros, para solucionarlo pasaremos a crear un String, formateando a 2 decimales
                Text("USD \(String(format: "%.2f", course.price))")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            //4. Pondremos un Spacer() para empezar a validar si el curso esta comprado o marcado como favorito
            Spacer()
            //5. Crearemos un VStack donde meteremos ambos if
            VStack {
                //6. Como por el momento ningun curso esta comprado deberemos crear un if con un signo de exclamacion if !course.isPurchased (si el curso NO esta comprado) de esta manera podremos ver los cambios en pantalla antes de que sean comprados
                if course.isPurchased{
                    Image(systemName: "checkmark.square.fill")
                        .foregroundStyle(.green)
                        //8. Para que no queden tan juntos le meteremos un padding
                        .padding(.bottom, 8)
                }
                
                //7. Nuevamente pondremos un NO por delante para ver los cambios
                if course.isFavorite{
                    Image(systemName: "star.circle")
                        .foregroundStyle(.yellow)
                }
                //8. Ahora que ya vemos como se veria el chek verde con la estrella amarilla le sacaremos la interrogante a ambos
            }
        }
    }
}
