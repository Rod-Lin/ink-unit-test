if (_GENERAL_IK_) { retn }
_GENERAL_IK_ = 1

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
		ret = (top this)[name] = fn () { }
		delete name
		ret
	}
}