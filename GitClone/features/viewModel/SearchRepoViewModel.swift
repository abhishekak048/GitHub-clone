//
//  sdfsd.swift
//  GitClone
//
//  Created by Abhishek Kumar on 09/07/25.
//

import Foundation
import Foundation
import Combine

final class SearchRepoViewModel: ObservableObject {
    
    // MARK: - Inputs
    @Published var query: String = ""
    
    // MARK: - Outputs
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil

    private let repoService: SearchRepoService
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init(repoService: SearchRepoService) {
        self.repoService = repoService
        setupSearchBinding()
    }

    // MARK: - Search on query change
    private func setupSearchBinding() {
        $query
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                if text.isEmpty {
                    self.repositories = []
                    self.error = nil
                } else {
                    self.searchRepositories(query: text)
                }
            }
            .store(in: &cancellables)
    }

    // MARK: - API Call
    private func searchRepositories(query: String) {
        isLoading = true
        error = nil

        repoService.searchRepositories(query: query)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self?.error = err.localizedDescription
                }
            } receiveValue: { [weak self] repos in
                self?.repositories = repos
            }
            .store(in: &cancellables)
    }
}
