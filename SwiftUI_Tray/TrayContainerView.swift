//
//  TrayContainerView.swift
//  SwiftUI_Tray
//
//  Created by Uncanny Apps on 3/10/20.
//  Copyright © 2020 Uncanny Apps. All rights reserved.
//

import SwiftUI

struct TrayContainerView<Content: View, Tray: View>: View {
    
    @Binding var displayTray: Bool
    
    var transition: AnyTransition
    var content: Content
    var tray: Tray
    
    init(binding: Binding<Bool>,
         transition: AnyTransition = .move(edge: .bottom),
         @ViewBuilder content: () -> Content,
         @ViewBuilder tray: () -> Tray) {
        self._displayTray = binding
        self.transition = transition
        self.content = content()
        self.tray = tray()
    }
    
    var body: some View {
        ZStack {
            content
                .zIndex(0.0)
                .blur(radius: displayTray ? 8.0 : 0.0)
            
            
            if displayTray {
                TrayView(closeAction: { self.displayTray = false }) {
                    tray
                }
                .transition(transition)
                .zIndex(1.0)
            }
        }
    }
}
