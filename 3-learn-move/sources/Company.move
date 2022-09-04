module 0x42::Company {
	use std::vector;

	const CONTRACT:address = @0x42;


	struct Employees has store, key, drop {
		people: vector<Employee>
	}

	struct Employee has store, key, drop, copy {
		name: vector<u8>,
		age: u8,
		income: u64,
	}

	public fun create_employee(myFriend: Employee, employees: &mut Employees):Employee {
		let newFriend = Employee { 
			name: myFriend.name,
			age: myFriend.age,
			income: myFriend.income,
		};

		add_employee(newFriend, employees); 
		return newFriend 
	}


	public fun add_employee(_employee: Employee) {
		vector::push_back(&mut employees.people, _employee);
    }

	public fun increase_income(employee: &mut Employee, bonus: u64):&mut Employee {
		employee.income = employee.income + bonus;
		return employee
	}

	public fun decrease_income(employee: &mut Employee, penalty: u64):&mut Employee {
		employee.income = employee.income - penalty;
		return employee
	}

	public fun multiply_income(employee: &mut Employee, factor: u64):&mut Employee {
		employee.income = employee.income * factor;
		return employee
	}

	public fun divide_income(employee: &mut Employee, divisor: u64):&mut Employee {
		employee.income = employee.income / divisor;
		return employee
	}

	public fun is_employee_age_even(employee: &Employee):bool {
		let isEven: bool;

		if (employee.age % 2 == 0) {
			isEven = true;
		} else {
			isEven = false;
		};

		return isEven
	}

    #[test]
	fun test_create_employee() {

		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);
		assert!(createdFriend.name == richard.name, 0);
	}

	#[test]
	fun test_increase_income() {
		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);

		let increasedFriend = increase_income(&mut createdFriend, 100);
		assert!(increasedFriend.income == 200, 0);
	}

	#[test]
	fun test_decrease_income() {
		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);

		let decreasedFriend = decrease_income(&mut createdFriend, 50);
		assert!(decreasedFriend.income == 50, 0);
	}

	#[test]
	fun test_multiply_income() {
		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);

		let multipliedFriend = multiply_income(&mut createdFriend, 2);
		assert!(multipliedFriend.income == 200, 0);
	}

	#[test]
	fun test_divide_income() {
		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);

		let dividedFriend = divide_income(&mut createdFriend, 2);
		assert!(dividedFriend.income == 50, 0);
	}

	#[test]
	fun test_is_employee_age_even() {
		let richard = Employee {
			name: b"Richard",
			age: 31,
			income: 100,
		};

		let employees = Employees {
			people: (vector[richard]),
		};

		let createdFriend = create_employee(richard, &mut employees);
		let isEven = is_employee_age_even(&createdFriend);
		assert!(isEven == false, 0);
	}

}
