//
//  FormDataSource.swift
//  
//
//  Created by James Randolph on 2/20/21.
//

import UIKit
import Combine

final class FormDataSource: UITableViewDiffableDataSource<Int, Row> {
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Row>
    
    let form: Form
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(tableView: UITableView, form: Form) {
        self.form = form
        super.init(tableView: tableView) { (_, _, row) -> UITableViewCell? in
            if let cellBackgroundColor = form.cellBackgroundColor {
                row.cell.backgroundColor = cellBackgroundColor
            }
            return row.cell
        }
        
        defaultRowAnimation = form.rowAnimation
        if let headerView = form.headerView {
            tableView.tableHeaderView = headerView
        }
        if let footerView = form.footerView {
            tableView.tableFooterView = footerView
        }
        if let rowHeight = form.rowHeight {
            tableView.rowHeight = rowHeight
        }
        if let estimatedRowHeight = form.estimatedRowHeight {
            tableView.estimatedRowHeight = estimatedRowHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let index = snapshot().sectionIdentifiers[section]
        return form.sections[index].header
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let index = snapshot().sectionIdentifiers[section]
        return form.sections[index].footer
    }
}
