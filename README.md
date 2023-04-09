<!-- GETTING STARTED -->
## Test

To run test suite: 
```
ruby main.rb
```

## Comments

Improved solution:
- Simple In memory DB.
- System class using singleton to hold application state
- helper classes: Parser, Solution
- Used Factory to decoupled 
- Used dependency injection for easy testability
- Repository pattern (Store)
- Decoupled elements as much as possible. Every component knows as little as possible
- Focused on scalability and robust design
- First solution draft: d72dbb7008062aa31639a769c0d795cf25567105


# Time and Space Complexity of First Draft

	The solution has complexity O(NlogN).
	Explaination:
		1 - n.split('\n').each_with_object({}).with_index = this loop takes N operations to complete
				and there aren't any costly operation in each iteration.
		2 -
			If we assume C the amount of cities and P, an even distribution of photos per city so that C*P = N.
			We previously create the array that holds the solution with capacity input.size so insertions are O(1)
			.each_with_object(Array.new(input.size)) do |(city, value), solution| => C operations
					value[:photos].sort_by! { |photo| photo[:time] } =>  O(PlogP)
					.each_with_object(solution).with_index do |(photo, solution), index| => P operations
						solution[photo[:order]] = "%s%0#{value[:count].digits.count}d.%s" % [city, index + 1, photo[:ext]] => 1
					end
				end

				N operations + C*(O(P*logP) + P) operations = N + C*O(P*logP) + C*P.
				= O(N) + O(C*P*logP) + O(N) = max { O(N), O(C*P*logP), O(N) } = O(NlogP) <= O(NlogN). (1)

				(1) Because P <= N by definition we have that logP <= logN so we found an upper bound.

	The solution has space complexity O()
				1 - input = n.split('\n') = this creates a new array of size N
				2 - input.each_with_object({}) = this will create a hash that is going to hold N elements in total (C cities and P photos)
				3 - each_with_object(Array.new(input.size)) = this will create a new array of size N (Once)
				4 - value[:photos].sort_by! { |photo| photo[:time] } = quicksort is O(number of elements)= O(P) (functions call in call stack)

				N + N + N + C*P = 4*N = O(4N) = O(N)
