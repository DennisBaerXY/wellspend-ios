//
//  NewTransactionSheet.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 13.08.23.
//

import SwiftUI

struct NewTransactionSheet: View {
	
	@State private var newTransaction = TransactionModel.emptyTransaction
	@Binding var isPresentingNewTransactionView: Bool
	@Binding var transactions: [TransactionModel]
	
	
    var body: some View {
		NavigationStack{
			EditTransactionView(transaction: $newTransaction)
				.toolbar {
					ToolbarItem(placement: .cancellationAction) {
						Button("Dismiss") {
							isPresentingNewTransactionView = false
						}
					}
					
					ToolbarItem(placement: .confirmationAction) {
						Button("Add") {
							transactions.append(newTransaction)
							isPresentingNewTransactionView = false
							
						}
					}
				}
		}
	}
}

struct NewTransactionSheet_Previews: PreviewProvider {
    static var previews: some View {
		NewTransactionSheet(isPresentingNewTransactionView: .constant(true),transactions: .constant(transactionsFake))
	}
}
