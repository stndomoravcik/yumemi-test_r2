//
//  VSpacer.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/05.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct VSpacer: View {
    
    private let size: CGFloat
    
    init(_ size: CGFloat) {
        self.size = size
    }
    
    var body: some View {
        Spacer().frame(height: size)
    }
    
}
