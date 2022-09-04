module 0x48::Move {
	struct Currency1 {}
	struct Currency2{}

	//A generic coin type that can be instantiated using a
	//currency specifiier type
	// e.g. Coin<Currency1>, Coin<Currency2> etc.
	struct Coin<phantom Currency> has store, drop {
		value: u64,
	}

	//generic code for all currencies
	public fun mint_generic<Currency>(value: u64):Coin<Currency> {
		Coin { value }
	}

	//code for one specific currency 
	public fun mint_concrete(value: u64):Coin<Currency1>{
		Coin { value }
	}

	#[test]
	fun test_mint_generic() {
		let coin = mint_generic<Currency1>(10);
		assert!(coin.value == 10, 0);
	}
}
