//
//  RemoteImage.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/24.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject private var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}
