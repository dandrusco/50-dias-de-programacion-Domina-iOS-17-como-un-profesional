//
//  Article.swift
//  F10-ProyectoArticulos
//
//  Created by Juan Gabriel Gomila Salas on 24/9/23.
//

import Foundation

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var rating: Int
    var excerpt: String
    var image: String
    var content: String
    var url: String
    //4. Agregamos la categoria acontinuacion
    var category: String
}

#if DEBUG

let articles = [
    
    //5. Agregaremos la categoria a cada uno de los articulos
    Article(title: "Las desventajas de una educación universitaria: ¿Es realmente para todos?", author: "Juan Gabriel Gomila", rating: 5, excerpt: "Vamos a hablar de las alternativas a la universidad, explorando opciones sin títulos académicos. Y es que muchos conocen las ventajas de tener un título universitario, pero es importante conocer también las desventajas de una educación universitaria.", image: "desventajas_de_una_educacion_universitaria", content: "La educación universitaria ha sido considerada durante mucho tiempo como la vía principal para el éxito profesional y personal. Sin embargo, cada vez más personas están optando por explorar alternativas fuera del ámbito universitario. En este artículo, exploraremos las diferentes opciones de carrera y desarrollo personal que existen más allá de la universidad, brindando razones convincentes para considerar estas alternativas y consejos prácticos para tomar una decisión informada. No todas las personas están hechas para la universidad, y eso está bien. \n\nCada individuo tiene sus propios intereses, habilidades y metas, y no necesariamente se alinean con lo que se ofrece dentro de un entorno universitario tradicional. Afortunadamente, existen numerosas alternativas que pueden ser igualmente gratificantes y exitosas. ", url: "https://cursos.frogamesformacion.com/pages/blog/desventajas-de-una-educacion-universitaria", category: "Educación"),
    Article(title: "Cursos de Programación en Línea: Navegando por el Mundo del Aprendizaje Digital", author: "María Santos", rating: 4, excerpt: "Hoy en día, la tecnología está avanzando a un ritmo vertiginoso, y una habilidad que está en gran demanda es la programación. Existe una gran demanda de programadores capacitados, por lo que es una oportunidad perfecta para aprender a programar. Sin embargo, hay dos opciones disponibles: aprender de forma presencial o en línea.", image: "cursos_de_programacion_en_linea", content: "Aprender en línea ofrece mucha flexibilidad, ya que puedes aprender desde cualquier lugar que desees. Varios cursos de programación en línea, como programación de videojuegos, aprendizaje automático, interfaz de usuario, etc., te ofrecen valiosos beneficios profesionales y oportunidades de carrera en diseño web, desarrollo, etc. Además, los propietarios de negocios también pueden tomar estos cursos para comprender mejor los aspectos técnicos. \n\nEntonces, ¿cuáles son las ventajas de tomar cursos de programación en línea y cuáles son los más populares? Consulta la guía a continuación para obtener respuestas detalladas.", url: "https://cursos.frogamesformacion.com/pages/blog/cursos-de-programacion-en-linea-aprendizaje-digital", category: "Educación"),
    Article(title: "Una Saga de Aventuras Literaria de los Instructores de Frogames", author: "Juan Gabriel Gomila", rating: 4, excerpt: "Las sagas de aventuras literaria con historias de fantasía tienen el poder de transportar a los lectores a mundos llenos de magia, experiencias asombrosas y vidas alternativas. Estas narraciones no solo han inspirado videojuegos, películas y series, sino que también han dado lugar a comunidades, eventos y juegos de rol en todo el mundo. ", image: "saga_de_aventuras_literaria", content: "La saga de los Corvo, con su primer volumen 'El Fragmento Celestial,' nos sumerge en una narración épica llena de emocionantes historias centradas en Ainur, el último sobreviviente de una raza enigmática y avanzada. Esta civilización, que una vez floreció con tecnología, sabiduría y progreso, ha caído en el olvido y el misterio.\n\nEn esta obra literaria, los lectores acompañan a Ainur en un viaje trascendental para descubrir sus raíces, su identidad y los oscuros secretos de su pasado. A medida que la historia avanza, la magia se desborda en cada página, y las razas diversas (humanos, elfos y enanos) se enfrentan en una guerra por el control de sus territorios.\n\nEn medio de este conflicto despiadado y corrupto, surge una antigua raza que busca liberar a una diosa destructiva, sumiendo así este mundo fantástico en el caos. Los peligros y los descubrimientos sorprendentes esperan a Ainur en su travesía, donde descubrirá la verdad sobre el mundo y sus orígenes.", url: "https://cursos.frogamesformacion.com/pages/blog/saga-de-aventuras-literaria-de-frogames", category: "Libros"),
    Article(title: "Frogames: Innovadora Plataforma Educativa en Línea Reconocida en 2023", author: "Juan Gabriel Gomila", rating: 5, excerpt: "En un mundo donde la tecnología avanza a pasos agigantados, la educación en línea se ha convertido en una realidad accesible y global. Gracias a esta transformación digital, los maestros pueden llegar a estudiantes de todo el mundo sin importar su ubicación geográfica.", image: "premio_innovacion_frogames_plataforma_educativa_en_linea_reconocida", content: "Frogames emerge como una plataforma de educación a distancia que está cambiando las reglas del juego. En el Education and Training Awards 2023, Frogames fue premiada como la empresa online de educación más innovadora en el uso de datos y enseñanzas digitales.\n\nFrogames se ha convertido en un referente en el ámbito de la educación en línea, al ofrecer una metodología pionera que transforma la forma en que las personas adquieren conocimientos sobre tecnología. Esta plataforma se dedica a capacitar a sus usuarios en una amplia variedad de campos, desde programación, matemáticas, machine learning y Inteligencia Artificial, hasta Python, videojuegos, Power BI, Unity y business intelligence, por mencionar solo algunos.\n\nLo que hace a Frogames destacar es su flexibilidad. Los usuarios pueden elegir cursos que se adapten a sus necesidades y acceder a ellos desde cualquier dispositivo con conexión a internet. Además de la diversidad de cursos, la plataforma ofrece una serie de beneficios adicionales que incluyen acceso a todas las formaciones, competencias mensuales con premios atractivos, una tienda virtual, un podcast semanal informativo y certificados Blockchain que se otorgan al completar los cursos.", url: "https://cursos.frogamesformacion.com/pages/blog/frogames-plataforma-educativa-en-linea-innovadora", category: "Noticias")
    //6. Regresamos al TitleView
]

#endif

