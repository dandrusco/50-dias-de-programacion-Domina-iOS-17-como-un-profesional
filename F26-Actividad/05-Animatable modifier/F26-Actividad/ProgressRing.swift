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
    let circleThreshold = 0.95
    
    @Binding var progress: Double
    
    private var radius: Double {
        Double(width/2.0)
    }
    
    private func ringEndPosition(progress: Double) -> CGPoint{
        let endAngle = 360 * self.progress + self.startAngle
        let endAngleRad = endAngle * .pi / 360.0
        
        return CGPoint(x: radius*cos(endAngleRad), y: radius*sin(endAngleRad))
    }
    
    private var ringEndShadowOffset: CGPoint {
        let shadowPosition = self.ringEndPosition(progress: self.progress+0.02)
        let circlePosition = self.ringEndPosition(progress: self.progress)
        
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
                //14. metemos el animateProgressText, pasandole el progreso y el color
                .animateProgressText(progress: self.progress, textColor: self.color)
            
            RingEnd(progress: self.progress,startAngle: self.startAngle, ringRadius: self.radius)
                .frame(width: self.thickness, height: self.thickness)
                .foregroundColor(self.progress > self.circleThreshold ? self.gradient.stops[1].color : Color.clear)
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


struct RingEnd: Shape{
    
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    var animatableData: Double{
        get{progress}
        set{progress = newValue}
    }
    
    private var position : CGPoint{
        let endAngle = 360 * self.progress + self.startAngle
        let endAngleRad = endAngle * .pi / 180.0
       
        let x = ringRadius*cos(endAngleRad)
        let y = ringRadius*sin(endAngleRad)
        
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard self.progress > 0.0 else {
            return path
        }
        
        let frame = CGRect(x: self.position.x, y: self.position.y,
                           width: rect.size.width, height: rect.size.height)
       
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        
        return path
    }
}

//01 Crearemos una nueva structura que se adapte al protocolo AnimatableModifier, esto hara que podramos programar la animacion del texto
struct ProgressText: AnimatableModifier {
    //2 Necesitamos el progreso y un color
    var progress: Double = 0.0
    var textColor: Color = .primary
    
    //3. Creamos una variable para formatear el texto
    private var progressText: String{
        //4. formateamos el numero
        let formatter = NumberFormatter()
        //5. el estilo sera de %
        formatter.numberStyle = .percent
        //6. le añadimos el %
        formatter.percentSymbol = "%"
        
        //7. devolvemos el fortater de tipo Sting, convirtiendolo a NSNumber, segun el porcentaje. si nos da error lo igualamos a 0
        return formatter.string(from: NSNumber(value: self.progress)) ?? "0%"
    }
    
    //8. programamos la animacion
    var animatableData: Double {
        get{ progress }
        set{ progress = newValue }
    }
    
    //9. Sobreescribimos el body a partir del content
    func body(content: Content) -> some View {
        content
            //10. en un overlay metemos el texto
            .overlay(
                Text(self.progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(self.textColor)
                    .animation(nil)
            )
    }
    
}

//11. Los metodos aun no estan preparados para conformarce al protocolo de la vista, es por ello que lo debemos convertir en una vista, creando una extencion de la clase View y preparar un metodo que nos permita extender la ProgressText
extension View{
    //12. Animamos el progreso del texto, devolviendo a la vista
    func animateProgressText(progress: Double, textColor: Color = Color.primary) -> some View{
        //13. El propio modificador le pasamos la vista del ProgressText
        self.modifier(ProgressText(progress: progress, textColor: textColor))
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
