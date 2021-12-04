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
import SwiftUI

class MoodViewController: UIViewController, UpdateMoodGenreDelegate {
    func updateMoodGenre(newMood: String, newGenre: String) {
        selectedMood = newMood
        selectedGenre = newGenre
    }
    
    let buttonSize = UIScreen.main.bounds.width/2.5
    
    private var button = UIButton()
    private var MyLabel = UILabel()
    private var energy = UIButton()
    private var sad = UIButton()
    private var calm = UIButton()
    private var happy = UIButton()
    private var energylabel = UILabel()
    private var sadlabel = UILabel()
    private var calmlabel = UILabel()
    private var happylabel = UILabel()
    
    var child = UIHostingController(rootView: WaveView(col: Color.blue.opacity(0.3)))
    

    private var selectedMood = String()
    private var selectedGenre = String()
    
    
    weak var delegate: UpdateMoodDelegate?
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(child.view)
        //self.addChild(child)
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Mood"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .center
        MyLabel.textColor = .black
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.black)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(NextButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        energy.translatesAutoresizingMaskIntoConstraints = false
        energy.setImage(UIImage(named: "Energy"), for: .normal)
        energy.backgroundColor = UIColor(.white)
        energy.layer.cornerRadius = 8
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
        
        happy.translatesAutoresizingMaskIntoConstraints = false
        happy.setImage(UIImage(named: "Happy"), for: .normal)
        happy.backgroundColor = UIColor(.white)
        happy.layer.cornerRadius = 8
        happy.contentHorizontalAlignment = .fill
        happy.contentVerticalAlignment = .fill
        happy.imageView?.contentMode = .scaleAspectFill
        happy.addTarget(self, action: #selector(happyPressed), for: .touchUpInside)
        view.addSubview(happy)
        
        energylabel.translatesAutoresizingMaskIntoConstraints = false
        energylabel.text = "Energetic"
        energylabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        energylabel.textAlignment = .center
        energylabel.textColor = .black
        energylabel.isHidden = true
        view.addSubview(energylabel)
        
        sadlabel.translatesAutoresizingMaskIntoConstraints = false
        sadlabel.text = "Sad"
        sadlabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        sadlabel.textAlignment = .center
        sadlabel.textColor = .black
        sadlabel.isHidden = true
        view.addSubview(sadlabel)
        
        calmlabel.translatesAutoresizingMaskIntoConstraints = false
        calmlabel.text = "Calm"
        calmlabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        calmlabel.textAlignment = .center
        calmlabel.textColor = .black
        calmlabel.isHidden = true
        view.addSubview(calmlabel)
        
        happylabel.translatesAutoresizingMaskIntoConstraints = false
        happylabel.text = "Happy"
        happylabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        happylabel.textAlignment = .center
        happylabel.textColor = .black
        happylabel.isHidden = true
        view.addSubview(happylabel)
        
        setUpConstraints()
    }
    
    func viewDidAppear() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(child.view)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.black)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(NextButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        energy.translatesAutoresizingMaskIntoConstraints = false
        energy.setImage(UIImage(named: "Energy"), for: .normal)
        energy.backgroundColor = UIColor(.white)
        energy.layer.cornerRadius = 8
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
        
        happy.translatesAutoresizingMaskIntoConstraints = false
        happy.setImage(UIImage(named: "Happy"), for: .normal)
        happy.backgroundColor = UIColor(.white)
        happy.layer.cornerRadius = 8
        happy.contentHorizontalAlignment = .fill
        happy.contentVerticalAlignment = .fill
        happy.imageView?.contentMode = .scaleAspectFill
        happy.addTarget(self, action: #selector(happyPressed), for: .touchUpInside)
        view.addSubview(happy)
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            MyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MyLabel.widthAnchor.constraint(equalToConstant: 240),
            MyLabel.heightAnchor.constraint(equalToConstant: 60)
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
            happylabel.topAnchor.constraint(equalTo: MyLabel.topAnchor),
            happylabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            happylabel.widthAnchor.constraint(equalToConstant: 240),
            happylabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            energy.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            energy.topAnchor.constraint(equalTo: energylabel.bottomAnchor, constant: 20),
            energy.widthAnchor.constraint(equalToConstant: buttonSize),
            energy.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
        NSLayoutConstraint.activate([
            sad.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            sad.topAnchor.constraint(equalTo: energy.topAnchor),
            sad.widthAnchor.constraint(equalToConstant: buttonSize),
            sad.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
        NSLayoutConstraint.activate([
            calm.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 28),
            calm.topAnchor.constraint(equalTo: sad.bottomAnchor, constant: 25),
            calm.widthAnchor.constraint(equalToConstant: buttonSize),
            calm.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
        NSLayoutConstraint.activate([
            happy.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -28),
            happy.topAnchor.constraint(equalTo: sad.bottomAnchor, constant: 25),
            happy.widthAnchor.constraint(equalToConstant: buttonSize),
            happy.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
        

    }
    @objc func NextButtonPressed(){
        let vc = GenreViewController(delegate: self, selectedMood: selectedMood)
        //delegate?.updateMood(newMood: self.selectedMood)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func energyPressed(){
//        view.backgroundColor = UIColor(red: 239/255, green: 114/255, blue: 21/255, alpha: 1)
        //col = Color(red: 239/255, green: 114/255, blue: 21/255).opacity(0.3)
        child = UIHostingController(rootView: WaveView(col: Color(red: 239/255, green: 114/255, blue: 21/255).opacity(0.4)))
        viewDidAppear()
        //view.addSubview(child.view)
        energylabel.isHidden = false
        MyLabel.isHidden = true
        sadlabel.isHidden = true
        calmlabel.isHidden = true

        happylabel.isHidden = true

        selectedMood = "energy"
        

    }
    
    @objc func SadPressed(){
        //view.backgroundColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
        child = UIHostingController(rootView: WaveView(col: Color(red: 72/255, green: 138/255, blue: 199/255).opacity(0.4)))
        viewDidAppear()
        energylabel.isHidden = true
        MyLabel.isHidden = true
        sadlabel.isHidden = false
        calmlabel.isHidden = true

        happylabel.isHidden = true

        selectedMood = "sad"

    }
    
    @objc func calmPressed(){
        child = UIHostingController(rootView: WaveView(col: Color(red: 168/255, green: 204/255, blue: 192/255).opacity(0.4)))
        viewDidAppear()
        //view.backgroundColor = UIColor(red: 168/255, green: 204/255, blue: 192/255, alpha: 1)
        energylabel.isHidden = true
        MyLabel.isHidden = true
        sadlabel.isHidden = true
        calmlabel.isHidden = false
        happylabel.isHidden = true
        
        selectedMood = "calm"
    }
    @objc func happyPressed(){
        //view.backgroundColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
        child = UIHostingController(rootView: WaveView(col: Color(red: 253/255, green: 208/255, blue: 23/255).opacity(0.3)))
        viewDidAppear()
        energylabel.isHidden = true
        MyLabel.isHidden = true
        sadlabel.isHidden = true
        calmlabel.isHidden = true
        happylabel.isHidden = false

        selectedMood = "happy"

    }
}

