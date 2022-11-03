require("lint").linters_by_ft = {
	markdown = { "vale" },
	python = { "flake8", "pydocstyle", "pylint" },
	cpp = { "cpplint" },
}
