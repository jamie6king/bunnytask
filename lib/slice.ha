use fmt;

export fn slice_remove_empty(slice: *[]str) void = {
	for (let i = 0z; i < len(slice); i += 1) {
		if (slice[i] == "") {
			delete(slice[i]);
			i -= 1;
		};
	};
};

@test fn slice_remove_empty() void = {
	const slice: []str = alloc(["autumn", "", "winter"])!;
	defer free(slice);

	slice_remove_empty(&slice);

	assert(len(slice) == 2);
	assert(slice[0] == "autumn");
	assert(slice[1] == "winter");
};
