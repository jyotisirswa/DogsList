//
//  DogsListViewController.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import UIKit

protocol DogsListViewControllerProtocol: AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func setupTableView()
    func setUpView()
}

class DogsListViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    var presenter: DogsListPresenterProtocol!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DogsListRouter.createModule(dogsListVCRef: self)
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    @objc func refresh() {
        presenter?.refresh()
    }
    
}

// MARK: - TabeView (List)
extension DogsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: DogsListCell.self, for: indexPath)
        cell.selectionStyle = .none
        if let dogData = presenter.dogs(indexPath.row) {
            cell.cellPresenter = DogsListCellPresenter(view: cell, dogData: dogData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(index: indexPath.row)
    }
}

//MARK: - Extension +  DogsListViewControllerProtocol
extension DogsListViewController : DogsListViewControllerProtocol, LoadingShowable {
    func reloadData() {
        self.refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(refreshControl)
        tableView.register(cellType: DogsListCell.self)
    }
    
    func setUpView() {
        setAccessibilityIdentifiers()
    }
}

//MARK: - Extension +  SettingAccessibilityIdentifiers
extension DogsListViewController {
    func setAccessibilityIdentifiers() {
        tableView.accessibilityIdentifier = "listTableView"
    }
}
