//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 23.11.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var image : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Frame")
        return img
    }()

    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Разрешить приложению Weather использовать данные о местоположении вашего устройства"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 248/255, green: 245/255, blue: 245/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    lazy var label_1 : UILabel = {
        let label = UILabel()
        label.text = "Чтобы получить более точные прогнозы погоды во время движения или путешествия"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 248/255, green: 245/255, blue: 245/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    lazy var label_2 : UILabel = {
        let label = UILabel()
        label.text = "Вы можете изменить свой выбор в любое время из меню приложения"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 248/255, green: 245/255, blue: 245/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    lazy var button : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА", for: .normal)
        btn.backgroundColor = UIColor(red: 242/255, green: 110/255, blue: 17/255, alpha: 1)
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.layer.cornerRadius = 10
        return btn
    }()

    lazy var button_1 : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.addTarget(self, action: #selector(main), for: .touchUpInside)
        return btn
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 31/255, green: 78/255, blue: 199/255, alpha: 1)

        addViews()
        addConstraints()
    }

    @objc
    func main(){
        
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: false)
    }

    func addViews(){
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(label_1)
        view.addSubview(label_2)
        view.addSubview(button)
        view.addSubview(button_1)
    }

    func addConstraints(){
        NSLayoutConstraint.activate([

            image.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 148),
            image.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 111),

            label.widthAnchor.constraint(equalToConstant: 322),
            label.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            label.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 400),

            label_1.widthAnchor.constraint(equalToConstant: 314),
            label_1.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            label_1.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 519),

            label_2.widthAnchor.constraint(equalToConstant: 314),
            label_2.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            label_2.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 569),

            button.widthAnchor.constraint(equalToConstant: 340),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 649),

            button_1.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -17),
            button_1.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 714),

        ])
    }

}

