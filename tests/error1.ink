$test_begin = fn (out) do
/**
 * TEST: error1.ink
 *
 * Contents:
 *   1. Error and exception
 *
 * Testing Types: All
 */

	let error_func = fn () {
		let a.b.c.d.e.f.g = 10;
	}

	let a = "origin"

	try {
		a = error_func();
	} catch { | err_msg |
		out.putln("Error Message: " + err_msg.msg);
		out.putln("a = " + a);
		error_func = fn () { "right!!!" }
		retry
	} final {
		out.putln("finally!!");
		out.putln("a = " + a);
	}

end