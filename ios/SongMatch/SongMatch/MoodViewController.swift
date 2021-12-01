//
//  MoodViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

//
//  MoodViewController.swift
//  SongMachiOS
//
//  Created by Sun Heitung on 11/20/21.
//

import UIKit

class MoodViewController: UIViewController {

    private var button = UIButton()
    private var MyLabel = UILabel()
    private var happy = UIButton()
    private var sad = UIButton()
    private var love = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Mood"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .left
        MyLabel.textColor = .white
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(.white)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(NextButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        happy.translatesAutoresizingMaskIntoConstraints = false
        happy.setImage(UIImage(named: "Happy"), for: .normal)
        happy.backgroundColor = UIColor(.white)
        happy.layer.cornerRadius = 4
        happy.contentHorizontalAlignment = .fill
        happy.contentVerticalAlignment = .fill
        happy.imageView?.contentMode = .scaleAspectFill
        happy.addTarget(self, action: #selector(HappyPressed), for: .touchUpInside)
        view.addSubview(happy)
        
        sad.translatesAutoresizingMaskIntoConstraints = false
        sad.setImage(UIImage(named: "Sad"), for: .normal)
        sad.backgroundColor = UIColor(.white)
        sad.layer.cornerRadius = 4
        sad.contentHorizontalAlignment = .fill
        sad.contentVerticalAlignment = .fill
        sad.imageView?.contentMode = .scaleAspectFill
        sad.addTarget(self, action: #selector(SadPressed), for: .touchUpInside)
        view.addSubview(sad)
        
        love.translatesAutoresizingMaskIntoConstraints = false
        love.setImage(UIImage(named: "Love"), for: .normal)
        love.backgroundColor = UIColor(.white)
        love.layer.cornerRadius = 4
        love.contentHorizontalAlignment = .fill
        love.contentVerticalAlignment = .fill
        love.imageView?.contentMode = .scaleAspectFill
        love.addTarget(self, action: #selector(LovePressed), for: .touchUpInside)
        view.addSubview(love)

        
        setUpConstraints()
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            MyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            MyLabel.widthAnchor.constraint(equalToConstant: 240),
            MyLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            happy.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            happy.topAnchor.constraint(equalTo: MyLabel.bottomAnchor, constant: 60),
            happy.widthAnchor.constraint(equalToConstant: 150),
            happy.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            sad.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            sad.topAnchor.constraint(equalTo: MyLabel.bottomAnchor, constant: 60),
            sad.widthAnchor.constraint(equalToConstant: 150),
            sad.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            love.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            love.topAnchor.constraint(equalTo: sad.bottomAnchor, constant: 40),
            love.widthAnchor.constraint(equalToConstant: 150),
            love.heightAnchor.constraint(equalToConstant: 150)
        ])

    }
    @objc func NextButtonPressed(){
        let vc = GenreViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func HappyPressed(){
        view.backgroundColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
    }
    
    @objc func SadPressed(){
        view.backgroundColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
    }
    
    @objc func LovePressed(){
        view.backgroundColor = UIColor(red: 246/255, green: 74/255, blue: 138/255, alpha: 1)
    }
}
