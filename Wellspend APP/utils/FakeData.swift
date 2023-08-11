//
//  FakeData.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 10.08.23.
//

import Foundation


	// Create sample categories

let groceriesCategory = TransactionModel.TransactionCategory(name: "Groceries")
	let entertainmentCategory = TransactionModel.TransactionCategory(name: "Entertainment")
	let utilitiesCategory = TransactionModel.TransactionCategory(name: "Utilities")
let foodAndDrinksCategory = TransactionModel.TransactionCategory(name: "Food & Drinks")
let shoppingCategory = TransactionModel.TransactionCategory(name: "Shopping")

	// Create sample transactions
let transaction1 = TransactionModel(shopname: "Supermart", amount: 75.0, date: Date(), category: groceriesCategory, tags: [TransactionModel.TransactionTags(name: "Food"), TransactionModel.TransactionTags(name: "Water")])
	let transaction2 = TransactionModel(shopname: "Movie Theater", customName: "Movie Tickets", amount: -20.0, date: Date(), category: entertainmentCategory)
	let transaction3 = TransactionModel(shopname: "Electricity Co.", amount: -120.0, date: Date(), category: utilitiesCategory)
	let transaction4 = TransactionModel(shopname: "Coffee Shop", amount: 5.0, date: Date(), category: foodAndDrinksCategory)
	let transaction5 = TransactionModel(shopname: "Bookstore", amount: -50.0, date: Date(), category: shoppingCategory)
	let transaction6 = TransactionModel(shopname: "Restaurant", amount: -40.0, date: Date(), category: foodAndDrinksCategory)
	let transaction7 = TransactionModel(shopname: "Clothing Store", amount: -100.0, date: Date(), category: shoppingCategory)
	let transaction8 = TransactionModel(shopname: "Tech Store", amount: -500.0, date: Date(), category: shoppingCategory)

	// Array to store transactions
	var transactionsFake: [TransactionModel] = [transaction1, transaction2, transaction3, transaction4, transaction5, transaction6, transaction7, transaction8]


let exampleData1: GroupingDataModel = GroupingDataModel(name: "Ing Diba", amount: 3050.10)
let exampleData2: GroupingDataModel = GroupingDataModel(name: "Scalable Capital", amount: 10000.12)
let exampleData3: GroupingDataModel = GroupingDataModel(name: "Account 3", amount: 5000.0)
let exampleData4: GroupingDataModel = GroupingDataModel(name: "Account 4", amount: 7500.0)

let exampleAccount1 = AccountModel(name: "Savings Account", groupings: [exampleData1, exampleData3])
let exampleAccount2 = AccountModel(name: "Investment Account", groupings: [exampleData2, exampleData4])

let accountsFake: [AccountModel] = [exampleAccount1, exampleAccount2]
