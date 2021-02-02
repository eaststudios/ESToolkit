//
//  OperatingSystemVersion.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import Foundation

public extension OperatingSystemVersion {
	public var formatted: String {
		if patchVersion == 0 {
			return String(format: "%i.%i", majorVersion, minorVersion)
		}

		return String(format: "%i.%i.%i", majorVersion, minorVersion, patchVersion)
	}
}
