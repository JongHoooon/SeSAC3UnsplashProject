//
//  SettingViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/17.
//

import UIKit

import SnapKit

final class SettingViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<SettingSection, SettingItem>!
    
    private let sections = [
        SettingSection(items: ModeSetting.allCases.map { SettingItem.mode($0) }),
        SettingSection(items: ShareSetting.allCases.map { SettingItem.share($0) })
    ]
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLayout()
        configureDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<SettingSection, SettingItem>()
        snapshot.appendSections(sections)
        sections.forEach {
            snapshot.appendItems($0.items, toSection: $0)
        }
        dataSource.apply(snapshot)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout = createLayout()
    }
}

private extension SettingViewController {
    func configureView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "집중 모드"
    }
    
    func configureLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = true
        configuration.backgroundColor = .systemBackground
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SettingItem> { cell, indexPath, itemIdentifier in
            var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfiguration.cornerRadius = 8.0
            backgroundConfiguration.backgroundColor = .secondarySystemBackground
            cell.backgroundConfiguration = backgroundConfiguration
            var content = UIListContentConfiguration.subtitleCell()
            switch itemIdentifier {
            case let .mode(mode):
                content.text = mode.title
                content.secondaryText = mode.subTitle
                content.image = mode.imgae
                content.imageProperties.tintColor = mode.imageTintColor
                cell.accessories = [.disclosureIndicator()]
                cell.accessories.append(.label(text: mode.trailingText ?? ""))
                cell.contentConfiguration = content
            case let .share(share):
                content.text = share.title
                cell.accessories = [
                    .disclosureIndicator(),
                    .customView(configuration: .init(
                        customView: UISwitch(),
                        placement: .trailing())
                    )
                ]
                cell.contentConfiguration = content
            }
        }
        dataSource = UICollectionViewDiffableDataSource<SettingSection, SettingItem>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: itemIdentifier
                )
            })
    }
}
