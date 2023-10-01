//
//  UIApplication_.swift
//  SwiftUI-Test
//
//  Created by 김인섭 on 2023/10/01.
//

import UIKit

extension UIApplication {
    
    static var windowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    static var safeArea: UIEdgeInsets {
        windowScene?.windows.first?.safeAreaInsets ?? .zero
    }
}
