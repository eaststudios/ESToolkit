//
//  UIApplication.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIApplication {
	public func open(_ url: URL) {
		open(url, options: [:], completionHandler: nil)
	}

	public var version: String {
		return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "0.0"
	}

	public var build: String {
		return (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? "0000"
	}

	public var appIcon: UIImage? {
		guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
			let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
			let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
			let lastIcon = iconFiles.last else { return nil }

		return UIImage(named: lastIcon)
	}
}
