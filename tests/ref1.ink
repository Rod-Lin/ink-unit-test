$test_begin = fn (out) do
/**
 * TEST: ref1.ink
 *
 * Contents:
 *   1. reference parameters
 *
 * Testing Types: Function
 */

let f1 = fn (&a) {
	a() = "yes"
}

delete let abcd
f1(let abcd)
out.putln(abcd)

let $ = fn (&lvals...) {
	{
		`=`: fn (rval) {
			for (let i = 0, i < rval.size(), i++) {
				if (i < lvals.size()) {
					lvals[i]() = rval[i];
				}
			}
		}
	}
}

a = 0
b = 0
c = 0

$(let a, b, let.c) = ["first", "second", "third"]

out.putln("a = " + a);
out.putln("b = " + b);
out.putln("c = " + c);


a = "second after reverse"
b = "first after reverse"

$(let a, let b) = [b, a]

out.putln("a = " + a);
out.putln("b = " + b);

end