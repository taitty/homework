//
//  InfoScreenWireframe.swift
//  myPhotoBrowser
//
//  Created by 김희수 on 2022/03/30.
//

import Foundation
import UIKit

protocol InfoScreenWireframeProtocol {

}

final class InfoScreenWireframe {
    
    private var dataSource: String?
    private var view: UIViewController?
    
    init(dataSource: String?) {
        self.dataSource = dataSource
    }
    
    func setup() -> UIViewController {
        let storyboard = UIStoryboard(name: "InfoScreen", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "InfoScreen") as? InfoScreenViewController
        let presenter = InfoScreenPresenter()
        let interactor = InfoScreenInteractor()
        
        self.view = view
        view?.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        interactor.dataSource = dataSource
        
        guard let view = view else {
            Log.Debug(.UI, "failed to setup InfoScreen...")
            return UIViewController()
        }
        return view
    }

    func push(from: UIViewController) {
        guard let view = self.view else {
            Log.Debug(.UI, "InfoScreen is not created...")
            return
        }
        from.present(view, animated: true, completion: nil)
    }
}

extension InfoScreenWireframe: InfoScreenWireframeProtocol {}
