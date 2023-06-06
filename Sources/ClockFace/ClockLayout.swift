//
//  ClockLayout.swift
//  
//
//  Created by Norikazu Muramoto on 2023/06/06.
//

import SwiftUI

/// A struct that provides a circular layout for placing subviews.
/// The struct calculates the appropriate position for each subview based on the bounds of the containing view.
public struct ClockLayout: Layout {

    /// Places subviews within a given boundary using a circular layout.
    ///
    /// - Parameters:
    ///   - bounds: The boundaries within which to place the subviews.
    ///   - proposal: The proposed size of the view.
    ///   - subviews: The subviews to be placed.
    ///   - cache: A cache that is used to store layout information.
    public func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        guard !subviews.isEmpty else { return }
        let radius = min(bounds.width, bounds.height) / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let count = subviews.count
        for (index, subview) in subviews.enumerated() {
            let angle = 2 * CGFloat.pi / CGFloat(count) * CGFloat(index) - (CGFloat.pi / 2)
            let dimensions = subview.dimensions(in: .unspecified)
            let x = center.x + radius * cos(angle) - dimensions.width / 2 * cos(angle) - dimensions.width / 2
            let y = center.y + radius * sin(angle) - dimensions.height / 2 * sin(angle) - dimensions.height / 2
            let point = CGPoint(x: x, y: y)
            subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
        }
    }

    /// Returns the size that fits the proposed view size.
    /// This method replaces any unspecified dimensions in the proposed size with the corresponding dimensions from the layout's own size.
    ///
    /// - Parameters:
    ///   - proposal: The proposed size of the view.
    ///   - subviews: The subviews to be placed.
    ///   - cache: A cache that is used to store layout information.
    ///
    /// - Returns: A size that fits the proposed view size, replacing any unspecified dimensions.
    public func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }
}


struct ClockLayout_Previews: PreviewProvider {
    static var previews: some View {
        ClockLayout {
            Group {
                Text("0")
                Text("3")
                Text("6")
                Text("9")
            }
            .background(.red)
        }
    }
}
