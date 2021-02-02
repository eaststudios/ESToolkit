//
//  Collection.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import Foundation

public extension Collection {
	public var nilIfEmpty: Self? {
		return isEmpty ? nil : self
	}

	public subscript(safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}
