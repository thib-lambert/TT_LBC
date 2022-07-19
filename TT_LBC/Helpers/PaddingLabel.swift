//
//  PaddingLabel.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation
import UIKit

class PaddingLabel: UILabel {
	
	// MARK: - Inspectables
	var topInset: CGFloat = 0
	var bottomInset: CGFloat = 0
	var leadingInset: CGFloat = 0
	var traillingInset: CGFloat = 0
	
	// MARK: - Variables
	override var intrinsicContentSize: CGSize {
		var intrinsicSuperViewContentSize = super.intrinsicContentSize
		intrinsicSuperViewContentSize.height += self.topInset + self.bottomInset
		intrinsicSuperViewContentSize.width += self.leadingInset + self.traillingInset
		
		return intrinsicSuperViewContentSize
	}
}
