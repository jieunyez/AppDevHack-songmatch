//
//  ViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

//test

import UIKit
import SwiftUI

// TODO 6: create protocol to update title

class ViewController: UIViewController {

    private var MyLabel = UIImageView()
    private var pushButton = UIButton()
    private var presentButton = UIButton()
    var child = UIHostingController(rootView: ContentView())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(child.view)
        self.addChild(child)
        
        MyLabel.image = UIImage(named: "homeimg")
        MyLabel.contentMode = .scaleAspectFill
        MyLabel.translatesAutoresizingMaskIntoConstraints = false
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
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
//            MyLabel.widthAnchor.constraint(equalToConstant: 400),
            MyLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
//            MyLabel.heightAnchor.constraint(equalToConstant: 100),
            MyLabel.heightAnchor.constraint(equalTo: pushButton.heightAnchor),
            MyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 7),
            MyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
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
        //let vc = PlaylistViewController()
        let vc = CurrentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

struct ContentView: View {
    
    @State var gradient = [Color(red: 0.043, green: 0.467, blue: 0.494), Color(red: 0.039, green: 0.388, blue: 0.502), Color(red: 0.196, green: 0.796, blue: 0.329), Color(red: 0.541, green: 0.733, blue: 0.812), Color(red: 0.196, green: 0.749, blue: 0.486)]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .frame(width: 600, height: 1000)
            .onAppear {
                withAnimation (.easeInOut(duration: 3).repeatForever()){
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
        }
    }
}


