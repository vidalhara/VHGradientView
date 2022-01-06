//
//  VHGradientView.swift
//  VHGradientView
//
//  Created by Vidal HARA on 16.11.2020.
//

import UIKit

/// You can use this view to get gradient display
open class VHGradientView: UIView {
    /// Start location of the gradient. Value can be from 0 to 1.
    @IBInspectable open var startLocation: Double {
        get { return gradientLayer.startLocation }
        set { gradientLayer.startLocation = newValue }
    }
    /// End location of the gradient. Value can be from 0 to 1.
    @IBInspectable open var endLocation: Double {
        get { return gradientLayer.endLocation }
        set { gradientLayer.endLocation = newValue }
    }

    /// Is gradient horizontal or vertical
    @IBInspectable open var modeHorizontal: Bool {
        get { return gradientLayer.modeHorizontal }
        set { gradientLayer.modeHorizontal = newValue }
    }
    /// Is gradient diagonal
    @IBInspectable open var modeDiagonal: Bool {
        get { return gradientLayer.modeDiagonal }
        set { gradientLayer.modeDiagonal = newValue }
    }

    private var colors: [UIColor] = [] {
        didSet {
            gradientLayer.set(colors: colors)
        }
    }

    /// layerClass returns CAGradientLayer
    override class open var layerClass: AnyClass { return VHGradientLayer.self }
    // swiftlint:disable:next force_cast
    private var gradientLayer: VHGradientLayer {return layer as! VHGradientLayer}

    /// UIView.layoutSubviews()
    open override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.reloadUI()
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *), traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            set(colors: colors)
        }
    }

    /// You can set gradient colors
    /// - Parameter colors: Gradient colors
    open func set(colors: [UIColor]) {
        self.colors = colors
    }
}
