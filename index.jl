name = "George"
initial = 'M'
age = 29
height = 1.75

#String concatenation with string()
println(string("My name is ", name, " ", initial, " and i am ", age, " years old"))

#or with string multiplication and template literals
sentence1 = "My name is $name $initial "
sentence2 = "and i am $age years old."
println(sentence1*sentence2)

#quatation escape
sentence3 = """I said, "hello" """
println(sentence3)


# typeof will return the infered type of a variable
println(typeof(name))
println(typeof(initial))
println(typeof(age))
println(typeof(height))


# dictionaries, tuples, arrays
## dictionaries => unordered
## tuples, arrays => ordreded
## tuples => immutable

#intialize dictionary
dictionary = Dict("George" => "123456", "x" => "789456")
#add value to the dictionary
dictionary["newEntry"] = "159753"
#print dictionary
println(dictionary)
#grab a value of the dictionary by key
println(dictionary["George"])
#remove a value from a dictionary by key
pop!(dictionary, "x")


#initialize tuple => Julia is 1 indexed and not 0 indexed
tuple1 = ("1", "2", "3")
print(tuple1);

#arrays are mutable and ordreded
array1 = ["1", "2", "3", "4", "5"]
println(array1)
#an array with mixed types is of type Any
array1[1] = "0"
println(array1);
push!(array1, "7") #at the end
pop!(array1) #remove the previously inserted 7 and return it 

#multidimensional arrays 
#can contain any data structure and not only arrays
#can be of various length
matrix = [ ["0", "1", "2"], ["3", "4", "5"], ["6", "7"] ]
#alternative of creating a matrix with rand()
matrix2 = rand(4,3) # 4 by 3 filled with random values from 0 to 1
matrix3 = rand(4,3,2) # 4 by 3 by 2 filled with random values from 0 to 1


#loops
#while
n = 0
while n < 10
    n += 1
end

# or
m = 1
while m <= length(array1) 
    m += 1
end


#for normal
for i in 1:length(array1)
    println(array1[i])
end

#or with in
for num in array1
    println(num)
end

#or with =
for i = 1:length(array1)
    println(array1[i])
end

#or with /in
for n ∈ 1:10
    println(10)
end


#initialize a 5 by 5 matrix full with zeros
x, y = 5, 5
A = zeros(x, y)

#iterating a matrix normally
for i in 1:x
    for k in 1:y
        A[i][k] = i + k
    end
end


#or shorthand
for i in 1:x, k in 1:y
    A[i][k] = i + k
end

#or even shorter with array comprehension (Julia recommended)
 C = [i+j for i in 1:x, k in 1:y]


 #or array comprehension embedded in a for loops
 #use of display() for the matrix
 for n in 1:10
    D = [i + j for i in 1:n, k in 1:n]
    display(A)
 end


 #conditionals