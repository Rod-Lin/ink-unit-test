if (_UI_I_) { retn }
_UI_I_ = 1;

import io
import "../utils/general.i"

$string.times = fn (count) {
	let ret = ""
	for (let i = 0, i < count, i++) {
		ret = ret + base
	}
	ret
}

namespace UT_UIUtils::(
	let std_puts = fn (str) {
		stdout.puts(str.to_str())
	},
	let std_putln = fn (str) {
		std_puts(str.to_str() + "\n")
	},
	let print_split = fn (title) {
		std_putln("#".times(10) + " " + title + " " + "#".times(10));
	}
)