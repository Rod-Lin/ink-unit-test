#! /usr/bin/ink

import blueprint
import io
import "utils/container.ink", "ui/ui.ink", "utils/engine.ink"

using UT_UIUtils
using UT_Engine

res_dir = new Directory("res")
tmp_dir = new Directory("tmp")
test_dir = new Directory("tests");
i = 1
dest = ""
is_dry = 0
is_debug = 0
test_engine = new TestEngine()

print_split("preparing");

ARGV.remove(0)
ARGV.each { | val |
	if (val == "--dry-run") {
		print_split("dry-run mode");
		is_dry = 1;
	} else if (val == "--debug") {
		print_split("debug mode");
		is_debug = 1
	}
}

if (!res_dir.exist()) {
	if (is_dry) {
		res_dir.create()
	} else {
		p("No result directory found, please name it 'res'");
		exit
	}
}

if (!test_dir.exist()) {
	p("No test directory found, please name it 'tests'");
	exit
}

@exit = fn (v) {
	if (tmp_dir.exist() && !is_debug) {
		tmp_dir.remove();
	}
	exit
}

if (!tmp_dir.exist()) {
	tmp_dir.create();
}

if (!is_debug) {
	if (!stderr.reopen(res_dir.path() + "/stderr.out", "w+")) {
		p('Cannot create ' + res_dir.path() + '/stderr.out file');
		exit
	}
}

print_split("checking tests");

test_dir.each { | val |
	if (val == "." || val == "..") {
		continue;
	}

	std_putln("Find test: " + val);

	import test_dir.path() + "/" + val

	if (is_dry) {
		let out_file = new File(let tmp_path = (res_dir.path() + "/" + val + ".out"), "w+");
		if (out_file) {
			if (typename(let tmp_begin_f = auto["$test_begin"]) != "function") {
				p("Failed to find '$test_begin' function in test file '" + val + "'");
				continue;
			} else {
				test_engine.push_test(new TestUnit(val, tmp_begin_f, "", out_file));
			}
		} else {
			p("Cannot create output file '" + tmp_path + "'");
		}
	} else {
		res_file = new File(let tmp_path = (res_dir.path() + "/" + val + ".out"), "r")

		if (res_file) {
			if (typename(let tmp_begin_f = auto["$test_begin"]) != "function") {
				p("Failed to find '$test_begin' function in test file '" + val + "'");
				continue;
			} else {
				test_engine.push_test(new TestUnit(val, tmp_begin_f, res_file.read()));
			}
			res_file.close()
		} else {
			p("Cannot open result file '" + tmp_path + "'");
		}
	}
}

print_split("tests begin");

if (is_dry) {
	test_engine.dry_run()
} else {
	test_engine.run(tmp_dir.path())
}

print_split("tests end");

test_engine.dispose();

exit