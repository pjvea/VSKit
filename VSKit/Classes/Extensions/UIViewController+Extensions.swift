//
//  UIViewController+Extensions.swift
//  FBSnapshotTestCase
//
//  Created by PJ Vea on 7/1/18.
//

extension UIViewController {
    /// Method that checks if the view controller was presented modally.
    ///
    /// - Returns: Returns true if view controller is presented modally.
    func isModal() -> Bool {
        if let index = navigationController?.viewControllers.index(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
    
    /// Method that either dismisses or pops presented view controller.
    func dismiss() {
        if self.isModal() {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
