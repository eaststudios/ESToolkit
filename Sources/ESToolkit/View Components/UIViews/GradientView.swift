//
//  GradientView.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class GradientView: UIView {
	override open class var layerClass: AnyClass {
		return CAGradientLayer.classForCoder()
	}

	private var gradientLayer: CAGradientLayer {
		return layer as! CAGradientLayer
	}

	public var colors = [UIColor]() {
		didSet {
			gradientLayer.colors = colors.map { $0.cgColor }
		}
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		gradientLayer.colors = colors
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		gradientLayer.colors = colors
	}

	public init() {
		super.init(frame: .zero)
		gradientLayer.colors = colors
	}
}
