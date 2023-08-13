//
//  TransactionStore.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 13.08.23.
//

import Foundation

@MainActor
class TransactionStore: ObservableObject {
	@Published var transactions: [TransactionModel] = []
	
	private static func fileURL() throws -> URL  {
		try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("transactions.data")
	}
	
	 func load() async throws {
		let task = Task<[TransactionModel],Error> {
			let fileUrl = try Self.fileURL()
			guard let data = try? Data(contentsOf: fileUrl) else { return [] }
			let transactions = try JSONDecoder().decode([TransactionModel].self,from: data)
			
			return transactions
		}
		
		let transactions = try await task.value
		self.transactions = transactions
	}
	
	func save(transactions: [TransactionModel]) async throws {
		let task = Task{
			let data = try JSONEncoder().encode(transactions)
			let outfile = try Self.fileURL()
			try data.write(to: outfile)
			
			
		}
		
		_ = try await task.value
	}
}
