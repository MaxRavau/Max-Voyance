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
    @IBOutlet var labelPhrase: UILabel!
    @IBOutlet var labelTime: UILabel!
    @IBOutlet var buttonImageBoule: UIButton!
    
    //var effet: UIVisualEffect!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    }
    
    func initUI() {
        
        date()
        retrieveHistorique()
        
    }
    
    func effetVisual(){
        
       
        
        viewLabelPhrase.layer.cornerRadius = 5
        viewLabelPhrase.layer.borderColor = UIColor.black.cgColor
        viewLabelPhrase.layer.borderWidth = 1
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        checkLastDate()
        generatePhrase()
        
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
            
            
            self.viewLabelPhrase.alpha = 0.8
            self.viewLabelPhrase.transform = CGAffineTransform.identity
            
            
        
    }
    
}
    func animateOut(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.viewLabelPhrase.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.viewLabelPhrase.alpha = 0
            
            
            
        }) { (success: Bool) in
            self.viewLabelPhrase.removeFromSuperview()
        }
    }
    
    func SaveTapDate(){
        
    historique.append(Date())
        
        print(historique)
        
    }
    
    
    func checkLastDate(){
        
        
        if historique.count > 2 {
        
            
            if lastDatesAreEqualToday() == true{
                
                labelPhrase.text = "Rendez vous Demain pour de nouvelles Phrases!!"
            
            }else{
               
                generatePhrase()
            }
            
        
        }else{
            
            generatePhrase()
            
            
        }

    }
    
    
    func SaveHistorique(){
        
        
        let defaults = UserDefaults.standard
        defaults.set(historique, forKey: "SavedDateArray")
        
    }
    
    func retrieveHistorique(){
        
        let defaults = UserDefaults.standard
        let array = defaults.array(forKey: "SavedDateArray")  as? [Date] ?? [Date]()
        
        historique = array
        
    }
    
    func generatePhrase(){
        
        let randomNum:UInt32 = arc4random_uniform(UInt32(listeDePhrase.count))
        
        // convert the UInt32 to some other  types
        
        let someInt:Int = Int(randomNum)
        
        labelPhrase.text = listeDePhrase[someInt]
        
        
    }
    
    func lastDatesAreEqualToday() -> Bool{
        
        var lastDate = historique.last!
        var lastDate1 = historique.last! - 1
        
        let date = Date()
        let calendar = Calendar.current
        
        let dayToday = calendar.component(.day, from: date)
        let monthToday = calendar.component(.month, from: date)
        
        let dayLastDate = calendar.component(.day, from: lastDate)
        let monthLastDate = calendar.component(.month, from: lastDate)
        
        let dayLastDate1 = calendar.component(.day, from: lastDate1)
        let monthLastDate1 = calendar.component(.month, from: lastDate1)
        
        
        
        
        if dayLastDate == dayToday && dayLastDate1 == dayToday{
            
            
            return true
        
        }else{
            
            return false
        }
        
    }
    
    
    
    @IBAction func buttonTapBoule(_ sender: Any) {
    
        SaveHistorique()
        
        SaveTapDate()
        
        checkLastDate()
        
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

