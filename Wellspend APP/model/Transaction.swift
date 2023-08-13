//
//  Transaction.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 07.08.23.
//

import Foundation

struct TransactionModel : Identifiable, Codable{
	var shopname: String
	var customName: String = ""
	var type: TransactionType = .expense
	var amount: Float
	var date: Date
	var category: TransactionCategory
	var tags: [TransactionTags] = []
	var id = UUID()
	

}
extension TransactionModel {
	struct TransactionCategory: Codable {
		var name: String
		var id = UUID()
	}
	struct TransactionTags: Identifiable, Codable {
		var id =  UUID()
		var name: String
	}
	
	enum TransactionType: String, Codable, 	CaseIterable, Identifiable {
		case income
		case expense
		case transaction
		var id:  Self {self}
	}
	
	static var emptyTransaction: TransactionModel{
		TransactionModel(shopname: "",type: .expense, amount: 0.0, date: Date.now, category: TransactionCategory(name: ""), tags: [])
	}
}


