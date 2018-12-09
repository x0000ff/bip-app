//
//  MainController.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import UIKit

//############################################################
class MainController: UIViewController {

    //--------------------------------------------------------
    // MARK: - Outlets
    //--------------------------------------------------------
    @IBOutlet weak var cardNumberTF: UITextField!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    //--------------------------------------------------------
    // MARK: - Override
    //--------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardNumberTF.text = nil
        informationLabel.text = nil
        
        showCachedData()
    }

    //--------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cardNumberTF.becomeFirstResponder()
    }
    
    //--------------------------------------------------------
    // MARK: - Cache
    //--------------------------------------------------------
    private func showCachedData() {
        
        guard let cacheManager = ServiceLocator.shared.getService() as CacheManager? else {
            return
        }
        
        cardNumberTF.text = cacheManager.cardNumber
        if cacheManager.hasSavedData {
            show(balance: cacheManager.balance)
        }
    }

    private func saveToCacheCardNumber(_ cardNumber: String, andBalance balance: Int) {

        var cacheManager = ServiceLocator.shared.getService() as CacheManager?
        
        cacheManager?.balance = balance
        cacheManager?.cardNumber = cardNumber
    }
    
    //--------------------------------------------------------
    // MARK: - Actions
    //--------------------------------------------------------
    @IBAction func loadTapped() {
        
        guard let cardNumber = cardNumberTF.text else {
            informationLabel.text = "Type correct number"
            return
        }

        loadBalance(withCardNumber: cardNumber)
    }
    
    //--------------------------------------------------------
    @IBAction func clearCache() {
        cardNumberTF.text = nil
        informationLabel.text = nil
        (ServiceLocator.shared.getService() as CacheManager?)?.clear()
    }
    
    //--------------------------------------------------------
    // MARK: - Network
    //--------------------------------------------------------
    private func loadBalance(withCardNumber cardNumber: String) {
     
        spinner.startAnimating()
        informationLabel.text = nil
        
        let apiService = ServiceLocator.shared.getService() as APIService?
        apiService?.load(cardNumber: cardNumber) { [weak self] result in

            guard let self = self else { return }

            self.spinner.stopAnimating()

            switch result {
            case .success(let status):
                
                if let status = status.status {
                    
                    self.saveToCacheCardNumber(status.number, andBalance: status.balance)
                    self.show(status: status)
                    return
                }
                
                let error = status.error ?? "Unknown error"
                self.show(error: error)

            case .failure(let error):
                self.show(error: error.localizedDescription)
            }
        }
    }

    //--------------------------------------------------------
    // MARK: - Show response from network
    //--------------------------------------------------------
    private func show(error: String) {
        print("err: \(error)")
        informationLabel.text = error
    }

    //--------------------------------------------------------
    private func show(status: Status) {
        print("success: \(status)")
        show(balance: status.balance)
    }

    //--------------------------------------------------------
    private func show(balance: Int) {
        informationLabel.text = "Balance: $\(balance)"
    }
    
    //--------------------------------------------------------
}

//############################################################
