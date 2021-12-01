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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Genre"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .left
        MyLabel.textColor = .black
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.black)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(OKButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
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
    }
    @objc func OKButtonPressed(){
        let vc = PlaylistViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
