import TaskUI
import TaskCore

struct TaskListView: View {
    @State var viewModel = TaskListViewModel()
    @State var config = AppConfig()

    var body: some View {
        VStack {
            HStack {
                Button("Fechas: \(config.showDueDates ? "Sí" : "No")") {
                    config.showDueDates.toggle()
                }
                Button("Prioridades: \(config.showPriorities ? "Sí" : "No")") {
                    config.showPriorities.toggle()
                }
            }
            ForEach(viewModel.tasks) { task in
                TaskRowView(
                    task: task,
                    showDueDates: config.showDueDates,
                    showPriorities: config.showPriorities,
                    toggleCompletion: {
                        viewModel.toggleCompletion(id: task.id)
                    }
                )
            }
            Button("Añadir tarea") {
                viewModel.addTask()
            }
        }
        .padding()
    }
}
