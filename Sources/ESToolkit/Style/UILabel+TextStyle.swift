//
//  UILabel+TextStyle.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UILabel {
	public func applyStyle(_ style: TextStyle) {
		self.font = style.font
		self.textColor = style.color
	}
}
