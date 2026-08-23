use fmt;
use fs;

export fn loadall(files: []str) ([]str | nomem) = {

	let tasks: []str = [];

	for (let file .. files) {
		match (open(file)) {
			case let file_tasks: []str =>
				for (let task .. file_tasks) append(tasks, task)?;
				free(file_tasks);
			case let err: fs::error => fmt::fatalf("Error opening {}: {}", file, fs::strerror(err));
		};
	};

	return tasks;
};
