module 0x42::SocialNetwork{

	use std::vector;

	struct Friends has key {
		people: vector<Person>
	}

	struct Person has store, drop, copy {
		name: vector<u8>,
		age: u8 
	}

	public fun create_person(_name: vector<u8>, _age: u8): Person {
		let person = Person { 
			name: _name,
			age: _age,
		};

		return person
	}

	public fun add_friend(friends: &mut Friends, _person: Person) {
		vector::push_back(&mut friends.people, _person);
    }

	public fun get_friends(): vector<Person> acquires Friends{
        borrow_global_mut<Friends>(@0x42).people
	}

    #[test]
    fun test_create() {
		let person = create_person(b"Ricard\n", 31);
		assert!(create_person(b"Ricard\n", 31) == person, 0);
    }

	fun test_add_friend(){
	}
}
