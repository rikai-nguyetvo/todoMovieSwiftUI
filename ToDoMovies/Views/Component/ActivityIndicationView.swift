//
//  ActivityIndicationView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 24/03/2023.
// tai du lieu hoac thuc hien 1 tac vu nang

import SwiftUI

struct ActivitIndicationView : UIViewRepresentable{
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
}
