//
//  AddressView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 18.03.2024.
//

import SwiftUI

struct AddressView: View {

    let company: String
    let address: Address

    var body: some View {
        VStack(spacing: 8) {
            companyTitle
            Image(.map)
                .resizable()
                .frame(height: 58)
            addressTitle
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(Color.customGrey1)
        .clipShape(.rect(cornerRadius: 8))
    }

    private var companyTitle: some View {
        HStack {
            Text(company)
                .foregroundStyle(.customWhite)
                .font(.customTitle3)
            Image(.verifiedCompany)
            Spacer()
        }
    }

    private var addressTitle: some View {
        HStack {
            Text(address.fullAddress)
                .foregroundStyle(.customWhite)
                .font(.customTitle3)
            Spacer()
        }
    }
}

#Preview {
    AddressView(
        company: "Мобирикс",
        address: Address(town: "Казань", street: "улица Бирюзова", house: "4/5")
    )
}
