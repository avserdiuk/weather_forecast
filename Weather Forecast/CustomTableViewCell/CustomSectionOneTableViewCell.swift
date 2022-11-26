//
//  CustomSectionOneTableViewCell.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 24.11.2022.
//

import UIKit

class CustomSectionOneTableViewCell : UITableViewCell {

    let view : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubViews()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addSubViews(){
        addSubview(view)
    }

    func addConstraints(){
        NSLayoutConstraint.activate([

            view.heightAnchor.constraint(equalToConstant: 80),
            view.topAnchor.constraint(equalTo: super.topAnchor, constant: 0),
            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

        ])
    }
}
