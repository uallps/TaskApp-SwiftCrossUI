import SwiftUI
import TaskCore

public struct TaskListView: View {
    @State private var viewModel = TaskListViewModel()
    @State private var config = AppConfig()

    public init() {}

    public var body: some View {
        NavigationStack {
            List($viewModel.tasks) { $task in
                NavigationLink(destination: TaskDetailView(task: $task)) {
                    TaskRowView(
                        task: task,
                        showDueDates: config.showDueDates,
                        showPriorities: config.showPriorities,
                        toggleCompletion: {
                            viewModel.toggleCompletion(id: task.id)
                        }
                    )
                }
            }
            .toolbar {
                Toggle("Fechas", isOn: $config.showDueDates)
                Toggle("Prioridades", isOn: $config.showPriorities)
                Button("Añadir Tarea") {
                    viewModel.addTask()
                }
            }
            .navigationTitle("Tareas")
        }
    }
}
