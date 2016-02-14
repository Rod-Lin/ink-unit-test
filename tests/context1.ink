$test_begin = fn (out) do
/**
 * TEST: context1.ink
 *
 * Contents:
 *   1. Context and scope
 *
 * Testing Types: Function
 */

	$function.reconstruct = fn (context) {
		context::(fn (exps) { exps.rebuild() })(base.exp().to_array())
		// rebuild in the dest context
	}

	let test_func = fn (func) {
		let a = "this is a"
		let b = "this is b"
		func.reconstruct(fn(){} /* capture current context */)();
	}

	let a = "wrong!!"
	test_func() {
		out.putln(a)
		out.putln(b)
	}

	delete $function.reconstruct
	out.putln($function.reconstruct == undefined)

end