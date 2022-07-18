//
//  Collection+Safe.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Collection {
	
	subscript (safe index: Index) -> Element? {
		indices.contains(index) ? self[index] : nil
	}
}
