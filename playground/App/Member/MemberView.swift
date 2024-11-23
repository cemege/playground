//
//  MemberView.swift
//  Playground
//
//  Created by Cem Ege on 22.11.2024.
//

import SwiftUI
import Network

struct MemberView: View {
    
    // MARK: - Properties
    @Environment(Client.self) var client: Client
    
    @State private var member: MemberResponse?
    
    var body: some View {
        VStack {
            Text(member?.name ?? "")
            Text(member?.surname ?? "")
            Text(member?.email ?? "")
        }
        .task {
            await fetchMember()
        }
    }
}

// MARK: - Network
private extension MemberView {
    func fetchMember() async {
        let request = MemberRequest.member(id: 1)
        self.member = await client.fetch(request: request, MemberResponse.self)
    }
}

#Preview {
    MemberView()
}
