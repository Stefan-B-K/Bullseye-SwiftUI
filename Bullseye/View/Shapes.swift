
import SwiftUI

struct Shapes: View {               // Само за упражнението
  
  @State private var wideShapes = false
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
        //                .fill(Color.blue)
        //                .inset(by: 10.0)
        //                .stroke(Color.blue, lineWidth: 20.0)
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200, height: 100.0)
          .transition(.scale)
      }
      
      RoundedRectangle(cornerRadius: 20.0)
      //                .fill(Color.blue)
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: wideShapes ? 200 : 100, height: 100.0)
      Capsule()
      //                .fill(Color.blue)
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: wideShapes ? 200 : 100, height: 100.0)
      Ellipse()
      //                .fill(Color.blue)
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: wideShapes ? 200 : 100, height: 100.0)
      Button(action: {
        withAnimation {
          wideShapes.toggle()
        }
      }) {
        Text("Анимация")
      }
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
