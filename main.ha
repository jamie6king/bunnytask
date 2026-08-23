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

	const todo_files = config.files;

	// load todos
	let todos: []str = [];
	defer strings::freeall(todos);

	// TODO simplify this
	for (let file .. todo_files) {
		match (todo::open(file)) {
			case let todo_items: []str =>
				for (let todo .. todo_items) append(todos, todo)!;
				free(todo_items);
			case let err: fs::error => fmt::fatalf("Error opening {}: {}", file, fs::strerror(err));
		};
	};

	// print todos
	fmt::println("To-dos:")!;

	for (let item .. todos) {
		if (item != "") todo::print(item);
	};
};
