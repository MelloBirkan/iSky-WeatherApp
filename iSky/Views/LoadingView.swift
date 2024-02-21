//
//  LoadingView.swift
//  iSky
//
//  Created by Marcello Gonzatto Birkan on 21/02/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: .white))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
