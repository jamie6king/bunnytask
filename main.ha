use fmt;
use fs;
use lib;
use strings;
use todo;

export fn main() void = {

	// load config
	const config = match (lib::config_read()) {
		case let config: *lib::config => yield config;
		case let err: fs::error => fmt::fatalf("Error opening config: {}", fs::strerror(err));
	};
	defer lib::config_free(config);

	// TODO handle multiple todo files
	const todo_file = config.files[0];

	// load todos
	const todos = match (todo::open(todo_file)) {
		case let todos: []str => yield todos;
		case let err: fs::error => fmt::fatalf("Error opening {}: {}", todo_file, fs::strerror(err));
	};
	defer strings::freeall(todos);

	// print todos
	fmt::println("To-dos:")!;

	for (let item .. todos) {
		if (item != "") todo::print(item);
	};
};
