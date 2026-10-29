import Foundation

public struct Task: Identifiable {
    public let id = UUID()
    public var title: String
    public var isCompleted: Bool = false
    public var dueDate: Date?
    public var priority: Priority?

    public init(title: String, dueDate: Date? = nil, priority: Priority? = nil) {
        self.title = title
        self.dueDate = dueDate
        self.priority = priority
    }
}
