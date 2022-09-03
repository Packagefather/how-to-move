module 0x48::Move {
	use std::debug;

	fun plus_two(n: u64):u64 {
		let sum = 0;
		let i = 1;

		while (i <= n) {
			sum = sum + i;
			i = i + 2;  
		};
		debug::print(&sum);
		sum
	}

	fun loop_forever() {
		while(true) {
			debug::print(&b"looping forever");
		}
	}

	fun break_seven() {
		let i = 0;

		while (i < 10) {
			if (i == 7) {
				debug::print(&i);
				break
			};
			debug::print(&i);
			i = i + 1;
		}
	}

	fun continue_six() {
		let i = 0;

		while (i < 10) {
			if (i == 6) {
				debug::print(&i);
				i = i + 1;
				continue
			};
			debug::print(&i);
			i = i + 2;
		}
			
	}

	#[test]
	fun test_plus_two() {
		plus_two(10);
	}

	fun test_loop_forever() {
		loop_forever();
	}

	#[test]
	fun test_break_seven() {
		break_seven();
	}

	#[test]
	fun test_continue_six() {
		continue_six();
	}
}
