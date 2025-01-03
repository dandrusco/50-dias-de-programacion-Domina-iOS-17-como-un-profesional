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
    var gradient = Gradient(colors: [.darkBlue, .lightBlue])
    let startAngle = -90.0
    //18. Como queremos que el circulo solo se vea llegando arriba, creamos una constante al 95%
    let circleThreshold = 0.95
    
    @Binding var progress: Double
    
    //15. ahora declaramos una variable autocomputada del Doble de la anchura, dividido en 2
    private var radius: Double {
        Double(width/2.0)
    }
    
    //20. Vamos a crear una funcion que se enargue de ver la posicion del final del anillo
    private func ringEndPosition(progress: Double) -> CGPoint{
        //21. calculamos el endAngle y el radiante
        let endAngle = 360 * self.progress + self.startAngle
        let endAngleRad = endAngle * .pi / 360.0
        
        //22. Devolviendo el ceseno y el seno tanto para X e Y
        return CGPoint(x: radius*cos(endAngleRad), y: radius*sin(endAngleRad))
    }
    
    //23. Ahora necesitamos añadir la sombra en direccion del anillo
    private var ringEndShadowOffset: CGPoint {
        //24. calculamos la posision de la sombra, sandole un 0.02 puntos adelantado, para que se pueda apreciar la sompra
        let shadowPosition = self.ringEndPosition(progress: self.progress+0.02)
        //25. Calculamos la posicion del propio circulo
        let circlePosition = self.ringEndPosition(progress: self.progress)
        
        //26. devolvemos la diferencia entre ambas
        return CGPoint(x: shadowPosition.x - circlePosition.x,
                       y: shadowPosition.y-circlePosition.y)
    }
    

    
    var body: some View {
        ZStack{
            Circle()
                .stroke(self.color.opacity(0.15), lineWidth: self.thickness)
            RingShape(progress: self.progress, thickness: self.thickness)
                .fill(AngularGradient(gradient: self.gradient,
                                      center: .center,
                                      startAngle: .degrees(self.startAngle),
                                      endAngle: .degrees(360*self.progress + self.startAngle)))
            
            //16. Ahora llamamos a la RingEnd
            RingEnd(progress: self.progress,startAngle: self.startAngle, ringRadius: self.radius)
            //17. Ajustamos el tamaño
                .frame(width: self.thickness, height: self.thickness)
            //19. SOlo lo pintaremos si el progreso es mayor al 95%
                .foregroundColor(self.progress > self.circleThreshold ? self.gradient.stops[1].color : Color.clear)
            //27. Vamos a añadir una sombra al final del anillo, siempre que supéremos el 95%
                .shadow(color: self.progress > self.circleThreshold ? Color.black.opacity(0.12) : Color.clear, radius: 2, x: self.ringEndShadowOffset.x, y: self.ringEndShadowOffset.y)
        }
        .frame(width: self.width, height: self.width, alignment: .center)
        .animation(.easeInOut(duration: 1.0), value: self.progress)
    }
}

struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 25.0
    let startAngle: Double = -90.0
    
    var animatableData: Double{
        get {progress}
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

//1. Cuando cerramos los circulos al 100, queda una ralla al medio, vamos a ponerle un circulo al final para que destaque donde se ha detenido, para ello crearemos una estructura  de tipo Shape
struct RingEnd: Shape{
    //2. Necesitaremos el progreso, la partida y el radio del anillo
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    //14. Implementamos la misma animacion
    var animatableData: Double{
        get{progress}
        set{progress = newValue}
    }
    
    //6. Necesitamos calcular la posicion
    private var position : CGPoint{
        //7. calculamos el fin del ango
        let endAngle = 360 * self.progress + self.startAngle
        //8. calculamos en radianes
        let endAngleRad = endAngle * .pi / 180.0
        //9. le pasmos los calculos tanto para la X e Y (coseno y seno)
        let x = ringRadius*cos(endAngleRad)
        let y = ringRadius*sin(endAngleRad)
        //10. lo devolvemos
        return CGPoint(x: x, y: y)
    }
    
    //3. Crearemos una funcion para representar el circulo
    func path(in rect: CGRect) -> Path {
        //4. El path sera igual al Path
        var path = Path()
        
        //5. Apaño para no pintar el círculo si progress = 0%
        guard self.progress > 0.0 else {
            return path
        }
        //11. Calculamos el frame tanto de X con la Y calculada anteriormente, entregandole la anchura y altura
        let frame = CGRect(x: self.position.x, y: self.position.y,
                           width: rect.size.width, height: rect.size.height)
        //12. al path le pasamos un addRoundedRect con el frame creado anterior mente y con su tamaño
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        //13. Ahora devovlemos el path
        return path
    }
}


#Preview ("Progress Ring (50%)") {
    ProgressRing(progress: .constant(0.5))
}

#Preview ("Progress Ring (90%)") {
    ProgressRing(progress: .constant(0.9))
}

#Preview ("Progress Ring (150%)") {
    ProgressRing(progress: .constant(1.5))
}
