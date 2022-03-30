//
//  BrowseScreenViewController.swift
//  myPhotoBrowser
//
//  Created by 김희수 on 2022/03/30.
//

import UIKit

final class BrowseScreenViewController: UIViewController {
    
    var presenter: BrowseScreenPresenterProtocol?
    var viewModel: [PhotoInfo] = []
    
    @IBOutlet weak var imageListView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageListView.delegate = self
        imageListView.dataSource = self
        
        registerCell()
        configSearchBar()
    }
    
    private func registerCell() {
        let name = UINib(nibName: "ImageCell", bundle: Bundle.main)
        imageListView.register(name, forCellWithReuseIdentifier: "ImageCell")
    }
    
    private func configSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Photos"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
    }
}

extension BrowseScreenViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Log.Debug(.UI, searchBar.text ?? "")
        if let text = searchBar.text {
//            presenter?.requestSearch(keyword: text)
        }
    }
    
}

extension BrowseScreenViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.cellSelected(id: viewModel[indexPath.row].id)
    }
}

extension BrowseScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
    }
    
}

extension BrowseScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageListView.frame.size.width  , height:  imageListView.frame.height)
    }
}
