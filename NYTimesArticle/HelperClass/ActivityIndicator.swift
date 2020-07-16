//
//  ActivityIndicatorView.swift
//  AapnaTourister
//
//  Created by AAPNA on 07/06/20.
//  Copyright © 2020 AAPNA. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{

        @Binding var isAnimating: Bool
        let style: UIActivityIndicatorView.Style

        func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style: style)
        }

        func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
            isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        }
}

