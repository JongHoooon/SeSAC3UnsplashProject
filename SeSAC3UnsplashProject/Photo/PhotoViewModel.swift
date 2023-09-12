//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import Foundation

final class PhotoViewModel {
    
    var list = Observable(Photo(
        total: 0,
        total_pages: 0,
        results: []
    ))
    
    func fetchPhoto() {
        APIService.shared.searchPhoto(
            query: "sky",
            completion: { photo in
                guard let photo = photo else { return }
                self.list.value = photo
        })
    }
    
    var rowCount: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return (list.value.results?[indexPath.row])!
    }
}
