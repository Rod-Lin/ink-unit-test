$test_begin = fn (out) do
/**
 * TEST: prototype1.ink
 *
 * Contents:
 *   1. Prototype chain test
 *
 * Testing Types: Object
 */

	let Ancestor = fn () {
		this.type = "Ancestor"
		this.say = fn () { "woof, woof woof" }

		this.ancestors = fn () {
			out.putln("This is type " + base.type)
			base.each { | key, value |
				out.putln("\tslot: " + key)
			}
			out.putln("\tsay: " + base.say())

			if (base.prototype.ancestors) {
				out.putln("")
				base.prototype.ancestors();
			}
		}
	}

	let TypeA = fn () {
		this.prototype = new Ancestor();
		this.type = "TypeA"
		this.say = fn () { "moo, moo moo" }

		this.a = "I'm a in TypeA"
		this.p = fn () {
			out.puts(base.a + "\n");
		}
	}

	let TypeB = fn () {
		this.prototype = new TypeA();
		this.type = "TypeB"
		this.say = fn () { "chuck, chuck chuck" }

		this.b = "I'm b in TypeB"
		this.p = fn () {
			out.puts(base.a + "\n");
		}
	}

	let a = new TypeB();
	a.p();
	a.ancestors()

end