module 0x42::SocialNetwork{
	use std::vector;

	const CONTRACT:address = @0x42;


	struct Friends has store, key, drop {
		people: vector<Person>
	}

	struct Person has store, key, drop, copy {
		name: vector<u8>,
		age: u8,
		income: u64,
	}

	public fun create_friend(myFriend: Person, friends: &mut Friends):Person {
		let newFriend = Person { 
			name: myFriend.name,
			age: myFriend.age,
			income: myFriend.income,
		};

		add_friend(newFriend, friends);
		return newFriend 
	}

	public fun add_friend(_person: Person, friends: &mut Friends) {
		vector::push_back(&mut friends.people, _person);
    }

	public fun increase_income(person: &mut Person, bonus: u64):&mut Person {
		person.income = person.income + bonus;
		return person
	}

	public fun decrease_income(person: &mut Person, penalty: u64):&mut Person {
		person.income = person.income - penalty;
		return person
	}

	public fun multiply_income(person: &mut Person, factor: u64):&mut Person {
		person.income = person.income * factor;
		return person
	}

	public fun divide_income(person: &mut Person, divisor: u64):&mut Person {
		person.income = person.income / divisor;
		return person
	}

	public fun is_person_age_even(person: &Person):bool {
		let isEven: bool;

		if (person.age % 2 == 0) {
			isEven = true;
		} else {
			isEven = false;
		};

		return isEven
	}

    #[test]
	fun test_create_friend() {

		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);
		assert!(createdFriend.name == richard.name, 0);
	}

	#[test]
	fun test_increase_income() {
		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);

		let increasedFriend = increase_income(&mut createdFriend, 100);
		assert!(increasedFriend.income == 200, 0);
	}

	#[test]
	fun test_decrease_income() {
		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);

		let decreasedFriend = decrease_income(&mut createdFriend, 50);
		assert!(decreasedFriend.income == 50, 0);
	}

	#[test]
	fun test_multiply_income() {
		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);

		let multipliedFriend = multiply_income(&mut createdFriend, 2);
		assert!(multipliedFriend.income == 200, 0);
	}

	#[test]
	fun test_divide_income() {
		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);

		let dividedFriend = divide_income(&mut createdFriend, 2);
		assert!(dividedFriend.income == 50, 0);
	}

	#[test]
	fun test_is_person_age_even() {
		let richard = Person {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let friends = Friends {
			people: (vector[richard]),
		};

		let createdFriend = create_friend(richard, &mut friends);

		let isEven = is_person_age_even(&createdFriend);
		assert!(isEven == false, 0);
	}
}
