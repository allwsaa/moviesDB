import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - UI Elements
    
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
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moviePoster")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let movieTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("The Green Mile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.black, for: .normal)
        return button
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
        view.addSubview(titleLabel)
        view.addSubview(themeLabel)
        view.addSubview(themeCollectionView)
        view.addSubview(genreLabel)
        view.addSubview(genreCollectionView)
        view.addSubview(moviePosterImageView)
        view.addSubview(movieTitleButton)
        view.addSubview(tabBar)
    }
    

    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.centerX.equalToSuperview()
        }
        
        themeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(16)
        }
        
        themeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(themeLabel.snp.bottom).offset(8)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(40)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(themeCollectionView.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(16)
        }
        
        genreCollectionView.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(8)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(40)
        }
        
        moviePosterImageView.snp.makeConstraints { make in
            make.top.equalTo(genreCollectionView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.75)
            make.height.equalTo(moviePosterImageView.snp.width).multipliedBy(1.3)
        }
        
        movieTitleButton.snp.makeConstraints { make in
            make.top.equalTo(moviePosterImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(tabBar.snp.top).offset(-16)
        }

        tabBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
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
        if collectionView == themeCollectionView {
            cell.configure(with: themes[indexPath.item])
            cell.backgroundColor = .red
        } else {
            cell.configure(with: genres[indexPath.item])
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 25)
    }
}
