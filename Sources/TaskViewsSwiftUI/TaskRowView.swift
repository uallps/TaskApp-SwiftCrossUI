import SwiftUI
import TaskCore

public struct TaskRowView: View {
    let task: Task
    let showDueDates: Bool
    let showPriorities: Bool
    let toggleCompletion: () -> Void

    public init(
        task: Task,
        showDueDates: Bool,
        showPriorities: Bool,
        toggleCompletion: @escaping () -> Void
    ) {
        self.task = task
        self.showDueDates = showDueDates
        self.showPriorities = showPriorities
        self.toggleCompletion = toggleCompletion
    }

    public var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted)
                if showDueDates, let dueDate = task.dueDate {
                    Text("Vence: \(dueDate.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                if showPriorities, let priority = task.priority {
                    Text("Prioridad: \(priority.rawValue)")
                        .font(.caption)
                        .foregroundColor(priorityColor(for: priority))
                }
            }
        }
    }

    private func priorityColor(for priority: Priority) -> Color {
        switch priority {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
