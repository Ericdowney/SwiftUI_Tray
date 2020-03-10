//
//  ContentView.swift
//  SwiftUI_Tray
//
//  Created by Uncanny Apps on 3/10/20.
//  Copyright © 2020 Uncanny Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var displayTray: Bool = true
    @State private var listItems: [Int] = Array(0..<4)
    
    var body: some View {
        TabView {
            TrayContainerView(binding: $displayTray, content: {
                NavigationView {
                    List {
                        ForEach(listItems, id: \.self) { index in
                            NavigationLink(destination: Text("\(index)")) {
                                Text("\(index)")
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Some List")
                    .navigationBarItems(leading: Button(action: { self.listItems.append(self.listItems[self.listItems.count - 1] + 1) }) { Image(systemName: "plus.circle") },
                                        trailing: Button(action: { withAnimation { self.displayTray.toggle() } }) { Image(systemName: "tray") })
                }
                .edgesIgnoringSafeArea(.top)
            }) {
                VStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                        .frame(height: 1.0)
                    Text("I'm a tray!")
                    Spacer()
                }
                .frame(height: 300.0)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemBackground))
                .shadow(radius: 6.0)
            }
            .tag(0)
            .tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
