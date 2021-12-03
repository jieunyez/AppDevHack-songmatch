//
//  SongTableViewCell.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import UIKit

class SongTableViewCell:UITableViewCell {
    
    var nameLabel = UILabel()
    var artistLabel = UILabel()
    var albumLabel = UILabel()
    var coverImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black

        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        artistLabel.font = .systemFont(ofSize: 12)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.textColor = .white
        contentView.addSubview(artistLabel)
        
        albumLabel.font = .systemFont(ofSize: 12)
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.textColor = .white
        contentView.addSubview(albumLabel)

        coverImage.contentMode = .scaleAspectFit
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImage)

        setupConstraints()
    }
    
    func configure(song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artist
        albumLabel.text = song.album
        coverImage.image = UIImage(named: song.cover)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let padding: CGFloat = 8
        let labelHeight: CGFloat = 20
        
        NSLayoutConstraint.activate([
            coverImage.heightAnchor.constraint(equalToConstant: 75),
            coverImage.widthAnchor.constraint(equalToConstant: 75),
            coverImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding + 10),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.leadingAnchor),
            albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor),
            albumLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
    }
}
