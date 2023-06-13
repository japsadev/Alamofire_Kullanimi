//
//  ViewController.swift
//  Alamofire_Kullanimi
//
//  Created by Salih Yusuf Göktaş on 13.06.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		kisiEkle()
		kisiSil()
		kisiGuncelle()
		aramaYap()
		tumKisiler()
		
	}
	
	func kisiEkle() {
		
		let parametreler:Parameters = ["kisi_ad":"TESTALAMOFİRE","kisi_tel":"9999999"]
		
		AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters:parametreler).response { response in
			
			if let data = response.data {
				
				do {
					
					if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
						print(json)
					}
				}catch{
					print(error.localizedDescription)
				}
			}
			
		}
		
	}
	
	func kisiSil() {
		
		let parametreler:Parameters = ["kisi_id":120]
		
		AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters:parametreler).response { response in
			
			if let data = response.data {
				
				do {
					
					if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
						print(json)
					}
				}catch{
					print(error.localizedDescription)
				}
			}
			
		}
		
	}
	
	func kisiGuncelle() {
		
		let parametreler:Parameters = ["kisi_id":99,"kisi_ad":"XXXXXXX","kisi_tel":"89374985734895"]
		
		AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters:parametreler).response { response in
			
			if let data = response.data {
				
				do {
					
					if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
						print(json)
					}
				}catch{
					print(error.localizedDescription)
				}
			}
			
		}
		
	}
	
	func tumKisiler() {
		
		AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response { response in
			
			if let data = response.data {
				
				do {
					
					let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
					
					if let kisiListesi = cevap.kisiler {
						
						for kisi in kisiListesi {
							
							print("Kisi_id  : \(kisi.kisi_id!)")
							print("Kisi_ad  : \(kisi.kisi_ad!)")
							print("Kisi_tel : \(kisi.kisi_tel!)")
							
						}
					}
				}catch{
					print(error.localizedDescription)
				}
			}
			
		}
		
	}
	
	func aramaYap() {
		
		let parametreler:Parameters = ["kisi_ad":"X"]
		
		AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters:parametreler).response { response in
			
			if let data = response.data {
				
				do {
					
					let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
					
					if let kisiListesi = cevap.kisiler {
						
						for kisi in kisiListesi {
							
							print("Kisi_id  : \(kisi.kisi_id!)")
							print("Kisi_ad  : \(kisi.kisi_ad!)")
							print("Kisi_tel : \(kisi.kisi_tel!)")
							
						}
					}
					
				}catch{
					print(error.localizedDescription)
				}
			}
			
		}
		
	}
	
}
