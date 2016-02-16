$test_begin = fn (out) do
/**
 * TEST: paf1.ink
 *
 * Contents:
 *   1. Partial applied function
 *
 * Testing Types: Function
 */

	let sum = fn (arg...) {
		let ret = 0
		for (let i = 0, i < arg.size(), i++) {
			ret = ret + arg[i]
		}
		ret
	}

	paf1 = sum(1, _, 2, _, 8, _, 0)
	paf2 = paf1(2) with [2] with [2, _, 5, 3]
	paf3 = paf2(_, 2, 3, 4)(2);

	out.putln(paf3)

	_.missing = fn (name) {
		fn (args...) {
			let ret = fn (b) {
				b[name]() with args;
			}
			ret.missing = fn (name) {
				let tmp_base = base
				fn (args...) {
					let ret = fn (b) {
						tmp_base(b)[name]() with args;
					}
					ret.missing = tmp_base.missing
					ret
				}
			}
			ret
		}
	}

	out.putln((_ + 1)(10));

	p_all = fn (argv...) {
		argv.each { | val |
			out.puts(val.to_str());
		}
		out.putln("");
	}

	p_for_each = _.each(p_all("from each: ", _));
	p_for_each([1, 2, 3]);

	x = _

	formular1 = _ * 2 + 1

	for (let i = 0, i < 10, i++) {
		out.putln("when x = " + i + ", formular1 = " + formular1(i));
	}

	let p = out.putln(_)

	p("test string")

end