module 0x42::Move{

	fun lots_of_things(): (u8, vector<u8>, bool) {
		let x = 0;
		let name = b"Richard";
		let truthy = true;
		(x, name, truthy)
	}

	fun must_be_odd(num: u8): bool {
		assert!(num % 2 == 1, 88);
		return true
	}
	
	#[test]
	fun test_tuple(){
		let (x, name, truthy) = lots_of_things();
		assert!(x == 0, 0);
		assert!(name == b"Richard", 0);
		assert!(truthy == true, 0);
	}

	#[test]
	fun test_abort() {
		let x = must_be_odd(1);
		assert!(x == true, 0);
	}

	#[test]
	fun test_any_type(){
		let x = any_type();
		assert!(x == 69, 0);
	}
}
