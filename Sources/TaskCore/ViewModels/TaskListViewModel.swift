import Foundation
import Observation

@Observable
public final class TaskListViewModel {
    public var tasks: [Task] = [
        Task(
            title: "Comprar leche",
            dueDate: Date(timeIntervalSince1970: 1_794_700_800),
            priority: .high
        ),
        Task(title: "Hacer ejercicio", priority: .medium),
        Task(title: "Llamar a mamá")
    ]

    public init() {}

    public func toggleCompletion(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isCompleted.toggle()
    }

    public func addTask() {
        tasks.append(Task(title: "Tarea de ejemplo"))
    }
}
