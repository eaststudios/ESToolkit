//
//  HairlineSeparator.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class HairlineSeparatorView: UIView, UIComponentProtocol {
	public var viewModel: ViewModel = .initial {
		didSet {
			render()
		}
	}

	public var style: Style = .default {
		didSet {
			applyStyle()
		}
	}

	private var directionConstraint: NSLayoutConstraint?
}

public extension HairlineSeparatorView {
	public struct ViewModel {
		public let width: CGFloat
		public let direction: NSLayoutConstraint.Axis

		public init(width: CGFloat, direction: NSLayoutConstraint.Axis) {
			self.width = width
			self.direction = direction
		}

		static let initial = ViewModel(width: 1, direction: .horizontal)
	}

	public struct Style {
		public let color: UIColor

		public init(color: UIColor) {
			self.color = color
		}

		public static let `default` = Style(color: .opaqueSeparator)
	}
}

// MARK: View Setup Methods

public extension HairlineSeparatorView {
	public func commonInit() {
		render()
		applyStyle()
	}

	public func render() {
		directionConstraint?.isActive = false
		directionConstraint = nil

		directionConstraint = NSLayoutConstraint(
			item: self,
			attribute: viewModel.direction == .horizontal ? .height : .width,
			relatedBy: .equal,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1,
			constant: viewModel.width
		)
		directionConstraint?.isActive = true
	}

	public func applyStyle() {
		backgroundColor = style.color
	}
}
