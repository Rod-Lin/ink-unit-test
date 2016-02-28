$test_begin = fn (out) do
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

	let g = 4.99e10
	let h = numval("2e0.5")
	let i = 4E-10
	let j = 5e+10

	let k = 0b101010101
	let l = 0b01010101
	let m = 0b010101010
	let n = 0b00000000

	let res = new Array();

	res.push (a + b)
	res.push (a - b)
	res.push (a * b)
	res.push (a / b)
	res.push (a % b)
	res.push (-a)
	res.push (-b)

	res.push (-1 << 1)
	res.push (-1 >> 1)
	res.push (-1 << 4)
	res.push (100 >> 5)
	res.push (100 << 5)

	res.push (g)
	res.push (h)
	res.push (i)
	res.push (j)

	res.push (k | l)
	res.push (k | m)
	res.push (k & l)
	res.push (k & n)
	res.push (k ^ m)
	res.push (k ^ n)

	res.push (c.ceil())
	res.push (d.floor())
	res.push (e.round())
	res.push (f.round())

	let i = 1
	res.each do | v |
		out.puts("res" + i + ": " + v + "\n")
		i++
	end
end