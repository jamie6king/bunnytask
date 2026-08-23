use fs;
use io;
use lib;
use os;
use strings;

export fn open(file: str) ([]str | fs::error) = {

	// open
	const todos = os::open(file)?;
	defer io::close(todos)!;

	const todos = io::drain(todos)!;
	defer free(todos);

	// read
	const todos = strings::fromutf8(todos)!;
	const todos = strings::split(todos, "\n")!;

	lib::slice_remove_empty(&todos);

	return strings::dupall(todos)?;
};
