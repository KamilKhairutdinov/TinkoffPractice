//
//  ProfileViewController.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 19.03.2024.
//

import UIKit
import SnapKit

enum ProfileStates {
    case settings, watching
}

final class ProfileViewController: UIViewController, FlowControllerWithValue {

    // MARK: - UI elements
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.defaultAvatar)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var loginLabel: UILabel = {
        let label = labelFactory.createLabel(color: UIColor.userDataText, font: UIFont.boldSystemFont(ofSize: 22))
        label.text = "Aboba"

        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = labelFactory.createLabel(color: UIColor.userDataText, font: UIFont.systemFont(ofSize: 17))
        label.text = "Aboba@gmail.com"

        return label
    }()

    private lazy var watchingStatusCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = CGSize(width: 100, height: 30)

        let collectionView = collectionViewFactory.createColletcionView(
            layout: layout,
            dataSource: collectionViewDataSource
        )
        collectionView.register(
            WatchingStatusCollectionViewCell.self,
            forCellWithReuseIdentifier: WatchingStatusCollectionViewCell.reuseIdentifier
        )

        return collectionView
    }()

    // MARK: - Variables
    var completionHandler: ((ProfileStates) -> Void)?
    private var collectionViewDataSource: ProfileCollectionViewDataSource
    private let labelFactory = LabelFactory()
    private let collectionViewFactory = CollectionViewFactory()
    private var viewModel: ProfileViewModel

    // MARK: - Init
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        collectionViewDataSource = ProfileCollectionViewDataSource(cellViewModels: viewModel.cellViewModels)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Strings.Titles.profile
        configureNavigationBar()
        configureUI()
    }
}

// MARK: - UI and navigation bar handling
extension ProfileViewController {
    private func configureUI() {
        addSubviews(
            avatarImageView, loginLabel,
            emailLabel, watchingStatusCollectionView
        )

        avatarImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(
                LayoutConstants.ProfileView.AvatarImageView.topOffset
            )
            make.height.width.equalTo(
                view.frame.width * LayoutConstants.ProfileView.AvatarImageView.widthHeightMultiplier
            )
        }

        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(avatarImageView.snp.bottom).offset(
                LayoutConstants.ProfileView.LoginLabel.topOffset
            )
        }

        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(
                LayoutConstants.ProfileView.EmailLabel.topOffset
            )
        }

        watchingStatusCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(emailLabel.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
    }

    private func configureNavigationBar() {
        let settingsAction = UIAction { _ in
            print("run settings")
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: SystemImage.gearshape)?.withTintColor(UIColor.mainText, renderingMode: .alwaysOriginal),
            primaryAction: settingsAction
        )
    }
}
