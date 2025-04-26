//
//  ErrorAlert.swift
//  EpicSystems-Task
//
//  Created by Younan Adly on 26/04/2025.
//

import SwiftUI

struct ErrorAlert: View {
    @Binding var errorMessage: String?
    
    var body: some View {
        EmptyView()
            .alert(isPresented: Binding(
                get: { errorMessage != nil },
                set: { _ in errorMessage = nil }
            )) {
                Alert(
                    title: Text(Localizable.Alert.errorTitle),
                    message: Text(errorMessage ?? Localizable.Alert.unknownError),
                    dismissButton: .default(Text(Localizable.Alert.okButton))
                )
            }
    }
}

#Preview {
    ErrorAlert(errorMessage: .constant(
        Localizable.Alert.errorTitle
    ))
}
