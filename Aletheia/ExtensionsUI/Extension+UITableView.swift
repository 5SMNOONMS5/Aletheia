//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// UIView haa been conform to protocol 'AletheiaCompatible',
/// so 'UITableView' can benefit from it

extension UITableViewCell: AletheiaCompatibleValue { }

extension AletheiaWrapper where Base == UITableView {
    
    /// Convience way to register a TableviewCell, This code was inspired from [Here](http://qiita.com/tattn/items/bdce2a589912b489cceb#uitableview)
    ///
    /// - parameter cell  : A UITableViewCell class
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// tableView.registerClass(cellType: MyCell.self)
    ///
    /// ```
    public func registerClass<T: UITableViewCell>(cellType: T.Type) {
        /// FIXME: To to write
    }

    /// Convience way to register a TableviewCell, This code was inspired from [Here](http://qiita.com/tattn/items/bdce2a589912b489cceb#uitableview)
    ///
    /// - parameter cell  : A UITableViewCell class
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// tableView.registerNib(cellType: MyCell.self)
    ///
    /// ```
    public func registerNib<T: UITableViewCell>(cell: T.Type) {
        /// FIXME: To to write
    }
    
    /// Convience way to register multiply TableviewCells
    ///
    /// - parameter cells  : Multiply UITableViewCell class
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// tableView.registerNibs(cellTypes: [MyCell1.self, MyCell2.self])
    ///
    /// ```
    public func registerNibs<T: UITableViewCell>(cells: [T.Type]) {
        cells.forEach { registerNib(cell: $0) }
    }
    
    /// Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
    ///
    /// - parameter type  : A UITableViewCell class
    /// - parameter indexPath  : indexPath of UITableViewCell
    ///
    /// How to usage
    ///
    /// ```swift
    ///
    /// let cell = tableView.dequeueReusableCell(with: MyCell.self, for: indexPath)
    ///
    /// ```
//    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        /// FIXME: To to write
//        return T
//        return base.dequeueReusableCell(withIdentifier: type.gc_ClassName, for: indexPath) as! T
//    }
}
