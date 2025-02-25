//
//  AppStoreDataSourceProtocol.swift
//  myAppStore
//
//  Created by 김희수 on 2022/03/21.
//

import Foundation
import ReactiveSwift

protocol AppStoreDataSourceProtocol {
    func getData(keyword: String) -> SignalProducer<[SearchModel], TraceError>
}
