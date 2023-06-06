//
//  ClockFace.swift
//  
//
//  Created by Norikazu Muramoto on 2023/06/06.
//

import SwiftUI


/// A `View` that represents a clock face, divided into sectors and with custom content at each mark.
///
/// The content at each mark is created by a closure you provide, which is called once for each mark.
/// Each mark is an integer in a specified range.
public struct ClockFace<Content>: View where Content: View {

    var divisions: Int

    var markLength: CGFloat

    var content: (Int) -> Content

    var dail: [Int]

    /// Creates a new `ClockFace` view.
    ///
    /// - Parameters:
    ///   - range: The range of integers for which to create content. Defaults to 0..<12.
    ///   - step: The step size for the range. Defaults to 1.
    ///   - divisions: The number of divisions in the clock face. Defaults to 60.
    ///   - markLength: The length of the mark in the clock face. Defaults to 12.
    ///   - content: A closure that creates the content for each mark.
    public init(_ range: Range<Int> = 0..<12, step: Int = 1, divisions: Int = 60, markLength: CGFloat = 12, @ViewBuilder content: @escaping (Int) -> Content) {
        self.divisions = divisions
        self.markLength = markLength
        self.content = content
        self.dail = stride(from: range.lowerBound, to: range.upperBound, by: step).map { $0 }
    }


    public var body: some View {
        Graduations(divisions: divisions, markLength: markLength)
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round))
            .overlay {
                ClockLayout {
                    ForEach(dail, id: \.self) { index in
                        content(index)
                    }
                }
                .padding(markLength + 4)
            }
    }
}

struct ClockFace_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ClockFace { index in
                Text(index, format: .number)
                    .font(.system(index % 3 == 0 ? .title3 : .body, design: .rounded, weight: .semibold))
                    .monospacedDigit()
                    .foregroundColor(index % 3 == 0 ? .primary : .secondary)
            }
            .padding()

            ClockFace(0..<24, step: 2) { index in
                Text(index, format: .number)
                    .font(.system(.body, design: .rounded, weight: .semibold))
                    .monospacedDigit()
                    .foregroundColor(index % 3 == 0 ? .primary : .secondary)
            }
            .padding()

            ClockFace(0..<12, step: 3) { index in
                Text(index, format: .number)
                    .font(.system(index % 3 == 0 ? .title3 : .body, design: .rounded, weight: .semibold))
                    .monospacedDigit()
                    .foregroundColor(index % 3 == 0 ? .primary : .secondary)
            }
            .padding()
        }

    }
}
