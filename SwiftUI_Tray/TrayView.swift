//
//  TrayView.swift
//  SwiftUI_Tray
//
//  Created by Uncanny Apps on 3/10/20.
//  Copyright © 2020 Uncanny Apps. All rights reserved.
//

import SwiftUI

struct TrayView<Content: View>: View {
    
    var closeAction: () -> Void
    var content: Content
    
    init(closeAction: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.closeAction = closeAction
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            Rectangle()
                .foregroundColor(Color(UIColor.systemBackground).opacity(0.01))
                .onTapGesture { withAnimation { self.closeAction() } }
            content
        }
    }
}
