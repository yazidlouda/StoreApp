//
//  HomaPageViewController.swift
//  StoreAppProject
//
//  Created by Home on 11/6/21.
//

import UIKit

class HomaPageViewController: UIViewController {

    var clothingDept : Department?
    var kitchenDept : Department?
    var outdoorsDept : Department?
    var toysDept : Department?
    var homeGoodsDept : Department?
    
    
    override func viewWillAppear(_ animated: Bool) {
        for item in clothing {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info:item.description, image: item.image, department: clothingDept!)
        }
        for item in kitchen {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info:item.description, image: item.image, department: kitchenDept!)
        }
        for item in outdoor {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info:item.description, image: item.image, department: outdoorsDept!)
        }
        for item in toys {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info: item.description, image: item.image, department: toysDept!)
        }
        for item in homeGood {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info: item.description, image: item.image, department: homeGoodsDept!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DBHelper.inst.addDepartment(name:"clothing")
        DBHelper.inst.addDepartment(name: "kitchen")
        DBHelper.inst.addDepartment(name: "outdoors")
        DBHelper.inst.addDepartment(name: "home goods")
        DBHelper.inst.addDepartment(name: "toys")
        clothingDept = DBHelper.inst.getDepartment(name:"clothing")
        kitchenDept = DBHelper.inst.getDepartment(name: "kitchen")
        outdoorsDept = DBHelper.inst.getDepartment(name: "outdoors")
        toysDept = DBHelper.inst.getDepartment(name: "toys")
        homeGoodsDept = DBHelper.inst.getDepartment(name: "home goods")
        // Do any additional setup after loading the view.
    }
    

    

}
