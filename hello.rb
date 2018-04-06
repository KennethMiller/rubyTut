a = 5
a = "Dog"


a.respond_to? :each_char


a.each_char {|lett| puts lett}

a = [1,2,3,"Dog", :cats]

a = {a: 5, b: 6, c: "dog" }
a[:b] 
	