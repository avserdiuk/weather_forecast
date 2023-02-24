
import Foundation
import UIKit

class CustomCollectionViewCell : UICollectionViewCell {

    let viewCell : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 23
        view.layer.borderWidth = 0.5
        view.layer.borderColor = CGColor(red: 171/255, green: 188/255, blue: 234/255, alpha: 1)
        return view
    }()

    private lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    lazy var iconImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "rain")
        return img
    }()

    private lazy var degrLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23°"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(viewCell)
        viewCell.addSubview(timeLabel)
        viewCell.addSubview(iconImage)
        viewCell.addSubview(degrLabel)

        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: self.topAnchor),
            viewCell.leftAnchor.constraint(equalTo: self.leftAnchor),
            viewCell.rightAnchor.constraint(equalTo: self.rightAnchor),
            viewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            timeLabel.centerXAnchor.constraint(equalTo: viewCell.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: super.topAnchor, constant: 12),

            iconImage.centerXAnchor.constraint(equalTo: viewCell.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: super.topAnchor, constant: 37),

            degrLabel.centerXAnchor.constraint(equalTo: viewCell.centerXAnchor),
            degrLabel.topAnchor.constraint(equalTo: super.topAnchor, constant: 58),
        ])
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


