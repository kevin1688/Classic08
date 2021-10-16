//
//  DataModel.swift
//  Classic08
//
//  Created by kai wen chen on 2021/10/15.
//

import Foundation
import FirebaseFirestore
import FirebaseStorageSwift

struct student:Identifiable,Hashable,Codable {
    var id = UUID()
    var name:String
}

var tempStudents = [
    student(name: "sharon"),
    student(name: "jeff")
]

class DataModel: ObservableObject {
    private let path: String = "test"
    
    private let store = Firestore.firestore()
    @Published var students = [student]()
    
    init() {
        //listenData()
    }
    /*
    func addAll(_ mountainInfs: [mInf]) {//新增資料
        mountainInfs.forEach { item in
          do {
            _ = try store.collection(path).addDocument(from: item)
          } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
          }
        }
    }
    
    func add(_ mountainInf: mInf) {//新增資料
        do {
          _ = try store.collection(path).addDocument(from: mountainInf)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
    
    func updateData(name:String,onOff:Bool){
        store.collection(path).whereField("name", isEqualTo: name).getDocuments { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    let document = querySnapshot.documents.first
                    document?.reference.updateData(["favorite": onOff], completion: { (error) in
                    })
                }
            }
        }
    
    func get() { //取得資料
          store.collection("path").getDocuments { (querySnapshot, error) in
             if let querySnapshot = querySnapshot {
                 self.students = querySnapshot.documents.compactMap { document in
                  try? document.data(as: student.self)
                }
             }else{
                self.students = tempStudents
             }
          }
    }*/
    
    func listenData(){ //監聽資料變化
        let docRef = store.collection("test").document("NICllK3n1G6qmwLSSbX6")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
}
