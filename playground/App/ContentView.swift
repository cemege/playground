//
//  ContentView.swift
//  Playground
//
//  Created by Cem Ege on 14.09.2024.
//

import SwiftUI
import Extensions
import Components
import MemberService
import DummyJsonService

struct ContentView: View {
    
    // MARK: - Properties
    private let memberService: MemberServiceProtocol = MemberService()
    private let dummyJsonUserService: UserServiceProtocol = UserService()
    
    @State private var memberModel: MemberModel?
    
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
//            await fetchMember()
            await fetchDummyUsers()
        }
    }
}

// MARK: - Requests
private extension ContentView {
    func fetchMember() async {
        let request = MemberRequest.member(id: 1)
        let result = await memberService.fetchMember(request: request)
        switch result {
        case let .success(member):
            memberModel = member
        case let .failure(error):
            //TODO: alert presenting
            print(error.localizedDescription)
        }
    }
    
    func fetchDummyUsers() async {
        let request = UserRequest.users
        let result = await dummyJsonUserService.fetchUser(request: request)
        
        switch result {
        case let .success(users):
            print(users)
            
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
