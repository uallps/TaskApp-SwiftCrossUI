import SwiftUI

struct TaskListView: View {
    @State private var viewModel = TaskListViewModel()

    var body: some View {
        List(viewModel.tasks) { task in
            Text(task.title)
        }
    }
}
