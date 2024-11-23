//
//  ContentView.swift
//  Playground
//
//  Created by Cem Ege on 14.09.2024.
//

import SwiftUI
import Extensions
import Components
import Network

struct ContentView: View {
    
    @Environment(\.client) var client: Client
    
    @State private var response: MemberResponse?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CircularLoadingView()
                    .theme(.blue)
                
                Divider()
                
                LineLoadingView()
                    .animationColor(.blue500, .blue300)
                
                Divider()
                
                CircularProgressView(currentStep: 3, totalSteps: 5)
                    .type(.blue)
                
                Divider()
                
                HeaderProgressView()
                    .type(.blue)
                    .title("Yetki belgesi")
                    .description("8 haneli yetki belgesi numaranızı yazarak sorgulama yapın.")
                    .steps(currentStep: 2, totalSteps: 5)
                
                Divider()
                
                ButtonView()
                    .title("Button")
                    .theme(.primaryBlue(.enabled))
                    .size(.medium)
                    .type(.basic)
                    .action {
                        print("Button Tapped")
                    }
                
                Divider()
                
                PickerView(selectedItem: .constant(""), stateType: .constant(.enabled))
                    .type(.city(hasTitle: true))
                    .tapGesture(nil)
                
                Divider()
                
                TextFieldView(
                    text: .constant("cem@cemege.dev"),
                    stateType: .constant(.enabled),
                    isFocused: .init()
                )
                .onEditingChanged({ _ in })
                .onCommit({ _ in })
                .onChangeCharacter({ _ in })
            }
            .padding()
        }
        .task {
            await fetchMember()
        }
    }
}

// MARK: - Requests
private extension ContentView {
    func fetchMember() async {
        let request = MemberRequest.member(id: 1)
        self.response = await client.fetch(request: request, MemberResponse.self)
    }
}

#Preview {
    ContentView()
}
