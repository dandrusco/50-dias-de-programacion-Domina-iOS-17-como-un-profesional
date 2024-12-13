//
//  ProgressRing.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//

import SwiftUI

struct ProgressRing: View {
    
    //10. Vamnos a declarar dos variables que nos ayudaran a definir, por un lado la anchura de los circulos
    var thickness: CGFloat = 25.0
    //11. La anchura del diametro del circulo
    var width: CGFloat = 220.0
    //12. Crearemos el color por defecto (El que ira por debajo)
    var color: Color = Color.darkBlue
    
    var body: some View {
        //13. COmenzaremos a generarlo, metiendo una ZStack
        ZStack{
            //14. Pondremos un circulo con el modificador Stroke quien nos ayudara a modificar el color, le pondremos el color por defecto y la anchura de la variable thickness
            Circle()
                .stroke(self.color.opacity(0.15), lineWidth: self.thickness)
   
          //26. Para que aparezca llamamos al RingShape, pasandole el progreso de 0.5 y thickness
            RingShape(progress: 0.5, thickness: self.thickness)
        }
        //15. Ahora creamos el frame pasando le la anchira que hemos definido
        .frame(width: self.width, height: self.width, alignment: .center)
    }
}

//16. Implementaremos el protocolo Shape para los progresos de los anillos
struct RingShape: Shape {
    //17. El progreso debera ir de 0.0 a 1
    var progress: Double = 0.0
    //18. pondremos nuevamente el thickness con el mismo valor
    var thickness: CGFloat = 25.0
    //19. El angulo de partida debe estar a -90 para que comience como el reloj
    let startAngle: Double = -90.0
    
    //20. Creamos la funcion path quien sera la encargada de dibujar el rectangulo
    func path(in rect: CGRect) -> Path {
        //21. declaramos el path como una instancia delpropio Path
        var path = Path()
        //22. Programaremos el punto del centro
        let center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        //23. Creamos el el radio
        let radius = min(rect.width, rect.height)/2.0
        //24. al path le pintaremos un arco, tomanldo el valor del centro y del radio, startAngle corresponde a la variable startAngle y la finalizacion sera de la multiplicacion de 360 por el progreso + la partida. El clockwise es como quieres que gire de derecha a izquierda o biceverza
        path.addArc(center: center, radius: radius,
                    startAngle: .degrees(self.startAngle),
                    endAngle: .degrees(360*self.progress+self.startAngle),
                    clockwise: false)
        //25. Ahora devolvemos el path y nuevamente metemos un strokedPath con el init de lineWidth con el valor de thickness y en el lineCap sera .round
        return path.strokedPath(.init(lineWidth: self.thickness, lineCap: .round))
    }
}


#Preview {
    ProgressRing()
}
