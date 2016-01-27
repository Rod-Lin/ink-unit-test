if (_GENERAL_I_) { retn }
_GENERAL_I_ = 1

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
		ret = top[name] = fn () { }
		delete name
		ret
	}
}

using = {
	missing: fn (name) {
		top this[name]::(let each { | key, value |
			top[key] = value
		})
		null
	}
}