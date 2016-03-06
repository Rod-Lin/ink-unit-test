if (_ENGINE_INK_) { exit }
_ENGINE_INK_ = 1

import io
import "../utils/container.ink"
import "../utils/general.ink"
import "../ui/ui.ink"

$file.putln = fn (str) {
	let s = ""
	if (str == undefined) {
		s = "undefined"
	} else if (str == null) {
		s = "null"
	} else {
		s = str.to_str()
	}
	base.puts(s + "\n");
}

namespace UT_Engine::(
	let TestUnit = fn (name, enter, result, res_fp) {
		this.name = name
		this.enter = enter
		this.result = result
		this.res_fp = res_fp
		this.run = fn (argv...) {
			base.enter with argv
		}
		this.check = fn (result) {
			base.result == result
		}
		this.dispose = fn () {
			if (base.res_fp) {
				base.res_fp.close();
			}
		}
	},
	let TestEngine = fn () {
		this.test_queue = new Array()
		this.push_test = fn (test_unit) {
			base.test_queue.push(test_unit);
		}
		this.run = fn (tmp_folder_path) {
			let i = 1, let failed = 0, let error = 0;
			let ret = cast_native_array(base.test_queue.each { | val |
				let tmp_file_name = tmp_folder_path + "/test_" + (i++)
				let res_fp = new File(tmp_file_name, "w+");

				try {
					val.run(res_fp)
				} catch { | e |
					UT_UIUtils::std_puts("test: " + val.name + " --- Error\n");
					UT_UIUtils::std_puts("  error message: " + e.file_name + ": line " + e.lineno + ": " + e.msg + "\n");
					file_remove(tmp_file_name)
					error++
					continue 0
				}
				ret = val.check(res_fp.read())
				res_fp.close()

				UT_UIUtils::std_puts("test: " + val.name + " --- ");
				if (ret) {
					UT_UIUtils::std_puts("OK\n");
				} else {
					UT_UIUtils::std_puts("Failed\n");
					failed++
				}

				// file_remove(tmp_file_name)
				ret
			})
			UT_UIUtils::std_puts("\n*** FINAL ***: " + (ret.size() - failed - error) + " correct, " +
								 failed + " failed, " + error + " error\n");

			ret
		}
		this.dry_run = fn () {
			let i = 1;
			UT_UIUtils::std_puts("*** collecting output ***\n")
			cast_native_array(base.test_queue.each { | val |
				val.run(val.res_fp)
				ret
			})
			null
		}
		this.dispose = fn () {
			base.test_queue.each { | val |
				val.dispose()
			}
		}
	}
)