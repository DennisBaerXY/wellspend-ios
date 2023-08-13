//
//  TransactionDetailScreen.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 10.08.23.
//

import SwiftUI

struct TransactionDetailView: View {
	@Binding var transaction: TransactionModel
	@State private var editingTransaction = TransactionModel.emptyTransaction
	@State private var isPresentingEditView = false

    var body: some View {
		VStack{
			Text(getMoneyDisplay(val:transaction.amount))
				.foregroundColor(getColor(val: transaction.amount))
				.font(.title)
				.bold()
		
			
			List {
				Section(header: Text("Details").font(.headline)) {
					
					HStack {
						Label("Category",systemImage: "rectangle.3.group")
						Spacer()
						Text(transaction.category.name)
					}
					if(!transaction.tags.isEmpty) {
						
					
						HStack{
							Label("Tags",systemImage:"tag")
							Spacer()
							HStack{
								ForEach(transaction.tags) {
									Text($0.name)
										.padding(4)
										.foregroundColor(.black)
										.background(.yellow)
										.cornerRadius(4)
								}
							}
						}
					}
				HStack {
					Label("Date",systemImage: "calendar")
					Spacer()
					Text(transaction.date,style: .date)
				}
					
				HStack {
					Label("Time",systemImage: "timer")
					Spacer()
					Text(transaction.date.formatted(date: .omitted, time: .shortened))
				}
			}
				
			}.listStyle(.inset)
			
			Spacer()
			
		
				
				
				

			
		}.navigationTitle(transaction.shopname)
			.toolbar(content: {
				Button("Edit") {
					isPresentingEditView = true
					editingTransaction = transaction
				}
			})
			.sheet(isPresented: $isPresentingEditView)  {
				NavigationStack{
					EditTransactionView(transaction: $editingTransaction)
						.toolbar{
							ToolbarItem(placement: .cancellationAction) {
								Button("Cancel") {
									isPresentingEditView = false
								}
							}
								
							ToolbarItem(placement: .confirmationAction) {
								Button("Done") {
									isPresentingEditView = false
									transaction = editingTransaction
								}
							}
							
						}
				}
			
			}
			.padding(.all)
			
			
		
	}
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			TransactionDetailView(transaction: .constant(transaction1))
		}
		
        
    }
}
