module 0x48::Move{
	use std::vector;
	use std::debug;

	struct Flexi<T1, T2> has copy, drop {
		x: T1,
		y: vector<T2>,
	}

	fun generic_func<HelloType>(t: HelloType): HelloType {
		return t
	}

	fun new_flexi(_x: u8, _y: vector<u8>): Flexi<u8, u8> {
		return Flexi{
			x: _x,
			y: _y,
		}
	}

	fun new_vector_stuff<T>(arg: T): vector<T> {
		let v = vector::empty<T>();
		vector::push_back(&mut v, arg);
		v
	}

	#[test]
	fun test_generic_func() {
		let a = 1;
		let b = generic_func(a);
		assert!(a == b, 0);
	}

	#[test]
	fun test_new_flexi() {
		let y = vector<u8>[1,2];

		let a_flexi = Flexi{
			x: 1,
			y: y,
		};

		let a = new_flexi(1, y);
		assert!(a.x == a_flexi.x, 0);
	}

	#[test]
	fun test_new_vector_stuff() {
		let element = b"hello";
		let vec = new_vector_stuff(element);
		debug::print(&vec);
	}
}
