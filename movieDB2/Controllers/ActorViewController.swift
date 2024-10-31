//
//  ActorViewController.swift
//  movieDB2
//
//  Created by ntvlbl on 31.10.2024.
//
import UIKit
import SnapKit

class ActorViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tomHanks")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tom Hanks"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()

    private let birthInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Born July 9, 1956"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let bioTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    private let bioTextLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Thomas Jeffrey Hanks was born in Concord, California, to Janet Marylyn (Frager), a hospital worker, and Amos Mefford Hanks, an itinerant cook. His mother's family, originally surnamed "Fraga", was entirely Portuguese, while his father was of mostly English ancestry. Tom grew up in what he has called a "fractured" family. He moved around a great deal after his parents' divorce, living with a succession of step-families. No problems, no alcoholism - just a confused childhood. He has no acting experience in college and credits the fact that he could not get cast in a college play with actually starting his career. He went downtown, and auditioned for a community theater play, was invited by the director of that play to go to Cleveland, and there his acting career started.
        """
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let photoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()


    private let photo1 = UIButton()
    private let photo2 = UIButton()
    private let photo3 = UIButton()
    private let morePhotos = UIButton()

    private let movie1 = UIButton()
    private let movie2 = UIButton()
    private let movie3 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(actorImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(birthInfoLabel)
        contentView.addSubview(bioTitleLabel)
        contentView.addSubview(bioTextLabel)
        contentView.addSubview(photoTitleLabel)
        contentView.addSubview(movieTitleLabel)
        
        configureImageButton(photo1, withImageName: "photo1")
        configureImageButton(photo2, withImageName: "photo2")
        configureImageButton(photo3, withImageName: "tomHanks")
        configureImageButton(morePhotos, withImageName: "plusIcon")

        contentView.addSubview(photo1)
        contentView.addSubview(photo2)
        contentView.addSubview(photo3)
        contentView.addSubview(morePhotos)

        configureImageButton(movie1, withImageName: "moviePoster")
        configureImageButton(movie2, withImageName: "moviePoster")
        configureImageButton(movie3, withImageName: "moviePoster")

        contentView.addSubview(movie1)
        contentView.addSubview(movie2)
        contentView.addSubview(movie3)
    }

    private func configureImageButton(_ button: UIButton, withImageName imageName: String) {
        if let image = UIImage(named: imageName) {
            button.setImage(image, for: .normal)
        } else {
            button.backgroundColor = .gray // fallback color if image doesn't load
        }
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }

        actorImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(250)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(actorImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        birthInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        bioTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(birthInfoLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(16)
        }

        bioTextLabel.snp.makeConstraints { make in
            make.top.equalTo(bioTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(contentView).inset(16)
        }

        photoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bioTextLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(16)
        }

        photo1.snp.makeConstraints { make in
            make.top.equalTo(photoTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(16)
            make.width.height.equalTo(80)
        }

        photo2.snp.makeConstraints { make in
            make.top.equalTo(photoTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(photo1.snp.trailing).offset(16)
            make.width.height.equalTo(80)
        }

        photo3.snp.makeConstraints { make in
            make.top.equalTo(photoTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(photo2.snp.trailing).offset(16)
            make.width.height.equalTo(80)
        }

        morePhotos.snp.makeConstraints { make in
            make.top.equalTo(photoTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(photo3.snp.trailing).offset(16)
            make.width.height.equalTo(80)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(photo1.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(16)
        }

        movie1.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(16)
            make.width.height.equalTo(80)
        }

        movie2.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(movie1.snp.trailing).offset(16)
            make.width.height.equalTo(80)
        }

        movie3.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(movie2.snp.trailing).offset(16)
            make.width.height.equalTo(80)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
}
