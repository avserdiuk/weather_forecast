//
//  SettingsViewController.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 23.11.2022.
//

import UIKit

class SettingsViewComtroller : UIViewController {


    private lazy var additionView : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 233/255, green: 238/255, blue: 250/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var firstCloudImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloud_1")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var secondCloudImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloud_2")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var thirdCloudImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloud_3")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var addViewTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Настройки"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private lazy var addViewTempLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Температура"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 137/255, green: 131/255, blue: 131/255, alpha: 1)
        return label
    }()

    private lazy var addViewTempSwitcher : UISwitch = {
        let label = UISwitch()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var addViewSpeedLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорость ветра"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 137/255, green: 131/255, blue: 131/255, alpha: 1)
        return label
    }()

    private lazy var addViewSpeedSwitcher : UISwitch = {
        let label = UISwitch()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var addViewTimeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Формат времени"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 137/255, green: 131/255, blue: 131/255, alpha: 1)
        return label
    }()

    private lazy var addViewTimeSwitcher : UISwitch = {
        let label = UISwitch()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var addViewNotifyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Уведомления"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 137/255, green: 131/255, blue: 131/255, alpha: 1)
        return label
    }()

    private lazy var addViewNotifySwitcher : UISwitch = {
        let label = UISwitch()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var backBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Установить", for: .normal)
        btn.backgroundColor = UIColor(red: 242/255, green: 110/255, blue: 17/255, alpha: 1)
        btn.addTarget(self, action: #selector(setup), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = UIColor(red: 31/255, green: 78/255, blue: 199/255, alpha: 1)

        view.addSubview(firstCloudImage)
        view.addSubview(secondCloudImage)
        view.addSubview(additionView)

        additionView.addSubview(addViewTitleLabel)

        additionView.addSubview(addViewTempLabel)
        additionView.addSubview(addViewTempSwitcher)

        additionView.addSubview(addViewSpeedLabel)
        additionView.addSubview(addViewSpeedSwitcher)

        additionView.addSubview(addViewTimeLabel)
        additionView.addSubview(addViewTimeSwitcher)

        additionView.addSubview(addViewNotifyLabel)
        additionView.addSubview(addViewNotifySwitcher)

        additionView.addSubview(backBtn)

        view.addSubview(thirdCloudImage)

        NSLayoutConstraint.activate([

            firstCloudImage.heightAnchor.constraint(equalToConstant: 58),
            firstCloudImage.widthAnchor.constraint(equalToConstant: 246),
            firstCloudImage.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 37),
            firstCloudImage.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 0),

            secondCloudImage.heightAnchor.constraint(equalToConstant: 94),
            secondCloudImage.widthAnchor.constraint(equalToConstant: 182),
            secondCloudImage.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 121),
            secondCloudImage.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: 0),

            additionView.heightAnchor.constraint(equalToConstant: 330),
            additionView.widthAnchor.constraint(equalToConstant: 320),
            additionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            additionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            addViewTitleLabel.topAnchor.constraint(equalTo: additionView.topAnchor, constant: 27),
            addViewTitleLabel.leftAnchor.constraint(equalTo: additionView.leftAnchor, constant: 20),

            addViewTempLabel.topAnchor.constraint(equalTo: addViewTitleLabel.bottomAnchor, constant: 20),
            addViewTempLabel.leftAnchor.constraint(equalTo: additionView.leftAnchor, constant: 20),

            addViewTempSwitcher.centerYAnchor.constraint(equalTo: addViewTempLabel.centerYAnchor),
            addViewTempSwitcher.rightAnchor.constraint(equalTo: additionView.rightAnchor, constant: -37),

            addViewSpeedLabel.topAnchor.constraint(equalTo: addViewTempLabel.bottomAnchor, constant: 30),
            addViewSpeedLabel.leftAnchor.constraint(equalTo: additionView.leftAnchor, constant: 20),

            addViewSpeedSwitcher.centerYAnchor.constraint(equalTo: addViewSpeedLabel.centerYAnchor),
            addViewSpeedSwitcher.rightAnchor.constraint(equalTo: additionView.rightAnchor, constant: -37),

            addViewTimeLabel.topAnchor.constraint(equalTo: addViewSpeedLabel.bottomAnchor, constant: 30),
            addViewTimeLabel.leftAnchor.constraint(equalTo: additionView.leftAnchor, constant: 20),

            addViewTimeSwitcher.centerYAnchor.constraint(equalTo: addViewTimeLabel.centerYAnchor),
            addViewTimeSwitcher.rightAnchor.constraint(equalTo: additionView.rightAnchor, constant: -37),

            addViewNotifyLabel.topAnchor.constraint(equalTo: addViewTimeLabel.bottomAnchor, constant: 30),
            addViewNotifyLabel.leftAnchor.constraint(equalTo: additionView.leftAnchor, constant: 20),

            addViewNotifySwitcher.centerYAnchor.constraint(equalTo: addViewNotifyLabel.centerYAnchor),
            addViewNotifySwitcher.rightAnchor.constraint(equalTo: additionView.rightAnchor, constant: -37),

            backBtn.heightAnchor.constraint(equalToConstant: 40),
            backBtn.widthAnchor.constraint(equalToConstant: 250),
            backBtn.topAnchor.constraint(equalTo: additionView.topAnchor, constant: 274),
            backBtn.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),

            thirdCloudImage.heightAnchor.constraint(equalToConstant: 65),
            thirdCloudImage.widthAnchor.constraint(equalToConstant: 217),
            thirdCloudImage.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 652),
            thirdCloudImage.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),

        ])
    }

    @objc
    func setup(){
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: false)
    }
}
