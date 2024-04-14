//
//  CollegeMateApp.swift
//  CollegeMate
//
//  Created by Tj Britt on 4/13/24.
//

import SwiftUI
import Firebase
@main
struct CollegeMateApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SignUpView()
        }
    }
}
