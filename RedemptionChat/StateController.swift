//
//  StateController.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 18/05/2021.
//
import Firebase
import FirebaseFirestore
import FirebaseAuth

class StateController: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    @Published var users: [User] = []
    @Published var conversations: [Conversation] = [] // my convs
    
    let db = Firestore.firestore()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func getUser() -> User {
        let user = self.auth.currentUser
        if let user = user {
            return User(id: user.uid, email: user.email ?? "No email")
        } else {
            return User(id: "", email: "No User")
        }
    }
    
    func updateUsers(){
        users.removeAll()
        db.collection("users").getDocuments() { (result, err) in
            if let err = err {
                print("Error getting users: \(err)")
            } else {
                for doc in result!.documents {
                    let data = doc.data()
                    if let dataEmail = data["email"] as? String {
                        let user = User(id: doc.documentID, email: dataEmail)
                        self.users.append(user)
                    }
                }
            }
        }
    }
    
    func getConversations(){
        // based on this signedIn user
        db.collection("conversations").getDocuments() { (result, err) in
            if let err = err {
                print("Error getting conversations: \(err)")
            } else {
                for doc in result!.documents {
                    let data = doc.data()
                    
                    if let userId1 = data["userId1"] as? String,
                       let userId2 = data["userId2"] as? String,
                       let content = data["content"] as? String{
                        
                        let user = self.auth.currentUser
                        if let user = user {
                            let uid = user.uid
                            
                            if userId1 == uid || userId2 == uid { // if this conversation is related to me
                                
                                let conversation = Conversation(id: doc.documentID, userId1: userId1, userId2: userId2, content: content)
                                self.conversations.append(conversation)
                            }
                            
                        }
                        
    
                    }
                }
            }
        }
    }
    
    func addConversation(userId: String){
        let user = self.auth.currentUser
        if let user = user {
            let uid = user.uid
            let _ = try! db.collection("conversations").addDocument(data: ["userId1" : uid, "userId2" : userId, "content": ""]) { (err) in
                if err != nil {
                    print(err!.localizedDescription)
                    return
                } else {
                    print("Conversation added to 'conversations' db")
                }
            }
        }
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Signed In")
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
    }
    
    func addUser(email: String) {
        let _ = try! db.collection("users").addDocument(data: ["email" : email, "messages" : []]) { (err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            } else {
                print("User added to 'users' db")
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Signed Up")
                self?.addUser(email: email)
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    
    
    
    
}
