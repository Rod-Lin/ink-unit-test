$test_begin = fn (out) do
/**
 * TEST: bond1.ink
 *
 * Contents:
 *   1. Bond safety
 *
 * Testing Types: Object
 */

// retn

let $no_proto_object = clone $object
delete $no_proto_object.prototype

let plugin = {
	type: fn () {
		typename(base)
	},
	prototype: $no_proto_object
}

$object.prototype -> plugin

out.putln([].type());

a = [1]

try {
	fn () {
		let c = fn(){}
		a[0] -> c
		0
	} ()
} catch { | e |
	out.putln(e.msg);
	//0
}

out.putln(a[0]);

out.putln(null.type())

let plug_to = {
	type: fn () {
		"hacked"
	},
	prototype: $no_proto_object
}

plugin -> plug_to

out.putln(null.type())

!!plugin

plugin.type = fn () {
	"back"
}

out.putln(null.type())

!!$object.prototype

end