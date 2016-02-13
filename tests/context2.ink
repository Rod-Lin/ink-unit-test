$test_begin = fn (out) do
/**
 * TEST: context2.ink
 *
 * Contents:
 *   1. Context and scope
 *
 * Testing Types: Function
 */

	let getter("here", macro () { fn () {} })

	$function.to_context = fn (context) {
		context::(fn (exps) { exps.rebuild() })(base.exp().to_array())
		// rebuild in the dest context
	}

	$function.to_flat = fn () {
		base.exp().to_array()[0]
	}

	@ = fn (&params...) {
		{
			`->`: fn (&body) {
				fn (args...) { // call
					let var = { }
					let int = { }
					let float = { }
					let big = { }
					let string = { }

					let context = here
					for (let i = 0, i < params.size(), i++) {
						if (i < args.size()) {
							params[i].to_flat()() = args[i]
						} else {
							params[i].to_flat()() = undefined
						}
					}
					dest = let
					// debug(var.data)
					var.each { | key, value |
						dest[key] = value
					}

					int.each { | key, value |
						dest[key] = if (typename(value) == "string") {
							numval(value).floor();
						} else if (typename(value) == "numeric") {
							value.floor();
						} else {
							0
						}
					}

					float.each { | key, value |
						dest[key] = if (typename(value) == "string") {
							numval(value);
						} else if (typename(value) == "numeric") {
							value
						} else {
							0
						}
					}

					big.each { | key, value |
						dest[key] = if (typename(value) == "string" ||
										typename(value) == "numeric") {
							bignum(value)
						} else {
							bignum(0)
						}
					}

					string.each { | key, value |
						dest[key] = if (value && typename(value.to_str) == "function") {
							value.to_str()
						} else {
							"(cannot cast " + typename(value) + " to string)"
						}
					}

					body.to_context(context)();
				}
			}
		}
	}

	f1 = @(int a, float b) -> a + b * b
	f2 = @(string str) -> str
	f3 = @(int n) -> (
		if (n < 2) {
			retn 1
		},
		retn f3(n - 1) + f3(n - 2)
	)

	out.putln(f1("1.2", 2.2))
	out.putln(f2(undefined))
	out.putln(f3(10))

end