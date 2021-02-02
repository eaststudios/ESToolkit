//
//  UILayoutMargins.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
	public init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
		self.init()
		self.top = top
		self.left = left
		self.bottom = bottom
		self.right = right
	}
}
