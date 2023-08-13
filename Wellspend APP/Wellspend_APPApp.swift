//
//  Wellspend_APPApp.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 25.07.23.
//

import SwiftUI

@main
struct Wellspend_APPApp: App {
	@StateObject private var store = TransactionStore()
	@State private var accounts = accountsFake
    var body: some Scene {
		
        WindowGroup {
			NavigationStack {
				Dashboard(transactions: $store.transactions,accounts: $accounts)
				{
					Task{
						do	 {
							try await store.save(transactions: store.transactions )
						} catch {
							fatalError(error.localizedDescription)
						}
					}
				}
					.task {
						do	 {
							try await store.load()
						} catch {
							fatalError(error.localizedDescription)
						}
					}
			}
      
        }
    }
	
	
}
