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
    private var energy = UIButton()
    private var sad = UIButton()
    private var calm = UIButton()
    private var energylabel = UILabel()
    private var sadlabel = UILabel()
    private var calmlabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Mood"
        MyLabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        MyLabel.textAlignment = .center
        MyLabel.textColor = .white
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(.white)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(NextButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        energy.translatesAutoresizingMaskIntoConstraints = false
        energy.setImage(UIImage(named: "Energy"), for: .normal)
        energy.backgroundColor = UIColor(.white)
        energy.layer.cornerRadius = 8
//        energy.contentHorizontalAlignment = .fill
//        energy.contentVerticalAlignment = .fill
        energy.imageView?.contentMode = .scaleAspectFill
        energy.imageEdgeInsets = UIEdgeInsets(top: 12, left: 10, bottom: 10, right: 10)
        energy.addTarget(self, action: #selector(energyPressed), for: .touchUpInside)
        view.addSubview(energy)
        
        sad.translatesAutoresizingMaskIntoConstraints = false
        sad.setImage(UIImage(named: "Sad"), for: .normal)
        sad.backgroundColor = UIColor(.white)
        sad.layer.cornerRadius = 8
        sad.contentHorizontalAlignment = .fill
        sad.contentVerticalAlignment = .fill
        sad.imageView?.contentMode = .scaleAspectFill
        sad.addTarget(self, action: #selector(SadPressed), for: .touchUpInside)
        view.addSubview(sad)
        
        calm.translatesAutoresizingMaskIntoConstraints = false
        calm.setImage(UIImage(named: "Calm"), for: .normal)
        calm.backgroundColor = UIColor(.white)
        calm.layer.cornerRadius = 8
        calm.contentHorizontalAlignment = .fill
        calm.contentVerticalAlignment = .fill
        calm.imageView?.contentMode = .scaleAspectFill
        calm.addTarget(self, action: #selector(calmPressed), for: .touchUpInside)
        view.addSubview(calm)
        
        energylabel.translatesAutoresizingMaskIntoConstraints = false
        energylabel.text = "Energetic"
        energylabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        energylabel.textAlignment = .center
        energylabel.textColor = .white
        energylabel.isHidden = true
        view.addSubview(energylabel)
        
        sadlabel.translatesAutoresizingMaskIntoConstraints = false
        sadlabel.text = "Sad"
        sadlabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        sadlabel.textAlignment = .center
        sadlabel.textColor = .white
        sadlabel.isHidden = true
        view.addSubview(sadlabel)
        
        calmlabel.translatesAutoresizingMaskIntoConstraints = false
        calmlabel.text = "Calm"
        calmlabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        calmlabel.textAlignment = .center
        calmlabel.textColor = .white
        calmlabel.isHidden = true
        view.addSubview(calmlabel)
        
        setUpConstraints()
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            MyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MyLabel.widthAnchor.constraint(equalToConstant: 240),
            MyLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            energylabel.topAnchor.constraint(equalTo: MyLabel.topAnchor),
            energylabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            energylabel.widthAnchor.constraint(equalToConstant: 240),
            energylabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            sadlabel.topAnchor.constraint(equalTo: MyLabel.topAnchor),
            sadlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sadlabel.widthAnchor.constraint(equalToConstant: 240),
            sadlabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            calmlabel.topAnchor.constraint(equalTo: MyLabel.topAnchor),
            calmlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calmlabel.widthAnchor.constraint(equalToConstant: 240),
            calmlabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            energy.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            energy.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            energy.widthAnchor.constraint(equalToConstant: 160),
            energy.heightAnchor.constraint(equalToConstant: 160)
        ])
        NSLayoutConstraint.activate([
            sad.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            sad.topAnchor.constraint(equalTo: energy.topAnchor),
            sad.widthAnchor.constraint(equalToConstant: 160),
            sad.heightAnchor.constraint(equalToConstant: 160)
        ])
        NSLayoutConstraint.activate([
            calm.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            calm.topAnchor.constraint(equalTo: sad.bottomAnchor, constant: 30),
            calm.widthAnchor.constraint(equalToConstant: 160),
            calm.heightAnchor.constraint(equalToConstant: 160)
        ])
        

    }
    @objc func NextButtonPressed(){
        let vc = GenreViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func energyPressed(){
        view.backgroundColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
        energylabel.isHidden = false
        MyLabel.isHidden = true
        sadlabel.isHidden = true
        calmlabel.isHidden = true
        
    }
    
    @objc func SadPressed(){
        view.backgroundColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
        energylabel.isHidden = true
        MyLabel.isHidden = true
        sadlabel.isHidden = false
        calmlabel.isHidden = true
    }
    
    @objc func calmPressed(){
        view.backgroundColor = UIColor(red: 168/255, green: 204/255, blue: 192/255, alpha: 1)
        energylabel.isHidden = true
        MyLabel.isHidden = true
        sadlabel.isHidden = true
        calmlabel.isHidden = false
    }
}
