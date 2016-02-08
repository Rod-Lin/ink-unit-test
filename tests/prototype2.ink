$test_begin = fn (out) do
/**
 * TEST: prototype2.ink
 *
 * Contents:
 *   1. Prototype chain test
 *
 * Testing Types: Object
 */

$object.prototype = {
	type: fn () {
		typename(base)
	},
	prototype: undefined
}

out.putln([].type());

a = [1]

fn () {
	let c = "impossible"
	a[0] -> c
	0
} ()

out.putln(a[0]);

out.putln(null.type())

end