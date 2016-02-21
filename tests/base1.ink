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

$object.if = fn (cond, else, arg) {
	if (cond) {
		base
	} else if (else == "else" && typename(arg) == "array") {
		arg[-1]
	}
}

out.putln("NO!!!" if(0) else ("nop"))

delete $object.if

end