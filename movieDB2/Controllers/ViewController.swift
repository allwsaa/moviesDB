//
//  ViewController.swift
//  movieDB2
//
//  Created by ntvlbl on 31.10.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MovieDB"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        return label
    }()
    
    private let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Theme"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let themeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let moviePosterImageView = UIImageView(image: UIImage(named: "moviePoster"))
    private let movieTitleButton = UIButton(type: .system)
    
    private let nightclubPosterImageView = UIImageView(image: UIImage(named: "fightClubPoster"))
    private let nightclubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fight Club"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        let homeItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let favoritesItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 1)
        let watchListItem = UITabBarItem(title: "Watch list", image: UIImage(systemName: "eye"), tag: 2)
        let findItem = UITabBarItem(title: "Find", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 4)
        tabBar.items = [homeItem, favoritesItem, watchListItem, findItem, profileItem]
        tabBar.selectedItem = homeItem
        return tabBar
    }()
    
    private let themes = ["Popular", "Now Playing", "Upcoming", "Top Rated"]
    private let genres = ["Action", "Adventure", "Comedy", "Drama"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureCollectionView()
        
        movieTitleButton.addTarget(self, action: #selector(movieTitleTapped), for: .touchUpInside)
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(themeLabel)
        contentView.addSubview(themeCollectionView)
        contentView.addSubview(genreLabel)
        contentView.addSubview(genreCollectionView)
        
        moviePosterImageView.contentMode = .scaleAspectFill
        moviePosterImageView.layer.cornerRadius = 10
        moviePosterImageView.layer.masksToBounds = true
        contentView.addSubview(moviePosterImageView)
        
        movieTitleButton.setTitle("The Green Mile", for: .normal)
        movieTitleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        movieTitleButton.setTitleColor(.black, for: .normal)
        contentView.addSubview(movieTitleButton)
        
        nightclubPosterImageView.contentMode = .scaleAspectFill
        nightclubPosterImageView.layer.cornerRadius = 10
        nightclubPosterImageView.layer.masksToBounds = true
        contentView.addSubview(nightclubPosterImageView)
        
        contentView.addSubview(nightclubTitleLabel)
        contentView.addSubview(tabBar)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10) 
            make.centerX.equalToSuperview()
        }
        
        themeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(16)
        }
        
        themeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(themeLabel.snp.bottom).offset(3)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(40)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(themeCollectionView.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(16)
        }
        
        genreCollectionView.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(3)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(40)
        }
        
        moviePosterImageView.snp.makeConstraints { make in
            make.top.equalTo(genreCollectionView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(contentView.snp.width).multipliedBy(0.75)
            make.height.equalTo(moviePosterImageView.snp.width).multipliedBy(1.3)
        }
        
        movieTitleButton.snp.makeConstraints { make in
            make.top.equalTo(moviePosterImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        nightclubPosterImageView.snp.makeConstraints { make in
            make.top.equalTo(movieTitleButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(contentView.snp.width).multipliedBy(0.75)
            make.height.equalTo(nightclubPosterImageView.snp.width).multipliedBy(1.3)
        }
        
        nightclubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nightclubPosterImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        tabBar.snp.makeConstraints { make in
            make.top.equalTo(nightclubTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView)
            make.height.equalTo(50)
        }
    }

    private func configureCollectionView() {
        themeCollectionView.dataSource = self
        themeCollectionView.delegate = self
        themeCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "themeCell")
        
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        genreCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "genreCell")
    }

    @objc private func movieTitleTapped() {
        let detailVC = MovieDetailsViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == themeCollectionView ? themes.count : genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionView == themeCollectionView ? "themeCell" : "genreCell", for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: collectionView == themeCollectionView ? themes[indexPath.item] : genres[indexPath.item])
        cell.backgroundColor = collectionView == themeCollectionView ? .red : .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 25)
    }
}
