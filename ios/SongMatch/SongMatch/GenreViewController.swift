//
//  GenreViewController.swift
//  SongMatch
//
//

import UIKit
import SwiftUI

class GenreViewController: UIViewController {

    private var button = UIButton()
    private var MyLabel = UILabel()
    private var pop = UIButton()
    private var hiphop = UIButton()
    private var indie = UIButton()
    private var rock = UIButton()
    private var selectedGenre = ""
    private var selectedMood = ""
    var bubblehc = UIHostingController(rootView: BubbleView())
    var child = UIHostingController(rootView: GenreView())
    var rockhc = UIHostingController(rootView: RockView())
    var indiehc = UIHostingController(rootView: IndieView())
    var hiphc = UIHostingController(rootView: HipView())
    
    weak var delegate: UpdateMoodGenreDelegate?
    
    //weak var delegate: GetSortedSongsDelegate?

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(child.view)
        self.addChild(child)
        
        bubblehc.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bubblehc.view)
        self.addChild(bubblehc)
        bubblehc.view.isHidden = true
        
        rockhc.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rockhc.view)
        self.addChild(rockhc)
        rockhc.view.isHidden = true
        
        indiehc.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(indiehc.view)
        self.addChild(indiehc)
        indiehc.view.isHidden = true
        
        hiphc.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hiphc.view)
        self.addChild(hiphc)
        hiphc.view.isHidden = true
        
        MyLabel = UILabel()
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
        MyLabel.text = "Genre"
        MyLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        MyLabel.textAlignment = .center
        MyLabel.textColor = .white
        view.addSubview(MyLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(.white)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(OKButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        pop.translatesAutoresizingMaskIntoConstraints = false
        pop.setImage(UIImage(named: "Pop-1"), for: .normal)
        pop.backgroundColor = UIColor(.white)
        pop.layer.cornerRadius = 8
        pop.contentHorizontalAlignment = .fill
        pop.contentVerticalAlignment = .fill
        pop.imageView?.contentMode = .scaleAspectFill
        pop.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        pop.addTarget(self, action: #selector(popPressed), for: .touchUpInside)
        view.addSubview(pop)
        
        hiphop.translatesAutoresizingMaskIntoConstraints = false
        hiphop.setImage(UIImage(named: "HipHop-1"), for: .normal)
        hiphop.backgroundColor = UIColor(.white)
        hiphop.layer.cornerRadius = 8
        hiphop.contentHorizontalAlignment = .fill
        hiphop.contentVerticalAlignment = .fill
        hiphop.imageView?.contentMode = .scaleAspectFill
        hiphop.addTarget(self, action: #selector(hiphopPressed), for: .touchUpInside)
        hiphop.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.addSubview(hiphop)
        
        indie.translatesAutoresizingMaskIntoConstraints = false
        indie.setImage(UIImage(named: "Indie-1"), for: .normal)
        indie.backgroundColor = UIColor(.white)
        indie.layer.cornerRadius = 8
        indie.contentHorizontalAlignment = .fill
        indie.contentVerticalAlignment = .fill
        indie.imageView?.contentMode = .scaleAspectFill
        indie.addTarget(self, action: #selector(indiePressed), for: .touchUpInside)
        indie.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.addSubview(indie)
        
        rock.translatesAutoresizingMaskIntoConstraints = false
        rock.setImage(UIImage(named: "Rock-1"), for: .normal)
        rock.backgroundColor = UIColor(.white)
        rock.layer.cornerRadius = 8
        rock.contentHorizontalAlignment = .fill
        rock.contentVerticalAlignment = .fill
        rock.imageView?.contentMode = .scaleAspectFill
        rock.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        rock.addTarget(self, action: #selector(rockPressed), for: .touchUpInside)
        view.addSubview(rock)
        
        setUpConstraints()
    }
    
    func ViewDidAppear() {
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            bubblehc.view.topAnchor.constraint(equalTo: view.topAnchor),
            bubblehc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bubblehc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bubblehc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            rockhc.view.topAnchor.constraint(equalTo: view.topAnchor),
            rockhc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rockhc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rockhc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            indiehc.view.topAnchor.constraint(equalTo: view.topAnchor),
            indiehc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            indiehc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            indiehc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            hiphc.view.topAnchor.constraint(equalTo: view.topAnchor),
            hiphc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hiphc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hiphc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            MyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MyLabel.widthAnchor.constraint(equalToConstant: 240),
            MyLabel.heightAnchor.constraint(equalToConstant: 60)
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
            pop.widthAnchor.constraint(equalToConstant: 130),
            pop.heightAnchor.constraint(equalToConstant: 130)

        ])
        NSLayoutConstraint.activate([
            hiphop.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            hiphop.topAnchor.constraint(equalTo: MyLabel.bottomAnchor, constant: 60),
            hiphop.widthAnchor.constraint(equalToConstant: 130),
            hiphop.heightAnchor.constraint(equalToConstant: 130)

        ])
        NSLayoutConstraint.activate([
            indie.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            indie.topAnchor.constraint(equalTo: hiphop.bottomAnchor, constant: 40),
            indie.widthAnchor.constraint(equalToConstant: 130),
            indie.heightAnchor.constraint(equalToConstant: 130)

        ])
        NSLayoutConstraint.activate([
            rock.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            rock.topAnchor.constraint(equalTo: hiphop.bottomAnchor, constant: 40),
            rock.widthAnchor.constraint(equalToConstant: 130),
            rock.heightAnchor.constraint(equalToConstant: 130)

        ])

    }
    
    
    @objc func OKButtonPressed(){
        let vc = SampleViewController()
        delegate?.updateMoodGenre(newMood: selectedMood, newGenre: selectedGenre)
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func popPressed(){

//        pop.backgroundColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
//        hiphop.backgroundColor = .white
//        indie.backgroundColor = .white
//        rock.backgroundColor = .white
        child.view.isHidden = true
        hiphc.view.isHidden = true
        indiehc.view.isHidden = true
        rockhc.view.isHidden = true
        bubblehc.view.isHidden = false
        MyLabel.text = "Pop"
        MyLabel.textColor = .white
        selectedGenre = "pop"

        
    }
    
    @objc func hiphopPressed(){
//        hiphop.backgroundColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
//        pop.backgroundColor = .white
//        indie.backgroundColor = .white
//        rock.backgroundColor = .white
        child.view.isHidden = true
        hiphc.view.isHidden = false
        indiehc.view.isHidden = true
        rockhc.view.isHidden = true
        bubblehc.view.isHidden = true
        MyLabel.text = "Hip Hop"

        MyLabel.textColor = .white
        selectedGenre = "hiphop"

    }
    
    @objc func indiePressed(){
//        indie.backgroundColor = UIColor(red: 168/255, green: 204/255, blue: 192/255, alpha: 1)
//        hiphop.backgroundColor = .white
//        pop.backgroundColor = .white
//        rock.backgroundColor = .white
        child.view.isHidden = true
        hiphc.view.isHidden = true
        indiehc.view.isHidden = false
        rockhc.view.isHidden = true
        bubblehc.view.isHidden = true
        MyLabel.text = "Indie"

        MyLabel.textColor = .white
        selectedGenre = "indie"

    }
    @objc func rockPressed(){
//        rock.backgroundColor = UIColor(red: 147/255, green: 108/255, blue: 183/255, alpha: 1)
//        hiphop.backgroundColor = .white
//        indie.backgroundColor = .white
//        pop.backgroundColor = .white
        child.view.isHidden = true
        hiphc.view.isHidden = true
        indiehc.view.isHidden = true
        rockhc.view.isHidden = false
        bubblehc.view.isHidden = true
        MyLabel.text = "Rock"

        MyLabel.textColor = .white
        selectedGenre = "rock"

    }
}

protocol UpdateMoodDelegate: class {
    func updateMood(newMood: String)
}

extension GenreViewController: UpdateMoodDelegate {
    func updateMood(newMood: String) {
        self.selectedMood = newMood
    }
}
