import TaskUI
import TaskCore

struct TaskListView: View {
    @State var viewModel = TaskListViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task) {
                    viewModel.toggleCompletion(id: task.id)
                }
            }
            Button("Añadir tarea") {
                viewModel.addTask()
            }
        }
        .padding()
    }
}
