//
//  BaseViewController.swift
//  TabBarController
//
//  Created by webwerks on 12/09/17.
//  Copyright © 2017 smart. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var containerView: UIView!
    

    let VIEW_TRANSITION_TIME = 0.4

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    
   
    @IBAction func hotNewsBtn(_ sender: Any) {
        let secondChildVC: HotNewsViewController? = storyboard?.instantiateViewController(withIdentifier: "HotNewsViewController") as? HotNewsViewController
        addChildViewController(secondChildVC!)
        secondChildVC?.didMove(toParentViewController: self)
        secondChildVC?.view.frame = CGRect(x: 0.0, y: containerView.frame.size.height, width: containerView.frame.size.width, height: containerView.frame.size.height)
        view.insertSubview((secondChildVC?.view)!, belowSubview: baseView)
        
        self.showAnnimationBottom(toTop: (secondChildVC?.view)!, frame: (secondChildVC?.view.frame)!)
    }
    
    @IBAction func profileBtn(_ sender: Any) {
        
//        if childViewControllers.count > 0 {
//            for vc: UIViewController in childViewControllers {
//                if !(vc is HomeViewController) && !(vc is UINavigationController) {
//                    vc.willMove(toParentViewController: nil)
//                    vc.view.removeFromSuperview()
//                    vc.removeFromParentViewController()
//                }
//            }
//        }
        let secondChildVC: ProfileViewController? = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        addChildViewController(secondChildVC!)
        secondChildVC?.didMove(toParentViewController: self)
        secondChildVC?.view.frame = CGRect(x: 0.0, y: containerView.frame.size.height, width: containerView.frame.size.width, height: containerView.frame.size.height)
        view.insertSubview((secondChildVC?.view)!, belowSubview: baseView)
        
        self.showAnnimationBottom(toTop: (secondChildVC?.view)!, frame: (secondChildVC?.view.frame)!)
    }
  
    
    @IBAction func centerBtn(_ sender: Any) {
        
        if childViewControllers.count > 0 {
            for vc: UIViewController in childViewControllers {
                if !(vc is HomeViewController) && !(vc is UINavigationController) {
                    vc.willMove(toParentViewController: nil)
                    vc.view.removeFromSuperview()
                    vc.removeFromParentViewController()
                }
            }
        }
    }

    @IBAction func dollarBtn(_ sender: Any) {
        
        let secondChildVC: DollarViewController? = storyboard?.instantiateViewController(withIdentifier: "DollarViewController") as? DollarViewController
        addChildViewController(secondChildVC!)
        secondChildVC?.didMove(toParentViewController: self)
        secondChildVC?.view.frame = CGRect(x: 0.0, y: containerView.frame.size.height, width: containerView.frame.size.width, height: containerView.frame.size.height)
        view.insertSubview((secondChildVC?.view)!, belowSubview: baseView)
        
        self.showAnnimationBottom(toTop: (secondChildVC?.view)!, frame: (secondChildVC?.view.frame)!)
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        
//        if childViewControllers.count > 0 {
//            for vc: UIViewController in childViewControllers {
//                if !(vc is HomeViewController) && !(vc is UINavigationController) {
//                    vc.willMove(toParentViewController: nil)
//                    vc.view.removeFromSuperview()
//                    vc.removeFromParentViewController()
//                }
//            }
//        }
        let secondChildVC: MenuViewController? = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
//        addChildViewController(secondChildVC!)
//        secondChildVC?.didMove(toParentViewController: self)
//        secondChildVC?.view.frame = CGRect(x: 0.0, y: containerView.frame.size.height, width: containerView.frame.size.width, height: containerView.frame.size.height)
//        view.insertSubview((secondChildVC?.view)!, belowSubview: baseView)
       
        
        
        secondChildVC?.providesPresentationContextTransitionStyle = true
        secondChildVC?.definesPresentationContext = true
        secondChildVC?.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext

        
        self.present(secondChildVC!, animated: true, completion: nil)
    }
    
    
    
    //Animations & get top controller
    
    func hideAnnimationBottom(toTop viewcontroller: UIViewController, frame: CGRect) {
        viewcontroller.view.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        UIView.animate(withDuration: VIEW_TRANSITION_TIME, delay: 0.0, options: .beginFromCurrentState, animations: {() -> Void in
            viewcontroller.view.frame = CGRect(x: 0.0, y: frame.size.height, width: frame.size.width, height: frame.size.height)
        }, completion: {(_ completed: Bool) -> Void in
            viewcontroller.willMove(toParentViewController: nil)
            viewcontroller.view.removeFromSuperview()
            viewcontroller.removeFromParentViewController()
            //Reload Current Top Controller after removing
            let currentTopMostChildCont: UIViewController? = self.getCurrentTopMostChildController()
            self.loadViewOf(currentTopMostChildCont!)
        })
    }
    
    //Method swizzling
    func loadViewOf(_ controller: UIViewController) {
        controller.viewWillAppear(false)
    }
    
    func showAnnimationBottom(toTop view: UIView, frame: CGRect) {
        view.frame = CGRect(x: 0.0, y: frame.size.height, width: frame.size.width, height: frame.size.height)
        UIView.animate(withDuration: VIEW_TRANSITION_TIME, delay: 0.0, options: .beginFromCurrentState, animations: {() -> Void in
            view.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        }, completion: {(_ completed: Bool) -> Void in
        })
    }
    
    func getCurrentTopMostChildController() -> UIViewController {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while (topController?.childViewControllers.count)! > 0 {
            topController = topController?.childViewControllers.last
        }
        return topController!
    }
    
    
}
