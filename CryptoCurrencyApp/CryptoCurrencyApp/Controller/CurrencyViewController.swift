import UIKit

final class CurrencyViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let mainTableView = UITableView()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var currencyArray = [CurrencyClientModel]() {
        didSet {
            self.mainTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        APIManager.instance.getAllAssets { data in
            self.currencyArray = data
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(mainTableView)
        view.addSubview(activityIndicator)
    }

    private func setupUI() {
        view.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        //navigationController
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Exchange Rates"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //activityIndicator
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        //mainTableView
        mainTableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        mainTableView.separatorColor = .clear
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyTableViewCell")
    }
    
    private func addConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}
// MARK: - Helper
extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return currencyArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.backgroundColor = .clear
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as? CurrencyTableViewCell {
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.currencyName.text = currencyArray[indexPath.section].name
            if let currencyValue = currencyArray[indexPath.section].priceUsd {
                cell.currencyValue.text = "$\(String(format: "%.3f", currencyValue))"
            } else { cell.currencyValue.text = "No data" }
            
            return cell
        }
        return UITableViewCell()
    }
}

