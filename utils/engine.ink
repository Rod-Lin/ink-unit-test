if (_ENGINE_INK_) { retn }
_ENGINE_INK_ = 1

import io
import "../utils/container.ink"
import "../utils/general.ink"

namespace UT_Engine::(
	let TestUnit = fn (enter, result, res_fp) {
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
			let i = 1;
			retn cast_native_array(base.test_queue.each { | val |
				let tmp_file_name = tmp_folder_path + "/test_" + (i++)
				let res_fp = new File(tmp_file_name, "w+");

				val.run(res_fp)
				ret = val.check(res_fp.read())
				res_fp.close()

				file_remove(tmp_file_name)
				ret
			})
		}
		this.dry_run = fn (tmp_folder_path) {
			let i = 1;
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