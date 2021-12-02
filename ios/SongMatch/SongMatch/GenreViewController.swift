//
//  GenreViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import UIKit

class GenreViewController: UIViewController {

    private var button = UIButton()
    private var MyLabel = UILabel()
    private var pop = UIButton()
    private var hiphop = UIButton()
    private var indie = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Genre"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .left
        MyLabel.textColor = .white
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.black)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(OKButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        pop.translatesAutoresizingMaskIntoConstraints = false
        pop.setImage(UIImage(named: "pop"), for: .normal)
        pop.backgroundColor = UIColor(.white)
        pop.layer.cornerRadius = 4
        pop.contentHorizontalAlignment = .fill
        pop.contentVerticalAlignment = .fill
        pop.imageView?.contentMode = .scaleAspectFill
        view.addSubview(pop)
        
        hiphop.translatesAutoresizingMaskIntoConstraints = false
        hiphop.setImage(UIImage(named: "hiphop"), for: .normal)
        hiphop.backgroundColor = UIColor(.white)
        hiphop.layer.cornerRadius = 4
        hiphop.contentHorizontalAlignment = .fill
        hiphop.contentVerticalAlignment = .fill
        hiphop.imageView?.contentMode = .scaleAspectFill
        view.addSubview(hiphop)
        
        indie.translatesAutoresizingMaskIntoConstraints = false
        indie.setImage(UIImage(named: "Indie"), for: .normal)
        indie.backgroundColor = UIColor(.white)
        indie.layer.cornerRadius = 4
        indie.contentHorizontalAlignment = .fill
        indie.contentVerticalAlignment = .fill
        indie.imageView?.contentMode = .scaleAspectFill
        view.addSubview(indie)
        
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
            pop.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            pop.topAnchor.constraint(equalTo: MyLabel.bottomAnchor, constant: 60),
            pop.widthAnchor.constraint(equalToConstant: 150),
            pop.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            hiphop.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            hiphop.topAnchor.constraint(equalTo: MyLabel.bottomAnchor, constant: 60),
            hiphop.widthAnchor.constraint(equalToConstant: 150),
            hiphop.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            indie.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            indie.topAnchor.constraint(equalTo: hiphop.bottomAnchor, constant: 40),
            indie.widthAnchor.constraint(equalToConstant: 150),
            indie.heightAnchor.constraint(equalToConstant: 150)
        ])

    }
    @objc func OKButtonPressed(){
        let vc = PlaylistViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
