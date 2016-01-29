if (_GENERAL_INK_) { retn }
_GENERAL_INK_ = 1

for = inl (init, &cond, &iterate, block) {
	block.'continue' = iterate;
	while (cond()) {
		block();
		iterate();
	}
}

max = fn (args...) {
	for (let i = 1 && let max = args[0],
		 i < args.size(), i = i + 1) {
		if (args[i] > max) { max = args[i]; }
	}
	max;
}

namespace = {
	missing: fn (name) {
		top[name] = fn () { fn () {} } ()
	}
}

using = {
	missing: fn (name) {
		top[name]::(let each { | key, value |
			if (key != "this" && key != "base" && key != "let" && key != "each") {
				p(key)
				top[key] = value
			}
		})
		null
	}
}

$string.times = fn (count) {
	let ret = ""
	for (let i = 0, i < count, i++) {
		ret = ret + base
	}
	ret
}