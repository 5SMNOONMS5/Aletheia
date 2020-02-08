//
//  Extension+UICollectionView.swift
//  Aletheia
//
//  Created by stephen on 2019/6/27.
//  Copyright © 2019 stephenchen. All rights reserved.
//

import UIKit

/// UIView haa been conform to protocol 'AletheiaCompatible',
/// so 'UITableView' can benefit from it
extension AletheiaWrapper where Base: UICollectionView {
    
    public func register<T: UICollectionViewCell>(_: T.Type) {
        base.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = base.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
}
