//
//  TransactionRowView.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 07.08.23.
//

import SwiftUI

struct TransactionRowView: View {
	 var transaction: TransactionModel
    var body: some View {
		HStack {
			Image(systemName: "bag").font(.system(size: 24))
				
			VStack(alignment: .leading) {
				Text(transaction.shopname).font(.headline)
				Text(transaction.category.name).font(.subheadline)
			}.padding(.horizontal)
			Spacer()
			Text(getMoneyDisplay(val: transaction.amount))
				.font(.body)
				.foregroundColor(getColor(val: transaction.amount))
			
		
			
			
		}
    }
	

}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
	
		
		
		
        TransactionRowView(transaction: transaction1)
		
		TransactionRowView(transaction: transaction2)
    }
}
