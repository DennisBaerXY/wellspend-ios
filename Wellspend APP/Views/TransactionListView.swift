//
//  TransactionListView.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 10.08.23.
//

import SwiftUI

struct TransactionListView: View {
	@Binding var transactions: [TransactionModel]
    var body: some View {
		
		List{
			ForEach($transactions) { $transaction in
				NavigationLink(destination: TransactionDetailView(transaction: $transaction)) {
						TransactionRowView(transaction: transaction)
						
					}
				}
			}

		
		.listStyle(.inset)
	}
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
		let transactions = transactionsFake
		NavigationView {
			TransactionListView(transactions: .constant(transactionsFake))
		}
        
    }
}
