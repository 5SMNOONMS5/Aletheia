//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// UIView haa been conform to protocol 'AletheiaCompatible',
/// so 'UITableView' can benefit from it
extension AletheiaWrapper where Base: UITableView {

    public func register<T: UITableViewCell>(_: T.Type) {
        base.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }

    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = base.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }

    public func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) {
        base.register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }

    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = base.dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Could not dequeue header footer view with identifier: \(String(describing: T.self))")
        }
        
        return headerFooterView
    }
}

