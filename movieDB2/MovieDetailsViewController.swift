import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moviePoster") 
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Green Mile"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()

    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Release date: 1999"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "8.6/10 984K"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()

    private let genresStackView: UIStackView = {
        let genre1 = UIButton(type: .system)
        genre1.setTitle("Drama", for: .normal)
        genre1.backgroundColor = .systemBlue
        genre1.tintColor = .white
        genre1.layer.cornerRadius = 10

        let genre2 = UIButton(type: .system)
        genre2.setTitle("Crime", for: .normal)
        genre2.backgroundColor = .systemBlue
        genre2.tintColor = .white
        genre2.layer.cornerRadius = 10

        // Set fixed sizes for Drama and Crime buttons
        genre1.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
        
        genre2.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(25)
        }

        let stackView = UIStackView(arrangedSubviews: [genre1, genre2])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private let overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private let overviewTextLabel: UILabel = {
        let label = UILabel()
        label.text = """
        A tale set on death row, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the lead guard, Paul Edgecombe, recognizes John's gift, he tries to help stave off the condemned man's execution.
        """
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let castTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

   
    private let castMember1Stack = UIStackView()

    private let addToWatchListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add To Watch List", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        let castMember1Image = UIImageView(image: UIImage(named: "cast"))
        castMember1Image.contentMode = .scaleAspectFill
        castMember1Image.layer.cornerRadius = 10
        castMember1Image.layer.masksToBounds = true
        

        castMember1Stack.axis = .vertical
        castMember1Stack.alignment = .center
        castMember1Stack.spacing = 8
        castMember1Stack.addArrangedSubview(castMember1Image)

        castMember1Image.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
        }

        let castMember1Tap = UITapGestureRecognizer(target: self, action: #selector(castMemberTapped))
        castMember1Stack.addGestureRecognizer(castMember1Tap)

       
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(genresStackView)
        contentView.addSubview(overviewTitleLabel)
        contentView.addSubview(overviewTextLabel)
        contentView.addSubview(castTitleLabel)
        contentView.addSubview(castMember1Stack)
        contentView.addSubview(addToWatchListButton)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }

        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.75)
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.3)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        genresStackView.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        overviewTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(genresStackView.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(16)
        }

        overviewTextLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(contentView).inset(16)
        }

        castTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewTextLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        castMember1Stack.snp.makeConstraints { make in
            make.top.equalTo(castTitleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        addToWatchListButton.snp.makeConstraints { make in
            make.top.equalTo(castMember1Stack.snp.bottom).offset(30)
            make.leading.trailing.equalTo(contentView).inset(50)
            make.height.equalTo(50)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }


    @objc private func castMemberTapped() {
        let actorDetailVC = ActorViewController()
        navigationController?.pushViewController(actorDetailVC, animated: true)
    }
}
