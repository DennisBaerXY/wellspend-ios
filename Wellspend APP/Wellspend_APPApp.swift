//
//  Wellspend_APPApp.swift
//  Wellspend APP
//
//  Created by Dennis Bär on 25.07.23.
//

import SwiftUI

@main
struct Wellspend_APPApp: App {
	@State private var transactions = transactionsFake
	@State private var accounts = accountsFake
    var body: some Scene {
		
        WindowGroup {
			NavigationStack {
				Dashboard(transactions: $transactions,accounts: $accounts)
			}
      
        }
    }
}
