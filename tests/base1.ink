$test_begin = fn (out) do
/**
 * TEST: base1.ink
 *
 * Contents:
 *   1. Base
 *
 * Testing Types: Object
 */

func = fn () {
	out.putln(base);
}

a = "right"
b = "no!!!"

a.c = func
b.c = func

a.c(b.c)

end