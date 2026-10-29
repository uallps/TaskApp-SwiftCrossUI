import Foundation
import SwiftCrossUI
import TaskCore

/// Misma API que la fila de SwiftUI. SwiftCrossUI no tiene `Image(systemName:)`,
/// `.strikethrough` ni `Color.secondary`, así que:
/// - el icono es un carácter en un botón,
/// - la tarea completada se muestra en gris y cursiva en lugar de tachada,
/// - el texto secundario usa `Color.gray`.
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
            Button(task.isCompleted ? "●" : "○") {
                toggleCompletion()
            }
            VStack(alignment: .leading) {
                if task.isCompleted {
                    Text(task.title)
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    Text(task.title)
                }
                if showDueDates, let dueDate = task.dueDate {
                    Text("Vence: \(dueDate.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
#if Prioridades
                if showPriorities, let priority = task.priority {
                    Text("Prioridad: \(priority.rawValue)")
                        .font(.caption)
                        .foregroundColor(priorityColor(for: priority))
                }
#endif
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
