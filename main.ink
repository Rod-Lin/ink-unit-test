#! /usr/bin/ink

import io
import "utils/container.ink"
import "ui/ui.ink"
import "utils/engine.ink"

using UT_UIUtils
using UT_Engine

print_split("start");

res_dir = "res"
tmp_dir = "tmp"
i = 1;
dest = ""
test_engine = new TestEngine()

while (file_exist(dest = "tests/test" + i + ".ink")) {
	import dest
	res_file = new File(res_dir + "/test" + i + ".res", "r")
	test_engine.push_test(new TestUnit(let["$test" + i + "_enter"], res_file.read()));
	res_file.close()
	i++
}

test_engine.run(tmp_dir).p()