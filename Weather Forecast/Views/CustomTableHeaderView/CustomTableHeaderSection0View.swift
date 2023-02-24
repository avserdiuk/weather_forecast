//
//  CustomTableHeaderSection0View.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 23.11.2022.
//

import UIKit

class CustomTableHeaderSection0View : UITableViewHeaderFooterView {

    let view : UIView = {
        let view = UIView(frame: CGRect())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 31/255, green: 78/255, blue: 199/255, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()

    lazy var viewImageBackground : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Group 68")
        return img
    }()

    lazy var sunriseLabel : UILabel = {
        let label = UILabel()
        label.text = "05:41"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    lazy var sunsetLabel : UILabel = {
        let label = UILabel()
        label.text = "19:31"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    lazy var minMaxLabel : UILabel = {
        let label = UILabel()
        label.text = "7°/13°"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    lazy var nowLabel : UILabel = {
        let label = UILabel()
        label.text = "23°"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()

    lazy var nowPredictLabel : UILabel = {
        let label = UILabel()
        label.text = "Возможен небольшой дождь"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    lazy var nowDateLabel : UILabel = {
        let label = UILabel()
        label.text = "17:48, пт 16 апреля"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 246/255, green: 221/255, blue: 1/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    lazy var firstIconImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dally_1")
        return img
    }()

    lazy var firstIconLabel : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    lazy var secondIconImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dally_2")
        return img
    }()

    lazy var secondIconLabel : UILabel = {
        let label = UILabel()
        label.text = "3 м\\c"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    lazy var thirdIconImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dally_3")
        return img
    }()

    lazy var thirdIconLabel : UILabel = {
        let label = UILabel()
        label.text = "75 %"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
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
        view.addSubview(viewImageBackground)
        view.addSubview(sunriseLabel)
        view.addSubview(sunsetLabel)
        view.addSubview(minMaxLabel)
        view.addSubview(nowLabel)
        view.addSubview(nowPredictLabel)

        view.addSubview(firstIconImage)
        view.addSubview(firstIconLabel)
        view.addSubview(secondIconImage)
        view.addSubview(secondIconLabel)
        view.addSubview(thirdIconImage)
        view.addSubview(thirdIconLabel)

        view.addSubview(nowDateLabel)
    }

    func setup(weather : CurrentWeather){
        nowLabel.text = "\(Int(weather.now))°"
        minMaxLabel.text = "\(Int(weather.min))° / \(Int(weather.max))°"
        sunriseLabel.text = "\(unixTimeConvertion(unixTime: weather.sunRise))"
        sunsetLabel.text = "\(unixTimeConvertion(unixTime: weather.sunSet))"
        nowDateLabel.text = "\(getCurrentTime())"
        firstIconLabel.text = "\(weather.clouds) %"
        secondIconLabel.text = "\(Int(weather.wind)) м\\с"
        //thirdIconLabel.text = "\(weather.rain) %"
    }

    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm, E dd MMMM "
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        return dateInFormat
    }

    func unixTimeConvertion(unixTime: Double) -> String {
        let time = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = NSTimeZone(name: timeZoneInfo)
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.system.identifier) as Locale?
        dateFormatter.dateFormat = "hh:mm a"
        let dateAsString = dateFormatter.string(from: time as Date)
        dateFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        return date24
    }

    func addConstraints(){
        NSLayoutConstraint.activate([

            view.heightAnchor.constraint(equalToConstant: 212),
            view.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor, constant: 20),
            view.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: super.rightAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),

            viewImageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            viewImageBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            viewImageBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),

            sunriseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            sunriseLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26),

            sunsetLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -17),
            sunsetLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26),

            minMaxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minMaxLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),

            nowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nowLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),

            nowPredictLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nowPredictLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 103),

            nowDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nowDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 171),

            firstIconImage.widthAnchor.constraint(equalToConstant: 21),
            firstIconImage.heightAnchor.constraint(equalToConstant: 18),
            firstIconImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 77),
            firstIconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),

            firstIconLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            firstIconLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 103),

            secondIconImage.widthAnchor.constraint(equalToConstant: 25),
            secondIconImage.heightAnchor.constraint(equalToConstant: 16),
            secondIconImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 146),
            secondIconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),

            secondIconLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            secondIconLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 177),

            thirdIconImage.widthAnchor.constraint(equalToConstant: 13),
            thirdIconImage.heightAnchor.constraint(equalToConstant: 15),
            thirdIconImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -115),
            thirdIconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),

            thirdIconLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            thirdIconLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75),

        ])
    }
}
