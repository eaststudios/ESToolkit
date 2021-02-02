//
//  InsetLabel.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public class InsetLabel: UILabel {
	public var topInset: CGFloat = 0.0
	public var leftInset: CGFloat = 0.0
	public var bottomInset: CGFloat = 0.0
	public var rightInset: CGFloat = 0.0

	public var insets: UIEdgeInsets {
		get {
			return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
		}
		set {
			topInset = newValue.top
			leftInset = newValue.left
			bottomInset = newValue.bottom
			rightInset = newValue.right
		}
	}

	override public  func drawText(in rect: CGRect) {
		super.drawText(in: rect.inset(by: insets))
	}

	override public func sizeThatFits(_ size: CGSize) -> CGSize {
		var adjSize = super.sizeThatFits(size)
		adjSize.width += leftInset + rightInset
		adjSize.height += topInset + bottomInset

		return adjSize
	}

	override public var intrinsicContentSize: CGSize {
		var contentSize = super.intrinsicContentSize
		contentSize.width += leftInset + rightInset
		contentSize.height += topInset + bottomInset

		return contentSize
	}
}
