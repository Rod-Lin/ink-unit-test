$test_begin = fn (out) do
/**
 * TEST: function1.ink
 *
 * Contents:
 *   1. Basic functions & closure context
 *
 * Testing Types: Function
 */

let f1 = fn (a, b, c) {
	out.putln(a + b + c)
}

f1("I'm ", "the ", "answer")

let f2 = fn (a) {
	let a = "correct"
	fn () {
		out.putln(a)
	}
}

let a = "wrong!!"
f2("wrong, too!!")()

// inline function

let f3 = fn () {
	this.a = "wrong!!"

	inl () {
		this.a = "It's"
		f4(this.a)
	} ()
}

let f4 = fn (&lhs) {
	lhs() = lhs() + " correct"
}

out.putln(f3())
out.putln(f3.a)

end