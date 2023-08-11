//
//  Transaction.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 07.08.23.
//

import Foundation

struct TransactionModel : Identifiable{
	var shopname: String
	var customName: String?
	var amount: Float
	var date: Date
	var category: TransactionCategory
	var tags: [TransactionTags] = []
	var id = UUID()
}
extension TransactionModel {
	struct TransactionCategory {
		var name: String
		var id = UUID()
	}
	struct TransactionTags: Identifiable {
		var id =  UUID()
		var name: String
	}
	
	static var emptyTransaction: TransactionModel{
		TransactionModel(shopname: "", amount: 0.0, date: Date.now, category: TransactionCategory(name: ""), tags: [])
	}
}


