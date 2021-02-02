//
//  UIDevice.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIDevice {
	/// Get the model name, e.g. `iPhone10,6`.
	public var modelName: String {
		#if targetEnvironment(macCatalyst)
		let service = IOServiceGetMatchingService(kIOMasterPortDefault,
												  IOServiceMatching("IOPlatformExpertDevice"))
		var identifier: String?

		if let modelData = IORegistryEntryCreateCFProperty(service, "model" as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? Data {
			if let modelIdentifierCString = String(data: modelData, encoding: .utf8)?.cString(using: .utf8) {
				identifier = String(cString: modelIdentifierCString)
			}
		}

		IOObjectRelease(service)
		return identifier ?? "Mac1,1"

		#else

		var systemInfo = utsname()
		uname(&systemInfo)

		let machineMirror = Mirror(reflecting: systemInfo.machine)

		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8, value != 0 else { return identifier }
			return identifier + String(UnicodeScalar(UInt8(value)))
		}

		return identifier
		#endif
	}
}
