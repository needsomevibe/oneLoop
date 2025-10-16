// ChallengeDetail.swift
import Foundation

struct ChallengeDetail: Identifiable, Equatable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let objective: String
    let steps: [String]
}
