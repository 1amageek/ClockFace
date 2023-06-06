//
//  Graduations.swift
//  
//
//  Created by Norikazu Muramoto on 2023/06/06.
//

import SwiftUI

struct Graduations: Shape {

    var divisions: Int

    var markLength: CGFloat

    init(divisions: Int = 60, markLength: CGFloat = 12) {
        self.divisions = divisions
        self.markLength = markLength
    }

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startRadians = 0 * CGFloat.pi / 180
        let endRadians = 360 * CGFloat.pi / 180
        let step = (endRadians - startRadians) / CGFloat(divisions)

        var path = Path()
        for i in 0..<divisions {
            let angle = startRadians + step * CGFloat(i)
            let tickStart = CGPoint(
                x: center.x + (radius - (i % 5 == 0 ? markLength : markLength/2)) * cos(angle),
                y: center.y + (radius - (i % 5 == 0 ? markLength : markLength/2)) * sin(angle)
            )
            let tickEnd = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            path.move(to: tickStart)
            path.addLine(to: tickEnd)
        }
        return path
    }
}

struct Graduations_Previews: PreviewProvider {
    static var previews: some View {
        Graduations()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round))
    }
}
