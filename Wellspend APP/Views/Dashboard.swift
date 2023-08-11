//
//  Dashboard.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 25.07.23.
//

import SwiftUI

struct Dashboard: View {
	@Binding var transactions: [TransactionModel]
	@Binding var accounts: [AccountModel]
    var body: some View {
		VStack {
			
			HStack {
				
				Text("+3000€")
					.foregroundColor(Color.green)
					.font(.largeTitle)
			}
			Divider()
			HStack {
				Text("Accounts")
					.font(.headline)
				Spacer()
			}
			
			
			VStack(spacing: 8) {
				ForEach(accounts) { account in
					MoneyGroupingCard(heading: account.name,data: account.groupings)
				}
				
				
				
			}.padding(.vertical,8)
			HStack{
				Text("Total").font(.headline)
				Spacer()
				Text(getMoneyDisplay(val:calculateTotalFromAccounts(accounts: accounts)))
			}
			Divider()
			HStack{
				Text("Last Transactions").font(.headline)
				Spacer()
				NavigationLink(destination: EmptyView()) {
					Label("Add",systemImage: "plus")
				}
			}
		
			
			TransactionListView(transactions: $transactions)
			
			
			Spacer()
			
		}.navigationTitle("Dashboard")
			.padding(.all)
    }
	
	func calculateTotalFromAccounts(accounts: [AccountModel]) -> Float {
		var total: Float = 0.0
		for account in accounts{
			total += account.groupings.map {$0.amount}.reduce(0, {x,y in
				x + y
				
			}
			)
		}
		return total
	}
}

struct Dashboard_Previews: PreviewProvider {
	static var previews: some View {
		

		NavigationStack {
			Dashboard(transactions: .constant(transactionsFake), accounts: .constant(accountsFake))
		}
	}
}




