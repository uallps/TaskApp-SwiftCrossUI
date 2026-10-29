import TaskUI

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup("TaskApp") {
            TaskListView()
        }
    }
}
