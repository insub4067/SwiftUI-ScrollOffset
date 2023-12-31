//
//  View+.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 2023/10/01.
//

import SwiftUI

extension View {
    
    func offset(offset: Binding<CGFloat>) -> some View{
        self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value - UIApplication.safeArea.top
                }
            }
    }
}

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}
