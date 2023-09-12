//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import UIKit

final class PhotoViewController: UIViewController {

    private var viewModel = PhotoViewModel()
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPhoto()
        viewModel.list
            .bind { _ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PhotoViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.rowCount
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell")!
        let data = viewModel.cellForRowAt(at: indexPath)
        if data != nil {
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .brown
        }
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    
}
