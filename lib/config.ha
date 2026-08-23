use dirs;
use format::ini;
use fs;
use io;
use strings;
use os;

export type config = struct { files: []str };

fn load_item(scanner: *ini::scanner) (ini::entry | done) = {
	match(ini::next(scanner)) {
		case let entry: ini::entry => return entry;
		case => return done;
	};
};

// caller must free after use using [[config_free]]
export fn config_read() (*config | fs::error | nomem) = {

    const config_file = dirs::config("bunnytask");
    const config_file = strings::concat(config_file, "/config.ini")?;
    defer free(config_file);

	// open
	const config_file = os::open(config_file)?;
	defer io::close(config_file)!;

	const scanner = ini::scan(config_file);
	defer ini::finish(&scanner);

	// read
	let files: []str = [];

	for (let entry => load_item(&scanner)) {
		if (strings::trim(entry.1) == "todo_file") {
			// TODO shell expand
			const file = strings::trim(entry.2);

			append(files, strings::dup(file)?)?;
		};
	};

	// return
	return alloc(config { files = files })?;
};

export fn config_free(config: *config) void = {
	strings::freeall(config.files);
	free(config);
};
