import Foundation
import SwiftCrossUI
import TaskCore

/// En SwiftCrossUI `NavigationStack` exige una ruta, `NavigationLink` recibe esa
/// ruta y el destino se declara sobre la propia pila.
public struct TaskListView: View {
    @State var viewModel = TaskListViewModel()
    @State var config = AppConfig()
    @State var path = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                Text("Tareas")
                    .font(.title)
                HStack {
                    Toggle("Fechas", isOn: $config.showDueDates)
                    Toggle("Prioridades", isOn: $config.showPriorities)
                    Button("Añadir Tarea") {
                        viewModel.addTask()
                    }
                }
                ForEach(viewModel.tasks) { task in
                    HStack {
                        TaskRowView(
                            task: task,
                            showDueDates: config.showDueDates,
                            showPriorities: config.showPriorities,
                            toggleCompletion: {
                                viewModel.toggleCompletion(id: task.id)
                            }
                        )
                        NavigationLink("Detalle", value: task.id, path: $path)
                    }
                }
            }
            .padding()
        }
        .navigationDestination(for: UUID.self) { id in
            TaskDetailView(task: binding(for: id), close: { path.removeLast() })
        }
    }

    private func binding(for id: UUID) -> Binding<Task> {
        Binding(
            get: { viewModel.tasks.first { $0.id == id } ?? Task(title: "") },
            set: { newValue in
                guard let index = viewModel.tasks.firstIndex(where: { $0.id == id }) else { return }
                viewModel.tasks[index] = newValue
            }
        )
    }
}
