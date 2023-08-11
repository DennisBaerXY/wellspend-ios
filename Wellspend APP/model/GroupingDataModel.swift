//
//  GroupingDataModel.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 25.07.23.
//

import Foundation


struct GroupingDataModel {
	var name: String
	var amount: Float
}

struct AccountModel: Identifiable {
	var id = UUID()
	var name: String
	var groupings: [GroupingDataModel]
}
