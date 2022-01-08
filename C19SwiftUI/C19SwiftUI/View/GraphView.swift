//
//  GraphView.swift
//  C19SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 05/01/22.
//

//MARK: Line Graph

import SwiftUI

struct GraphView: View {
    @State var on = true

    var body: some View {
        ZStack{
        ZStack {
            
            
            LineGraph(dataPoints: [0 , 0.01, 0.3, 0.3, 0.5, 0.6, 1, 1.4])
                .trim(to: on ? 0 : 1)
                .stroke(Color.green, lineWidth: 5)
                .aspectRatio(16/9, contentMode: .fit)
               
            
            
            
            LineGraph(dataPoints: [0 , 0.1, 0.7, 0.3, 0.6, 0.45, 0.8, 1])
                .trim(to: on ? 0 : 1)
                .stroke(Color.red, lineWidth: 5)
                .aspectRatio(16/9, contentMode: .fit)
               
                
            
            
        }.border(Color.blue, width: 1)
          .padding()
        .animation(Animation.easeInOut(duration: 1).repeatCount(1, autoreverses: true))
            .onAppear(){
                self.on.toggle()
            }
            
            
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}


struct LineGraph: Shape {
    var dataPoints: [CGFloat]

    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }

        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}




