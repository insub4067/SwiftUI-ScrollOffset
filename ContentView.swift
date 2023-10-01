//
//  ContentView.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 2023/09/17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State var offset: CGFloat = .zero
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Array(viewModel.list.enumerated()), id: \.offset) { offset, item in
                    ItemCell(offset: offset, item: item)
                }
            }
            .padding()
            .offset(offset: $offset)
        }
        .overlay(alignment: .top) {
            Text("\(offset)")
        }
    }
    
    @ViewBuilder func ItemCell(offset: Int, item: String) -> some View {
        HStack {
            Image(systemName: item)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Spacer()
            Text("\(offset)")
                .font(.title)
        }
        .frame(height: 50)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
