$test_begin = fn (out) {
/**
 * TEST: numeric1.ink
 *
 * Contents:
 *   1. Basic operators like +, -, *, /, %, etc.
 *   2. ceil, floor, round method
 *
 * Testing Types: Numeric
 */

	let a = 20.123
	let b = -10.234

	let c = 2.3
	let d = 4.5
	let e = 4.50001
	let f = 4.49999

	let res = new Array();

	res.push (a + b)
	res.push (a - b)
	res.push (a * b)
	res.push (a / b)
	res.push (a % b)
	res.push (-a)
	res.push (-b)

	res.push (c.ceil())
	res.push (d.floor())
	res.push (e.round())
	res.push (f.round())

	let i = 1
	res.each { | v |
		out.puts("res" + i + ": " + v + "\n")
		i++
	}
}