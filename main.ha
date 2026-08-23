use fmt;
use strings;
use todo;
use fs;

def TODO_FILE = "todo.txt";

export fn main() void = {
	const todos = match(todo::open(TODO_FILE)) {
		case let todos: []str => yield todos;
		case let err: fs::error => fmt::fatalf("Error opening {}: {}", TODO_FILE, fs::strerror(err));
	};
	defer strings::freeall(todos);

	fmt::println("To-dos:")!;

	for (let item .. todos) {
		if (item != "") todo::print(item);
	};
};
