//
//  EditTransactionView.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 11.08.23.
//

import SwiftUI

struct EditTransactionView: View {
	@Binding var transaction: TransactionModel
	@State private var newTagName = ""
    var body: some View {
		Form{
			Section(header: Text("Transaction Details")) {
				TextField("Name",text: $transaction.shopname)
				TextField("Category", text: $transaction.category.name)
				TextField("Amount",value: $transaction.amount, format: .currency(code: "EUR"))
				
				Picker("Type", selection: $transaction.type) {
					ForEach(TransactionModel.TransactionType.allCases) { type in
						Text(type.rawValue.capitalized)
					}
				}
					
				
				DatePicker("Date", selection: $transaction.date,in: ...Date())
				
			}
			
			Section(header: Text("Tags")) {
			
				
				if !transaction.tags.isEmpty {
					HStack {
						ForEach(transaction.tags, id: \.id) { tag in
							Text(tag.name).padding(.all,8).background(.yellow).foregroundColor(.black).cornerRadius(12)
							
						}.onDelete { indicies in
							transaction.tags.remove(atOffsets: indicies)
							
						}
					}
				}
				HStack{
					
				TextField("Tag Name (optional)",text: $newTagName)
					Button("Add", action: {
						withAnimation{
							let tag = TransactionModel.TransactionTags(name: newTagName)
							transaction.tags.append(tag)
							newTagName = ""
						}
					})
					.disabled(newTagName.isEmpty)
					
				}
				
				
			}
			
		}
    }
	
	func deleteTag(_ tag: TransactionModel.TransactionTags) {
		transaction.tags.removeAll {
			$0.id == tag.id
		}
		}
	
	func addTagToTransaction() {
		if(newTagName == "") {return }
		
			var updatedTags = transaction.tags
			updatedTags.append(TransactionModel.TransactionTags(name: newTagName))
			
			transaction.tags = updatedTags
			newTagName = "" // Clear the new tag name field
		}
}

struct EditTransactionView_Previews: PreviewProvider {
    static var previews: some View {
		EditTransactionView(transaction: .constant(.emptyTransaction))
    }
}
