//
//  CustomSectionOneTableViewCell.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 24.11.2022.
//

import UIKit

class CustomSectionOneTableViewCell : UITableViewCell {

//    let view : UIView = {
//        let view = UIView(frame: CGRect())
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemBlue
//        return view
//    }()

    private lazy var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .systemGreen
        print(self)

        addSubViews()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addSubViews(){
        //addSubview(view)
        self.addSubview(collectionView)
    }

    func addConstraints(){
        NSLayoutConstraint.activate([

//            view.heightAnchor.constraint(equalToConstant: 84),
//            view.widthAnchor.constraint(equalToConstant: 100),
//            view.topAnchor.constraint(equalTo: super.topAnchor, constant: 0),
//            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 0),
//            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: 0),
//            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

//            collectionView.heightAnchor.constraint(equalToConstant: 300),
//            collectionView.widthAnchor.constraint(equalToConstant: 300),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}

extension CustomSectionOneTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension CustomSectionOneTableViewCell : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 30, height: 30)
//    }

}
