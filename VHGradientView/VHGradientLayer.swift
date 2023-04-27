//
//  VHGradientLayer.swift
//  VHGradientView
//
//  Created by Vidal HARA on 16.11.2020.
//

import UIKit

/// You can use this layer  to get gradient display
///
/// - Attention:
/// Please use `VHGradientLayer.set(colors:)` to set gradient colors
open class VHGradientLayer: CAGradientLayer {

    /// Start location of the gradient. Value can be from 0 to 1.
    open var startLocation: Double = 0.0 { didSet { updateLocations() } }
    /// End location of the gradient. Value can be from 0 to 1.
    open var endLocation: Double = 1.0 { didSet { updateLocations() } }

    /// Is gradient horizontal or vertical
    open var isHorizontal: Bool = false { didSet { updatePoints() } }
    /// Is gradient diagonal
    open var isDiagonal: Bool = false { didSet { updatePoints() } }

    private var cgColors: [CGColor]? {
        didSet {
            updateColors()
            updateLocations()
        }
    }

    /// You can set gradient colors
    /// - Parameter colors: Gradient colors
    open func set(colors: [UIColor]) {
        if colors.count == 0 {
            cgColors = nil
        } else if colors.count == 1 {
            cgColors = [colors[0], colors[0]].map { $0.cgColor }
        } else {
            cgColors = colors.map { $0.cgColor }
        }
    }

    /// You can reload ui for layout changes etc.
    open func reloadUI() {
        updatePoints()
        updateColors()
        updateLocations()
    }

    private func updatePoints() {
        if isHorizontal {
            startPoint = isDiagonal ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            endPoint = isDiagonal ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            startPoint = isDiagonal ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            endPoint = isDiagonal ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }

    private func updateLocations() {
        let locationUnit = (endLocation - startLocation) / Double(max(1, (cgColors ?? []).count - 1))
        var result: [Double] = [startLocation]
        while (result.last ?? 0) < endLocation {
            result.append((result.last ?? 0) + locationUnit)
        }
        locations = result.map { $0 as NSNumber }
    }

    private func updateColors() {
        colors = cgColors
    }
}
