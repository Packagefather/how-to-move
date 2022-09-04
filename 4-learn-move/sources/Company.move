module 0x42::Company{
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

	struct Info {
		company_name: vector<u8>,
		owns: vector<u8>,
	}

	public fun get_info():Info {
		let	sisterCompanyName = 0x42::SisterCompany::get_company_name();

		let info = Info {
			company_name: b"the company",
			owns: sisterCompanyName,
		};

		return info
	}

	public fun create_employee(_name: vector<u8>, _age: u8, _income: u64):Person {
		let person = Person { 
			name: _name,
			age: _age,
			income: _income,
		};

		return person 
	}

	public fun secret_of_the_universe():u8 {
		return plus_two(40)
	}

	fun plus_two(input: u8): u8 {
		input + 2
	}

	fun add_employee(_person: Person, employees: &mut Friends) {
		vector::push_back(&mut employees.people, _person);
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
	fun test_secret_of_the_universe() {
		let secret = secret_of_the_universe();
		assert!(secret == 4, 0);
	}


}
