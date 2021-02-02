//
//  ScrollingStackView.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class ScrollingStackView: UIView {
	private let scrollView = UIScrollView()
	private let stackView = UIStackView()
	private let containerView = UIView()

	public var scrollViewDelegate: UIScrollViewDelegate? {
		get { scrollView.delegate }
		set { scrollView.delegate = newValue }
	}

	public init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
		super.init(frame: .zero)

		embedSubview(scrollView)
		scrollView.embedSubview(containerView)
		containerView.embedSubview(stackView)

		stackView.axis = axis

		switch axis {
		case .horizontal:
			containerView.layout(with: [
				containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
			])
		case .vertical:
			containerView.layout(with: [
				containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
			])
		default:
			fatalError("Unknown axis")
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func add(_ arrangedSubview: UIView) {
		stackView.addArrangedSubview(arrangedSubview)
	}

	public func add(_ arrangedSubviews: [UIView]) {
		arrangedSubviews.forEach { stackView.addArrangedSubview($0) }
	}
}
