//
//  MainViewController.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 23.11.2022.
//

import UIKit

class MainViewController : UIViewController {

    private lazy var tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.register(UITableViewCell.self, forCellReuseIdentifier: "defaultTableCellIdentifier")
        table.register(CustomSectionOneTableViewCell.self, forCellReuseIdentifier: "customSectionOneTableViewCell")
        table.register(CustomSectionTwoTableViewCell.self, forCellReuseIdentifier: "customSectionTwoTableViewCell")
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        self.title = "Unknown, Unknown"

        let leftBarItem = UIBarButtonItem(
            image: UIImage(named: "settings"),
            style: .done,
            target: self,
            action: #selector(showSettings)
        )
        leftBarItem.tintColor = .black
        self.navigationItem.leftBarButtonItems = [leftBarItem]

        let rightBarItem = UIBarButtonItem(
            image: UIImage(named: "geo"),
            style: .done,
            target: self,
            action: #selector(showGeo))
        rightBarItem.tintColor = .black
        self.navigationItem.rightBarButtonItems = [rightBarItem]

        view.backgroundColor = .white

        view.addSubview(tableView)



        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

        ])



    }

    @objc
    func showSettings(){
        self.navigationController?.pushViewController(SettingsViewComtroller(), animated: false)
    }

    @objc
    func showGeo(){
        print("showGeo")
    }
}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Подробнее на 24 часа"
        } else {
            return "Ежедневный прогноз"
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0  {
            return CustomTableHeaderView()
        }
        return nil
    }
}

extension MainViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 1
        } else {
            return 7
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customSectionOneTableViewCell", for: indexPath)
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "customSectionTwoTableViewCell", for: indexPath)
        return cell

    }
}
