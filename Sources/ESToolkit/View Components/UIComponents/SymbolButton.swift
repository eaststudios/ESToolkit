//
//  SymbolButton.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class SymbolButton: UIView, UIComponentProtocol {
	public var viewModel: ViewModel = .initial {
		didSet {
			render()
		}
	}

	public var style: Style = .normal {
		didSet {
			applyStyle()
		}
	}

	private lazy var button: UIButton = {
		let ub = UIButton(frame: .zero)
		ub.addTarget(self, action: #selector(onTap), for: .touchUpInside)
		return ub
	}()
}

public extension SymbolButton {
	public struct ViewModel {
		public let image: Symbol
		public let onTap: (() -> Void)?

		public enum Symbol {
			case uiImage(UIImage)
			case symbolName(String)

			fileprivate var image: UIImage? {
				switch self {
				case .uiImage(let uiImage):
					return uiImage
				case .symbolName(let symbolName):
					return UIImage(systemName: symbolName)
				}
			}
		}

		public init(image: Symbol, onTap: (() -> Void)?) {
			self.image = image
			self.onTap = onTap
		}

		public static let initial = ViewModel(image: .uiImage(.init()), onTap: nil)
	}

	public struct Style {
		public let backgroundColor: UIColor
		public let color: UIColor

		public init(backgroundColor: UIColor, color: UIColor) {
			self.backgroundColor = backgroundColor
			self.color = color
		}

		public static let normal = Style(backgroundColor: .clear, color: .label)
		public static let selected = Style(backgroundColor: .label, color: .systemBackground)
		public static let disabled = Style(backgroundColor: .clear, color: UIColor.label.withAlphaComponent(0.5))
	}
}

// MARK: View Setup Methods

public extension SymbolButton {
	public func commonInit() {
		backgroundColor = .clear
		embedSubview(button)
		layout(with: [
			widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
		])
		
		render()
		applyStyle()
	}

	public func render() {
		button.setImage(viewModel.image.image, for: .normal)
	}

	public func applyStyle() {
		button.backgroundColor = style.backgroundColor
		button.tintColor = style.color
	}

	@objc private func onTap() {
		viewModel.onTap?()
	}
}
