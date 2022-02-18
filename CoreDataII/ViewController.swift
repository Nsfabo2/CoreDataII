//
//  ViewController.swift
//  CoreDataII
//
//  Created by Najla on 13/01/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var NamesList : [Names] = []

    let content = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let save = (UIApplication.shared.delegate as! AppDelegate).saveContext

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func ShowAlertButtonClicked(_ sender: Any) {
        showAlert()
    }
    
    @objc private func showAlert(){
        let alert = UIAlertController(title: "SING IN ", message: "PLEASE SIN IN ", preferredStyle: .alert)
        alert.addTextField { Field in
            Field.placeholder = "Email Address"
            Field.returnKeyType = .next
            Field.keyboardType = .emailAddress
            
        }
        alert.addTextField { Field in
            Field.placeholder = "Password"
            Field.returnKeyType = .continue
            Field.isSecureTextEntry = true
            
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            guard let fields = alert.textFields, fields.count == 2 else {return}
            let emailField = fields[0]
            let passwordFiel = fields[1]
            
            guard let email = emailField.text, !email.isEmpty,
                  let password = passwordFiel.text , !password.isEmpty
            else {
                print("INVEILDE")
                return
            }
            
            print(" email :  \(email)" )
            print(" password :\(password) ")

           
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func saveData (){
        let newThing = Names(context: content)
        newThing.name = "value3"
        save()
    }
  

    func fetchData(){
        let requst:NSFetchRequest<Names> = Names.fetchRequest()
        do{
            NamesList = try content.fetch(requst)
            
        }catch{
            print(error)
        }
 
        
    }


}

