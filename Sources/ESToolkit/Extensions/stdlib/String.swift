//
//  String.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import Foundation

// MARK: Localization

public extension String {
	public var localized: String {
		return NSLocalizedString(self, comment: "")
	}

	public var failableLocalized: String? {
		let localized = self.localized

		if localized == self {
			return nil
		}

		return localized
	}
}

// MARK: Placeholders

public extension String {
	public func replacingPlaceholders(_ placeholders: [String: String]) -> String {
		var string = self
		string.replacePlaceholders(placeholders)
		return string
	}

	public mutating func replacePlaceholders(_ placeholders: [String: String]) {
		var string = self

		for (key, value) in placeholders {
			string = string.replacingOccurrences(of: "{" + key + "}", with: value)
		}

		self = string
	}
}
