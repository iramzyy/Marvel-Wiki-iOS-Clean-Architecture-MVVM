//
//  Router.swift
//  Marvel-Wiki
//
//  Created by Ramzy on 15/08/2021.
//

import UIKit

protocol RouterProtocol: AnyObject {
    var presentedView: UIViewController! { set get }
    func present(view: UIViewController)
    func startActivityIndicator()
    func stopActivityIndicator()
    func dismiss()
    func pop()
    func popToRoot()
    func popTo(vc: UIViewController)
    func push(view: UIViewController)
}


final class Router: RouterProtocol {
    weak var presentedView: UIViewController!
    
    func present(view: UIViewController) {
        presentedView?.present(view, animated: true, completion: nil)
    }
    
    func startActivityIndicator() {
      
    }
    
    func stopActivityIndicator() {
        
    }
    
    func dismiss() {
        presentedView?.dismiss(animated: true, completion: nil)
    }
    
    func pop() {
        _ = presentedView?.navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        _ = presentedView?.navigationController?.popToRootViewController(animated: true)
    }
    
    func popTo(vc: UIViewController) {
        _ = presentedView?.navigationController?.popToViewController(vc, animated: true)
    }
    
    func push(view: UIViewController) {
        presentedView?.navigationController?.pushViewController(view, animated: true)
    }
}

