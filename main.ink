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
i = 1
dest = ""
is_dry = 0
test_engine = new TestEngine()

ARGV.each { | val |
	if (val == "--dry-run") {
		is_dry = 1;
	}
}

while (file_exist(dest = "tests/test" + i + ".ink")) {
	import dest
	std_putln("Find test: " + dest);

	if (!is_dry) {
		res_file = new File(res_dir + "/test" + i + ".res", "r")
		test_engine.push_test(new TestUnit(auto["$test" + i + "_enter"], res_file.read()));
		res_file.close()
	} else {
		res_file = new File(res_dir + "/test" + i + ".res", "w+")
		test_engine.push_test(new TestUnit(auto["$test" + i + "_enter"], "", res_file));
	}
	i++
}

if (is_dry) {
	test_engine.dry_run(tmp_dir)
} else {
	test_engine.run(tmp_dir).p()
}

test_engine.dispose();