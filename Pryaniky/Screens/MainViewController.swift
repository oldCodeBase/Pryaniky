//
//  MainViewController.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var viewModel: MainListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    private func setupNavBar() {
        title                = viewModel.title
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor     = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func fetchData() {
        viewModel.networkProvider.fetchData { [weak self] result in
            DispatchQueue.main.async {
                self?.viewModel.model = result
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame      = view.bounds
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.rowHeight  = 80
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
    }
    
    @objc private func segmentTapped(_ sender: UISegmentedControl) {
        viewModel.coordinator?.startAlertViewCoordinator(with: viewModel.cells.first!,
                                                         selectedSegment: sender.selectedSegmentIndex)
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID) as! CustomCell
        cell.segmentedControl.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
        cell.set(with: viewModel.cell(at: indexPath))
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.coordinator?.startAlertViewCoordinator(with: viewModel.selectedRow(at: indexPath),
                                                         selectedSegment: nil)
    }
}
