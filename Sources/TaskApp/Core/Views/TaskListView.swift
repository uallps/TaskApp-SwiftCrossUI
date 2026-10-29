import TaskUI
import TaskCore

struct TaskListView: View {
    @State var viewModel = TaskListViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.tasks) { task in
                HStack {
                    Button(task.isCompleted ? "✓" : "○") {
                        viewModel.toggleCompletion(id: task.id)
                    }
                    Text(task.title)
                }
            }
            Button("Añadir tarea") {
                viewModel.addTask()
            }
        }
        .padding()
    }
}
