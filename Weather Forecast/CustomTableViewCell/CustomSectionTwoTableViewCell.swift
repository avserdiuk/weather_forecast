//
//  CustomSectionTwoTableViewCell.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 24.11.2022.
//


import UIKit

class CustomSectionTwoTableViewCell : UITableViewCell {

    let view : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 233/255, green: 238/255, blue: 250/255, alpha: 1)
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

            view.heightAnchor.constraint(equalToConstant: 60),
            view.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor),
            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

        ])
    }
}
