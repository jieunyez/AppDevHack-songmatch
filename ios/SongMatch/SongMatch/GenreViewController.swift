//
//  GenreViewController.swift
//  SongMatch
//
//

import UIKit

class GenreViewController: UIViewController {

    private var button = UIButton()
    private var MyLabel = UILabel()
    private var pop = UIButton()
    private var hiphop = UIButton()
    private var indie = UIButton()
    private var rock = UIButton()

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
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(.white)
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
        pop.addTarget(self, action: #selector(popPressed), for: .touchUpInside)
        view.addSubview(pop)
        
        hiphop.translatesAutoresizingMaskIntoConstraints = false
        hiphop.setImage(UIImage(named: "hiphop"), for: .normal)
        hiphop.backgroundColor = UIColor(.white)
        hiphop.layer.cornerRadius = 4
        hiphop.contentHorizontalAlignment = .fill
        hiphop.contentVerticalAlignment = .fill
        hiphop.imageView?.contentMode = .scaleAspectFill
        hiphop.addTarget(self, action: #selector(hiphopPressed), for: .touchUpInside)
        view.addSubview(hiphop)
        
        indie.translatesAutoresizingMaskIntoConstraints = false
        indie.setImage(UIImage(named: "Indie"), for: .normal)
        indie.backgroundColor = UIColor(.white)
        indie.layer.cornerRadius = 4
        indie.contentHorizontalAlignment = .fill
        indie.contentVerticalAlignment = .fill
        indie.imageView?.contentMode = .scaleAspectFill
        indie.addTarget(self, action: #selector(indiePressed), for: .touchUpInside)
        view.addSubview(indie)
        
        rock.translatesAutoresizingMaskIntoConstraints = false
        rock.setImage(UIImage(named: "Rock"), for: .normal)
        rock.backgroundColor = UIColor(.white)
        rock.layer.cornerRadius = 4
        rock.contentHorizontalAlignment = .fill
        rock.contentVerticalAlignment = .fill
        rock.imageView?.contentMode = .scaleAspectFill
        rock.addTarget(self, action: #selector(rockPressed), for: .touchUpInside)
        view.addSubview(rock)
        
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
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func popPressed(){
        pop.backgroundColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
        hiphop.backgroundColor = .white
        indie.backgroundColor = .white
        rock.backgroundColor = .white
        MyLabel.text = "POP"
        MyLabel.textColor = UIColor(red: 253/255, green: 208/255, blue: 23/255, alpha: 1)
        
    }
    
    @objc func hiphopPressed(){
        hiphop.backgroundColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
        pop.backgroundColor = .white
        indie.backgroundColor = .white
        rock.backgroundColor = .white
        MyLabel.text = "Hip Hop"
        MyLabel.textColor = UIColor(red: 72/255, green: 138/255, blue: 199/255, alpha: 1)
    }
    
    @objc func indiePressed(){
        indie.backgroundColor = UIColor(red: 168/255, green: 204/255, blue: 192/255, alpha: 1)
        hiphop.backgroundColor = .white
        pop.backgroundColor = .white
        rock.backgroundColor = .white
        MyLabel.text = "Indie"
        MyLabel.textColor = UIColor(red: 168/255, green: 204/255, blue: 192/255, alpha: 1)
    }
    @objc func rockPressed(){
        rock.backgroundColor = UIColor(red: 147/255, green: 108/255, blue: 183/255, alpha: 1)
        hiphop.backgroundColor = .white
        indie.backgroundColor = .white
        pop.backgroundColor = .white
        MyLabel.text = "Rock"
        MyLabel.textColor = UIColor(red: 147/255, green: 108/255, blue: 183/255, alpha: 1)
    }
}
