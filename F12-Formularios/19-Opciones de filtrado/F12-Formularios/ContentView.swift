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
    @State private var showSettings: Bool = false
   
    @EnvironmentObject var settings : SettingsFactory
    
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
                    //4. Marcaremos la InfoImagenRow y con el boton derecho del mouse marcaremos la opcion Make Conditional, para crear una condicion
                    //5. Si pasamos el filtro...
                    
                    if self.shouldShow(course: course) {
                        NavigationLink(destination: CourseDetailView(course: course)){
                            InfoImagenRow(course: course)
                            .contextMenu{
                                Button{
                                    purshase(item: course)
                                } label: {
                                    HStack {
                                        Text("Comprar")
                                        Image(systemName: "dollarsign.circle.fill")
                                    }
                                }
                                Button {
                                    favorite(item: course)
                                } label: {
                                    HStack {
                                        Text("Favorito")
                                        Image(systemName: "star.fill")
                                    }
                                }
                                Button {
                                    delete(item: course)
                                } label: {
                                    Text("Eliminar")
                                    Image(systemName: "trash.fill")
                                }
                            }
                            .onTapGesture {
                                selectedCourse = course
                            }
                        }
                    //6. Eliminamos el else ya que no lo ocuparemos
                    /*} else {
                        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/*/
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSettings = true
                    }, label: {
                        Image(systemName: "gear.circle")
                            .font(.title)
                    })
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView().environmentObject(self.settings)
            }
        }
        .tint(.teal)
    }
    private func purshase(item course: Course){
        if let index = courses.firstIndex(where: {$0.id == course.id}){
            courses[index].isPurchased.toggle()
        }
    }

    private func favorite(item course: Course){
        if let index = courses.firstIndex(where: {$0.id == course.id}){
            courses[index].isFavorite.toggle()
        }
    }

    private func delete(item course: Course){
        if let index = courses.firstIndex(where: {$0.id == course.id}){
            courses.remove(at: index)
        }
    }
    //1. Crearemos una funcion que le pasaremos un curso y el sistema devolvera un valor booleano para comenzar a filtrar
    private func shouldShow(course: Course) -> Bool {
        //2. Comenzaremos con las condiciones, si no esta marcada la opcion de que se muestren solo los comprados o esta marcada la opcnion de filtrar por comprados y mi curso esta comprado, entonces la condicion de solo mostrar cursos comprados se convierte en verdadera
        
        //9. Dejaremos como verdadera la de favoritos
        let favouriteCondition = true
        
        let purchasedCondition = !self.settings.showPurchasedOnly || (self.settings.showPurchasedOnly && course.isPurchased)
        
        //7. Ahora crearemos una para la dificultad, que la dificultad sea menor o igual que las almacenadas en las preferencias
        let difficultyCondition = (course.difficulty <= self.settings.maxDifficultyLevel)
        
        //10. Y para los precios
        let priceCondition = true
        
        //3. Devolvemos el purchasedCondition
        //8. Ahora le pasamos al return la difficultyCondition
        //11. Y las agregaremos ambas al return
        return purchasedCondition && favouriteCondition && difficultyCondition && priceCondition
    }
}


#Preview {
    ContentView().environmentObject(SettingsFactory())
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
                    Image(systemName: "cellularbars", variableValue: Double(course.difficulty)/4)
                        .font(.subheadline)
                        .foregroundStyle(.teal)
                }
                Text(course.author)
                    .font(.system(.footnote, design: .rounded))
                    .foregroundStyle(.secondary)
                
                Text("USD \(String(format: "%.2f", course.price))")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack {
                if course.isPurchased{
                    Image(systemName: "checkmark.square.fill")
                        .foregroundStyle(.green)
                        .padding(.bottom, 8)
                }
                
                if course.isFavorite{
                    Image(systemName: "star.circle")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}
