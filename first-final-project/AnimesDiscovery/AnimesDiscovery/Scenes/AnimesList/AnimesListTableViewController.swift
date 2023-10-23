//
//  AnimesListTableViewController.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import UIKit

class AnimesListTableViewController: UITableViewController {
    
    let viewModel = AnimesListTableViewModel(service: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.dataSource.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        Task {
            do {
                try await viewModel.fetchDiscoveryAnimes()
            } catch let error as NetworkError {
                print("Erro ->", error.description)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSourceCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.dataSourceCount > 0,
           let cell = tableView.dequeueReusableCell(withIdentifier: AnimesListTableViewCell.identifier,
                                                    for: indexPath) as? AnimesListTableViewCell,
           let animeModel = viewModel.dataSource.value?[indexPath.row] {
            cell.setup(anime: animeModel)
            return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: "EmptyViewCell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /*if let animeModel = viewModel.dataSource.value?[indexPath.row] {
            navigationController?.pushViewController(DetailsViewController(model: model), animated: true)
        }*/
    }
}
