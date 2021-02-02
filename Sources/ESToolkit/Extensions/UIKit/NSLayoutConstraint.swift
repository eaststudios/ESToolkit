//
//  NSLayoutConstraint.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
	public func withPriority(_ priority: Int) -> NSLayoutConstraint {
		self.priority = .init(Float(priority))
		return self
	}
}
