//
//  TextStyle.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public struct TextStyle {
	public let font: UIFont
	public let color: UIColor

	public init(font: UIFont, color: UIColor = .label) {
		self.font = font
		self.color = color
	}
}
