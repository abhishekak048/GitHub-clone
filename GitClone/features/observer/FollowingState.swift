
import Foundation

enum FollowingState {
    case loading
    case success(results: Users)
    case failed(error:Error)
}

enum UserState {
    case loading
    case success(result: UserResponse)
    case failed(error:Error)
}
