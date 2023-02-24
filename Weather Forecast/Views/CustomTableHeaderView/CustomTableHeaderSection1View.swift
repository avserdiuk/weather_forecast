//
//  CustomTableHeaderSection1View.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 01.12.2022.
//

import Foundation
import UIKit

class CustomTableHeaderSection1View : UITableViewHeaderFooterView{

    private lazy var view : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.borderWidth = 1
        return view
    }()

    private lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Подробнее на 24 часа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private lazy var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addSubview(view)
        view.addSubview(label)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            view.heightAnchor.constraint(equalToConstant: 145),
            view.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor, constant: 0),
            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 13),
            label.rightAnchor.constraint(equalTo: view.rightAnchor),

            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension CustomTableHeaderSection1View : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        return cell
    }
}

extension CustomTableHeaderSection1View : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 42, height: 84)
    }

}

