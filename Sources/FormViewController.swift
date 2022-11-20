//
//  FormViewController.swift
//  
//
//  Created by James Randolph on 1/21/21.
//

import UIKit
import Combine

/// A view controller that displays a form.
open class FormViewController: UITableViewController {
    
    private var dataSource: FormDataSource!
    
    private var subscriptions = Set<AnyCancellable>()
    
    /// The abstract representation of the form managed by the controller object.
    public var form: Form! {
        didSet {
            dataSource = FormDataSource(tableView: tableView, form: form)
            applySnapshot(animated: false)
            Publishers.MergeMany(form.sections.compactMap({ $0.hiddenChanged }))
                .merge(with: Publishers.MergeMany(form.sections.map({ Publishers.MergeMany($0.rows.compactMap({ $0.hiddenChanged })) })))
                .sink { _ in
                    self.applySnapshot(animated: true)
                }.store(in: &subscriptions)
        }
    }
    
    private func applySnapshot(animated: Bool) {
        var snapshot = FormDataSource.Snapshot()
        let enumeratedSections = form.sections.enumerated().filter({ !$0.element.hidden && $0.element.rows.contains(where: { !$0.hidden }) })
        snapshot.appendSections(enumeratedSections.map({ $0.offset }))
        for (n, section) in enumeratedSections {
            snapshot.appendItems(section.rows.filter({ !$0.hidden }), toSection: n)
        }
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    open override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionIndex: Int
        if #available(iOS 15.0, *) {
            sectionIndex = dataSource.sectionIdentifier(for: section)!
        } else {
            sectionIndex = dataSource.snapshot().sectionIdentifiers[section]
        }
        return form.sections[sectionIndex].headerHeight
    }
    
    open override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionIndex: Int
        if #available(iOS 15.0, *) {
            sectionIndex = dataSource.sectionIdentifier(for: section)!
        } else {
            sectionIndex = dataSource.snapshot().sectionIdentifiers[section]
        }
        return form.sections[sectionIndex].footerHeight
    }

    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource.itemIdentifier(for: indexPath)?.height ?? tableView.rowHeight
    }

    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.itemIdentifier(for: indexPath)?.onSelect?(tableView, indexPath)
    }
}
