if (_UI_INK_) { exit }
_UI_INK_ = 1;

import io
import "../utils/general.ink"

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