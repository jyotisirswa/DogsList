//
//  DogsDetailsViewController.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//


import UIKit

protocol DogsDetailsViewControllerProtocol: AnyObject {
    func reloadData()
    func setupTableView()
    func setUpView()
    func setFvrtButton(_ title: String)
}

class DogsDetailsViewController: UIViewController {
    
    //MARK: - Properties
    var presenter: DogsDetailsPresenterProtocol!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var buttonFvrt: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackButton()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    @IBAction func didTapAddFavourite(_ sender: Any) {
        presenter.addFvrtButtonTapped()
    }
}

// MARK: - TabeView (DogDetails)
extension DogsDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view : DogsDetailHeaderView = DogsDetailHeaderView.fromNib()
        guard let dogObj = presenter.getDog() else {
            return nil
        }
        view.viewPresenter = DogsDetailHeaderPresenter(view: view, dogData: dogObj)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
}

// MARK: - Extension + DogsDetailsViewControllerProtocol
extension DogsDetailsViewController : DogsDetailsViewControllerProtocol {
    func setFvrtButton(_ title: String) {
        buttonFvrt.setTitle(title, for: .normal)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.register(viewType: DogsDetailHeaderView.self)
        if #available(iOS 15.0, *) {
          tableView.sectionHeaderTopPadding = 0
        }
    }
    
    func setUpView() {
        self.title = "Detailed view"
        self.tableView.contentInsetAdjustmentBehavior = .never
        setAccessibilityIdentifiers()
    }
}
// MARK: - Extension + setAccessibilityIdentifiers
extension DogsDetailsViewController {
    func setAccessibilityIdentifiers() {
        self.tableView.accessibilityIdentifier = "detailTableView"
    }
}
