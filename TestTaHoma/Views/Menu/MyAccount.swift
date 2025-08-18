//
//  MyAccount.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct MyAccount: View {
    
    let user: User
    let viewModel: UserViewModel
    
    var body: some View {
        VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                    .foregroundStyle(.blue)
                .padding()
                
                UserFirstNameView(user: user)

                UserLastNameView(user: user)

                UserEmailView(user: user, viewModel: viewModel)
                
                UserAdressView(user: user)
            }
            .navigationTitle("My Account")
    }
}

struct UserFirstNameView: View {
    let user: User
    var body: some View {
        GroupBox {
            HStack {
                Text("First Name")
                    .font(.headline)
                Spacer()
                Text(user.firstName)
            }
        }
    }
}

struct UserLastNameView: View {
    let user: User
    var body: some View {
        GroupBox {
            HStack {
                Text("Last Name")
                    .font(.headline)
                Spacer()
                Text(user.lastName)
            }
        }
    }
}

struct UserEmailView: View {
    let user: User
    let viewModel: UserViewModel
    var body: some View {
        GroupBox {
            HStack {
                Text("Email")
                    .font(.headline)
                Spacer()
                Text("\(viewModel.getDiplayUserEmail(for: user))")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UserAdressView: View {
    let user: User
    var body: some View {
        GroupBox {
            HStack {
                Text("Adress")
                    .font(.headline)
                Spacer()

                VStack(alignment: .leading) {
                    Text("\(user.address.street)")
                    Text("\(user.address.postalCode) \(user.address.city)")
                    Text("\(user.address.country)")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let modelData = ModelData()
    return MyAccount(user: modelData.users[0],
                     viewModel: UserViewModel(modelData: modelData))
}
