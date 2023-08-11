//
//  MoneyGroupingCard.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 25.07.23.
//

import SwiftUI

struct MoneyGroupingCard: View {
	var heading: String
	var data: [GroupingDataModel]? = nil
	
	@State private var isExpanded = false
		
		func formatMoney(money: Float) -> String {
			return money.description
		}
		
		func calculateSum(data: [GroupingDataModel]? = nil) -> Float {
			var sum: Float = 0
			for d in data! {
				sum += d.amount
			}
			return sum
		}
		
		var body: some View {
			VStack {
				HStack {
					Button(action: {
						withAnimation(.spring()) {
							isExpanded.toggle()
						}
					}) {
						Label(heading, systemImage: "wallet.pass")
							.foregroundColor(.accentColor)
					}
					Spacer()
					if data == nil {
						Text("")
					} else {
						Text(getMoneyDisplay(val: calculateSum(data: data)))
							
					}
				}
				
				
				if isExpanded {
					Divider()
						VStack(spacing: 8) {
							ForEach(data ?? [], id: \.name) { account in
							HStack {
								Label(account.name, systemImage: "creditcard")
								Spacer()
								Text(getMoneyDisplay(val: account.amount))
							}
							
						}
					}
					
				}
			}
		}
	}

struct MoneyGroupingCard_Previews: PreviewProvider {
    static var previews: some View {
		
		let exampleData: GroupingDataModel = GroupingDataModel(name: "Ing Diba", amount: 3050.10)
		let exampleData2: GroupingDataModel = GroupingDataModel(name: "Scalable Capital", amount: 10000.12)
		
		let array: [GroupingDataModel] = [exampleData,exampleData2]
        MoneyGroupingCard(heading: "Tagesgeld", data: array)
    }
}
