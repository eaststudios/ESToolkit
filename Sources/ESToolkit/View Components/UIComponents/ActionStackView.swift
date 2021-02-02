//
//  ActionStackView.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class ActionStackView: UIView, UIComponentProtocol {
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

	private lazy var stackView: UIStackView = {
		let sv = UIStackView()
		sv.spacing = 0
		return sv
	}()
}

public extension ActionStackView {
	public struct ViewModel {
		public let actions: [UIView]

		public static let initial = ViewModel(actions: [])
	}

	public struct Style {
		public let axis: NSLayoutConstraint.Axis
		public let separator: HairlineSeparatorView.Style

		public static let `default` = Style(axis: .vertical, separator: .default)
	}
}

// MARK: View Setup Methods

public extension ActionStackView {
	public func commonInit() {
		backgroundColor = .clear
		embedSubview(stackView)

		render()
		applyStyle()
	}

	public func render() {
		stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		for (index, view) in viewModel.actions.enumerated() {
			stackView.addArrangedSubview(view)
			view.layout(with: [
				view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
			])

			if index < (viewModel.actions.count - 1) {
				stackView.addArrangedSubview(
					HairlineSeparatorView(
						viewModel: .init(width: 1, direction: style.axis == .horizontal ? .vertical : .horizontal),
						style: style.separator
					)
				)
			}
		}
	}

	public func applyStyle() {
		stackView.axis = style.axis
	}
}
