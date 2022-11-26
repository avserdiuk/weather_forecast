//
//  CustomTableView.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 23.11.2022.
//

import UIKit

class CustomTableHeaderView : UITableViewHeaderFooterView {

    let view : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 31/255, green: 78/255, blue: 199/255, alpha: 1)
        return view
    }()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addSubViews()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    func addSubViews(){
        addSubview(view)
    }

    func addConstraints(){
        NSLayoutConstraint.activate([

            view.heightAnchor.constraint(equalToConstant: 212),
            view.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor),
            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

        ])
    }
}
