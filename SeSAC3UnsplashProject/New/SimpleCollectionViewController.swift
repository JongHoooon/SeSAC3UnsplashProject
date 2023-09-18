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
    
    var viewModel = NewSimpleViewModel()
//    private lazy var lists = [list, list2]
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    private var dataSource: UICollectionViewDiffableDataSource<Section, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        configureDataSource()
        
        viewModel.list.bind { [weak self] _ in
            self?.updateSnapshot()
        }
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 2,
            execute: { [weak self] in
                self?.viewModel.append()
        })
        
        
    } // viewDidLoad
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(viewModel.list.value, toSection: Section.first)
        snapshot.appendItems(viewModel.list2, toSection: Section.second)
        dataSource.apply(snapshot)
    }
    
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

extension NewSimpleCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text ?? "")
    }
}

extension NewSimpleCollectionViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
//        let user = viewModel.list.value[indexPath.item]   -> 더 이상 사용하지 않음
        
        guard let item = dataSource.itemIdentifier(for: indexPath)
        else { return }
        dump(item)
//        viewModel.removeUser(index: indexPath.item
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
