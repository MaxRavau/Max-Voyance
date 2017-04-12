//
//  ViewController.swift
//  Max-Voyance
//
//  Created by Maxime Ravau on 12/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var viewLabelPhrase: UIView!
    @IBOutlet var viewEffet: UIVisualEffectView!
    @IBOutlet var labelPhrase: UILabel!
    @IBOutlet var labelTime: UILabel!
    
    var effet: UIVisualEffect!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effet = viewEffet.effect
        viewEffet.effect = nil
        
        viewLabelPhrase.layer.cornerRadius = 5
        viewLabelPhrase.layer.borderColor = UIColor.black.cgColor
        viewLabelPhrase.layer.borderWidth = 1
        
        labelPhrase.text = listeDePhrase[2]
        
        date()
        
    }
    
    
    
    
    func refreshLigne() {
        
        var now = Date()
        
        
        
        
    }
    
    
    func date(){
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        labelTime.text = "\(formatter.string(from: date))"
    }
    
    
    func animateIn(){
        
        self.view.addSubview(viewLabelPhrase)
        viewLabelPhrase.center = self.view.center
        
        viewLabelPhrase.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        viewLabelPhrase.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            
            self.viewEffet.effect = self.effet
            self.viewLabelPhrase.alpha = 1
            self.viewLabelPhrase.transform = CGAffineTransform.identity
            
            
        
    }
    
}
    func animateOut(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.viewLabelPhrase.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.viewLabelPhrase.alpha = 0
            
            self.viewEffet.effect = nil
            
        }) { (success: Bool) in
            self.viewLabelPhrase.removeFromSuperview()
        }
    }

    @IBAction func buttonTapView(_ sender: Any) {
    
        animateIn()

    }
    

    @IBAction func dismissButtonTap(_ sender: Any) {
        
        animateOut()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

