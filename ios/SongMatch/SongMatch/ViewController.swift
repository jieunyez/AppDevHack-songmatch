//
//  ViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

//test

import UIKit

// TODO 6: create protocol to update title

class ViewController: UIViewController {

    private var MyLabel = UILabel()
    private var pushButton = UIButton()
    private var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "SongMatch"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .left
        MyLabel.textColor = .white
        view.addSubview(MyLabel)
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Generate your songs!", for: .normal)
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.backgroundColor = UIColor(.white)
        pushButton.layer.cornerRadius = 4
        pushButton.addTarget(self, action: #selector(generateButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)

        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Your current song list", for: .normal)
        presentButton.setTitleColor(.black, for: .normal)
        presentButton.backgroundColor = UIColor(.white)
        presentButton.layer.cornerRadius = 4
        presentButton.addTarget(self, action: #selector(listButtonPressed), for: .touchUpInside)
        view.addSubview(presentButton)

        setUpViews()
    }

    func setUpViews() {
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            MyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            MyLabel.widthAnchor.constraint(equalToConstant: 240),
            MyLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.topAnchor.constraint(equalTo:MyLabel.bottomAnchor, constant: 20),
            pushButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            pushButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 12),
            presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc func generateButtonPressed() {
        // TODO 3: create VC to push
        let vc = MoodViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func listButtonPressed() {
        // TODO 4: create VC to present
        // TODO 9: update delegate
        let vc = PlaylistViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
