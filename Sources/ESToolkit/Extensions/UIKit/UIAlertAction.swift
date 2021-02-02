//
//  UIAlertAction.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIAlertAction {
	public static let ok = UIAlertAction(title: "alert.action.ok".localized, style: .cancel, handler: nil)
	public static let cancel = UIAlertAction(title: "alert.action.cancel".localized, style: .cancel, handler: nil)
}
