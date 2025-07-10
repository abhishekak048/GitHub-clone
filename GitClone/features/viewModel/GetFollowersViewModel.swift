//
//  asdjhdas.swift
//  GitClone
//
//  Created by Abhishek Kumar on 09/07/25.
//

import Foundation
import Combine

class GetFollowersViewModel : ObservableObject {
    
    private let getFollowingRepo : GetFollowersRepo
    
    private(set) var users = Users()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: FollowingState = .loading
    

    init(getFollowingRepo: GetFollowersRepo){
        self.getFollowingRepo = getFollowingRepo
    }
    
    @MainActor
    func getFollowing(userName:String){
        self.state = .loading
        
        
        let cancellable = getFollowingRepo.getFollowers(from: .getUserFollowers(userName: userName))
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .success(results: self.users)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.users = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
