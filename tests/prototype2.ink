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

a = []
b = 10

out.putln(null.type())

end