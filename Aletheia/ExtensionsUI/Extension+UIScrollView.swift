//
//  Extension+UIScrollView.swift
//  Aletheia
//
//  Created by stephen on 2019/6/27.
//  Copyright © 2019 stephenchen. All rights reserved.
//

#if os(iOS)

import UIKit

extension AletheiaWrapper where Base == UIScrollView {
    
    /// Update contentSize height while scroll view did finish layout all subviews
    func updateContentViewHeight() {
        base.contentSize.height = base.subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? base.contentSize.height
    }
    
    /// Update contentSize Width while scroll view did finish layout all subviews
    func updateContentViewWidth() {
        base.contentSize.width = base.subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? base.contentSize.width
    }
}

#endif
