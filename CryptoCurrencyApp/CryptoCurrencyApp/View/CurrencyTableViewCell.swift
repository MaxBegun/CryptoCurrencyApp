import UIKit

//final class CurrencyTableViewCell: UITableViewCell {
//    // MARK: - Properties
//    // MARK: Public
//    public let currencyName = UILabel()
//    public let currencyValue = UILabel()
//    // MARK: Private
//    // MARK: - Lifecycle
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubviews()
//        setupUI()
//        addConstraints()
//    }
//    // MARK: - Setups
//    private func addSubviews() {
//        contentView.addSubview(currencyName)
//        contentView.addSubview(currencyValue)
//    }
//    
//    private func setupUI() {
//        currencyName.textAlignment = .left
//        currencyName.textColor = UIColor.white
//        currencyName.font = .systemFont(ofSize: 23, weight: .semibold)
//        
//        currencyValue.textAlignment = .right
//        currencyValue.textColor = .systemGray
//        
//        contentView.layer.cornerRadius = 12
//        contentView.layer.masksToBounds = true
//        contentView.layer.borderWidth = .zero
//        contentView.backgroundColor = UIColor(red: 37/255, green: 35/255, blue: 51/255, alpha: 1.0)
//    }
//    
//    private func addConstraints() {
//        currencyName.translatesAutoresizingMaskIntoConstraints = false
//        currencyName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        currencyName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
//        currencyName.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        currencyName.trailingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        
//        currencyValue.translatesAutoresizingMaskIntoConstraints = false
//        currencyValue.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        currencyValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
//        currencyValue.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        currencyValue.leadingAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
