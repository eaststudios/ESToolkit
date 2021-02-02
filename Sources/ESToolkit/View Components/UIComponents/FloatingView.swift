//
//  FloatingView.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class FloatingView: UIView, UIComponentProtocol {
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

	// MARK: Views

	private lazy var blurView: UIVisualEffectView = {
		let ve = UIVisualEffectView()
		return ve
	}()

	private lazy var contentContainerView: UIView = {
		let uv = UIView()
		uv.backgroundColor = .clear
		return uv
	}()

	// MARK: Lifecycle

	override public func layoutSubviews() {
		super.layoutSubviews()

		applyCornerAndShadow()
	}
}

extension FloatingView {
	public struct ViewModel {
		public let contentView: UIView

		public init(contentView: UIView) {
			self.contentView = contentView
		}

		public static let initial = ViewModel(contentView: UIView())
	}

	public struct Style {
		public let background: Background
		public let corners: Corners
		public let shadow: Shadow

		public init(background: Background, corners: Corners, shadow: Shadow) {
			self.background = background
			self.corners = corners
			self.shadow = shadow
		}

		public enum Background {
			case blur(UIBlurEffect)
			case color(UIColor)
		}

		public struct Corners {
			public let radius: CGFloat
			public let isContinuous: Bool

			public init(radius: CGFloat, isContinuous: Bool = true) {
				self.radius = radius
				self.isContinuous = isContinuous
			}
		}

		public struct Shadow {
			public let color: UIColor
			public let opacity: CGFloat
			public let offset: CGSize
			public let radius: CGFloat

			public init(color: UIColor, opacity: CGFloat, offset: CGSize, radius: CGFloat) {
				self.color = color
				self.opacity = opacity
				self.offset = offset
				self.radius = radius
			}
		}

		public static let `default` = Style(
			background: .blur(UIBlurEffect(style: .systemChromeMaterial)),
			corners: .init(radius: 16, isContinuous: true),
			shadow: .init(color: UIColor.black, opacity: 0.4, offset: .zero, radius: 5)
		)
	}
}

// MARK: View Setup Methods

public extension FloatingView {
	public func commonInit() {
		backgroundColor = .clear

		embedSubview(blurView)
		embedSubview(contentContainerView)

		render()
		applyStyle()
	}

	public func render() {
		contentContainerView.subviews.forEach {$0.removeFromSuperview() }
		contentContainerView.embedSubview(viewModel.contentView)
	}

	public func applyStyle() {
		switch style.background {
		case .blur(let effect):
			blurView.effect = effect
			blurView.contentView.backgroundColor = .clear
		case .color(let color):
			blurView.effect = nil
			blurView.contentView.backgroundColor = color
		}

		applyCornerAndShadow()
	}

	private func applyCornerAndShadow() {
		// cornerRadius
		applyCornerRadius(in: self, masksToBounds: false)
		applyCornerRadius(in: blurView)
		applyCornerRadius(in: contentContainerView)

		// shadow
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: style.corners.radius).cgPath
		layer.shadowColor = style.shadow.color.cgColor
		layer.shadowOffset = style.shadow.offset
		layer.shadowOpacity = Float(style.shadow.opacity)
		layer.shadowRadius = style.shadow.radius
	}

	private func applyCornerRadius(in view: UIView, masksToBounds: Bool = true) {
		view.layer.masksToBounds = masksToBounds
		view.layer.cornerRadius = style.corners.radius
		view.layer.cornerCurve = style.corners.isContinuous ? .continuous : .circular
	}
}
