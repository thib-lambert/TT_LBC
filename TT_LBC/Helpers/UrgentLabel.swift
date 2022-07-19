//
//  UrgentLabel.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 19/07/2022.
//

import Foundation
import UIKit

class UrgentLabel: PaddingLabel {
	
	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		self.setup()
	}
	
	private func setup() {
		self.font = .boldSystemFont(ofSize: 14)
		self.minimumScaleFactor = 0.75
		self.adjustsFontSizeToFitWidth = true
		self.textColor = .white
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .blazeOrange
		self.text = "URGENT"
		self.topInset = 4
		self.traillingInset = 4
		self.bottomInset = 4
		self.leadingInset = 4
		self.textAlignment = .center
		self.layer.cornerRadius = 4
		self.layer.masksToBounds = true
		self.layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMaxXMaxYCorner
		]
	}
}
