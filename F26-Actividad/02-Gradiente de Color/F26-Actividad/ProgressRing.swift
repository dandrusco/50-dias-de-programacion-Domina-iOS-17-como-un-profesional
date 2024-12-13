//
//  ProgressRing.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//

import SwiftUI

struct ProgressRing: View {
    
    var thickness: CGFloat = 25.0
    var width: CGFloat = 220.0
    var color: Color = Color.darkBlue
    //1. declararemos una gradiente que sea igual al azul oscuro al azul claro
    var gradient = Gradient(colors: [.darkBlue, .lightBlue])
    //2. Creamos tambien aca el angulo de partida en -90
    let startAngle = -90.0
    
    //3. Vamos a crear una variable de esta para el progreso, asi evitaremos de estar escribiendo el 0.5
    @Binding var progress: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(self.color.opacity(0.15), lineWidth: self.thickness)
            
            //4. EN ves de que el progres utilice el progreso a 0.5 ahora lo llamara la propia variable bindeada
            RingShape(progress: self.progress, thickness: self.thickness)
                //5. Utilizaremos el modificador fill, que es para el relleno, utilizaremos un ancgulo de gradientes
                .fill(AngularGradient(gradient: self.gradient,
                                      center: .center,
                                      startAngle: .degrees(self.startAngle),
                                      endAngle: .degrees(360*self.progress + self.startAngle)))
        }
        .frame(width: self.width, height: self.width, alignment: .center)
        //21. debajo del frame meteremos una animacion para el progreso
        .animation(.easeInOut(duration: 1.0), value: self.progress)
    }
}

struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 25.0
    let startAngle: Double = -90.0
    
    //21. Si probamos la animacion esta no es del todo exacta, ya que la animacion funcioa para todo, para solucionarlo deveremos sobreescribir la animatableData del propio SwiftUI
    var animatableData: Double{
        //22. La animacion esta asociada al progress
        get {progress}
        //23. Y el set hara que el progress tome el neuvo valor 
        set {progress = newValue}
    }
   
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        let radius = min(rect.width, rect.height)/2.0

        path.addArc(center: center, radius: radius,
                    startAngle: .degrees(self.startAngle),
                    endAngle: .degrees(360*self.progress+self.startAngle),
                    clockwise: false)

        return path.strokedPath(.init(lineWidth: self.thickness, lineCap: .round))
    }
}

//6. Ahopra se nos queja la Previw ya que deberemos pasarle el progreso, para ello crearemos 3 preview con diferentes parametros
#Preview ("Progress Ring (50%)") {
    ProgressRing(progress: .constant(0.5))
}

#Preview ("Progress Ring (90%)") {
    ProgressRing(progress: .constant(0.9))
}

#Preview ("Progress Ring (150%)") {
    ProgressRing(progress: .constant(1.5))
}
//7. Vamos a programar la ContentView
