//
//  displayFunctions.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 10.08.23.
//

import Foundation
import SwiftUI



func getColor(val amount: Float) -> Color {
	return amount > 0 ? .green : .red
}

func getMoneyDisplay(val amount: Float) -> String {

	return amount.formatted(.currency(code: "EUR").locale(Locale(identifier: "de-DE")))
}
