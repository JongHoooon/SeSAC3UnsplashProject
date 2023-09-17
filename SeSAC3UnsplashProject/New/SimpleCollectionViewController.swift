//
//  NewSimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/14.
//

import UIKit

import SnapKit

final class NewSimpleCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 2000
        case second = 1
    }
    
    private var list = [
        User(name: "Hue", age: 21),
        User(name: "Hue", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    private var list2 = [
        User(name: "Hue", age: 21),
        User(name: "Hue", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    private lazy var lists = [list, list2]
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    private var dataSource: UICollectionViewDiffableDataSource<Section, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        configureDataSource()
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(list, toSection: Section.second)
        snapshot.appendItems(list2, toSection: Section.first)
        dataSource.apply(snapshot)
    } // viewDidLoad
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        // UICollectionView.CellRegistration - iOS14, 메서드 대신 제네릭을 사용, 셀이 생성될 때마다 클로저가 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(
            handler: { cell, indexPath, itemIdentifier in
                // 셀 디자인 및 데이터 처리
                var content = UIListContentConfiguration.valueCell()
                content.text = itemIdentifier.name
                content.textProperties.color = .brown
                content.secondaryText = "\(itemIdentifier.age)"
                content.image = UIImage(systemName: "star.fill")
                content.imageProperties.tintColor = .systemRed
                content.prefersSideBySideTextAndSecondaryText = false
                content.textToSecondaryTextVerticalPadding = 20.0
                cell.contentConfiguration = content
                var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
                backgroundConfig.backgroundColor = .lightGray
                backgroundConfig.cornerRadius = 10.0
                backgroundConfig.strokeWidth = 2.0
                backgroundConfig.strokeColor = .systemBlue
                cell.backgroundConfiguration = backgroundConfig
            }
        )
        
        // Cell For Item At
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                let cell = collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: itemIdentifier
                )
                return cell
            }
        )
    }
}

//extension NewSimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(
//        _ collectionView: UICollectionView,
//        numberOfItemsInSection section: Int
//    ) -> Int {
//        return list.count
//    }
//
//    func collectionView(
//        _ collectionView: UICollectionView,
//        cellForItemAt indexPath: IndexPath
//    ) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(
//            using: cellRegistration,
//            for: indexPath,
//            item: list[indexPath.item]
//        )
//        return cell
//    }
//}
//
//extension NewSimpleCollectionViewController: UICollectionViewDelegate {
//
//}
