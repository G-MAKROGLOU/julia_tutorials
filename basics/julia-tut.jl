using Printf
using Statistics

# the double colon operator is used to assert a type
# of a variable but then the asserted variable cannot be
# changed to another type. The following function will err when invoked.

function changeNum()
    x::Int8 = 10 
    x = "Dog"
end
#changeNum()


#= Julia data types
Int8 Int16 Int32 Int64
Float32, Float64, UInt8, UInt16 etc.

Float additions are accurate by 14 digits
BigFloat, BigInt increase precision
=#


#casting
c2 = Char(120) #creates a char based on the utf code passed in Char()
println(c2)

i1 = UInt8(trunc(3.14)) #truncates the float to the closest int
println(i1)

f1 = parse(Float64, "1") #parses string to float
println(f1)

i2 = parse(Int8, "1") #parses string to int
println(i2);


#string parsing and concatenation
s1 = "Some random string"
println(length(s1))
println(s1[1])
println(s1[end])
println(s1[1:4])
s2 = string("another", "string")
println(s2)
println("one" * "more")
i3 = 2
i4 = 3
println("$i3 + $i4 = $(i3+i4)");

s3 = """multi
        line
        string"""

println(s3)
println(s1 == s3)
println(s1 < s3)
println(s1 > s3)
println(s1 != s3)
println(findfirst(isequal('o'), "George"))
println(occursin("key", "monkey"))


#conditionals
# > < >= <= == !=
# && || !
age = 12
if age >= 5 && age >= 6
    println("You are in kindergarten")
elseif age >= 7 && age <= 13
    println("You are in middleschool")
elseif age >= 14 && age <= 18
    println("You are in high school")
else
    println("stay home")
end

@printf("true || false = %s\n", true || false ? "true" : "false")
@printf("!true = %s\n", !true ? "true" : "false")


#looping
i = 1
#the global keyword
while i < 20
    if i % 2 == 0
        println("$i is an even number")
        global i += 1 #the global keyword is to process global variables correctly
        continue
    end
    global i += 1
    if i >= 10
        break
    end
end


#defining the step in for loops
for i = 0:2:10
    println(i)
end


#creating arrays
a1 = zeros(Int32, 2, 2) # 2 by 2 array full of zeros with a type of Int32
a2 = Array{Int32}(undef, 5) #single dimension array with undefined values, 5 spaces, of type Int32
a3 = Float64[] #empty array of Float64
a4 = [1,2,3,4] #direct creation of array
println(a4[1])
println(a4[end])
println(5 in a4)
println(findfirst(isequal(2), a4))
f(a) = (a >= 2) ? true : false # generic filtering function that can be passed in array methods like count and findall
println(findall(f, a4)) #finds all elements that satisfy our filter function in the given array
println(count(f, a4)) #returns the count of elements that satisfy our filter function in the given array
println(size(a4))
println(length(a4))
println(sum(a4))
splice!(a4, 2:1, [8,9]) #insert values at a specific index 2:1 starting at 2 
splice!(a4, 2:3) #remove elements from the array at the specified index
println(maximum(a4))
println(minimum(a4))
println(a4 * 2) #multiply all elements in the array with 2
a5 = [1, 3.14, "Hi"] # store different types of values in the same array
a6 = [sin, cos, tan] # store functions in an array
for n in a6
    println(n(0)) #apply all functions in that array to a variable
end

a7 = [[1,2,3], [4,5,6]] #multi dimensional array
for n = 1:2, m = 1:3
    @printf("%d", a7[n,m]) #access values of a matrix
end
println(a7[:, 2]) #get every row in the second column
println(a7[2, :]) #get every column in the second row
a8 = collect(1:5) #create array from a range
a9 = collect(2:2:10) # create array from range with a step
a10 = collect(4:-1:1) #create array from range with step backwards
for n in a9 println(n) end #for loop in one line
a11 = [n^2 for n in 1:5] # array comprehension
push!(a11, 36) #add element to an array
a11 = [n*m for n in 1:5, m in 1:5] #matrix with array comprehension
a12 = rand(0:9, 5, 5) #create a 5 by 5 matrix with random values from 0 to 9

#tuples
t1 = (1,2,3,4)
println(t1)
println(t1[1])
for i in t1 println(i) end
t2 = ((1,2), (3,4)) # multi dimensional tuple
println(t2[1][1])# access a tuple
t3 = (george = ("George", 1000), x = ("x", 5000)) # creation of named tuples
println(t3.george)


#dictionaries
d1 = Dict("pi" => 3.14, "e" => 2.718)
println(d1["pi"])
d1["golden"] = 1.618
delete!(d1, "pi")
println(haskey(d1, "pi"))
println(in("pi" => 3.14))
println(keys(d1))
println(values(d1))

for kv in d1
    println(kv)
end

for (key, value) in d1
    println(key, " : ", value)
end


#sets
st1 = Set(["George", "Y", "X"])
println(st1)
push!(st1, "Z")
println(in("F", st1))
st2 = Set(["A", "B"])
println(union(st1, st2)) # combine two sets
println(intersect(st1, st2)) # find every item that is in both sets
println(setdiff(st1, st2)) # find sets that are in one set but in the other


#functions

#single expression function
getSum(x, y) = x + y
x,y = 1,2
@printf("%d + %d = %d\n", x, y, getSum(x,y))

#multi expression function with parameter that has a default value
function canIVote(age=16)
    if age > 18 
        println("Yes")
    else 
        println("No")
    end
end
canIVote(29)

#multi expression function parameters are passed by value
v1 = 5
function changeV1(v1)
    v1 = 10
end
changeV1(v1)
println(v1) #v1 is still 5

function changeV1_2()
    global v1 = 10
end
changeV1_2()
println(v1) #v1 is now 10


# create a function that accepts an unknown number of parameters
function getSum2(args...)
    sum = 0
    for a in args
        sum += a
    end
    println(sum)
end
getSum2(1,2,3)
getSum2(1,2,3,4,5,6)


#create a function and return multiple different values
function next2(val)
    return (val + 1, val + 2)
end
println(next2(4)) #returns (5, 6)

#create function that returns a function
function makeMultiplier(num)
    return function(x) return x * num end
end

mutl3 = makeMultiplier(3)
println(mult3(6)) #returns 18

#create a function that handles different types of arguments
function getSum3(num1::Number, num2::Number)
    return num1 + num2
end

function getSum3(num1::String, num2::String)
    return parse(Int32,num1) + parse(Int32, num2)
end


#anonymous functions
v2 = map(x -> x * x, [1,2,3]) # similar to the js map function
println(v2)

v3 = map((x,y) -> x + y, [1,2], [3,4])

# reduce uses a function multiple times until it gets to one single result
v4 = reduce(+, 1:100)
println(v4)

sentence = "This is a string"
sArray = split(sentence)
longest = reduce((x,y) -> length(x) > length(y) ? x : y, sArray)
println(longest)


#mathematical functions and operations
println(4 + 5)
println(4 - 5)
println(4 * 5)
println(4 / 5)
println(4 % 5)
println(4 ^ 5)

println( round(3.5) )
println( floor(3.5) )
println( ceil(3.5) )
println( abs(-3.5) ) # absolute value
println( sqrt(100) ) #square root
println( cbrt(100) ) # cube root
println( hypot(90,90) ) # hypotenus
println( exp(2) )
println( log(100) )
println( log2(100) )
println( log10(100) )

#trigonometry
sin(10)
cons(10)
tan(10)
cot(10)
sec(10)
csc(10)
sinh(10)
cosh(10)
tanh(10)
coth(10)
sech(10)
csch(10)
asin(10)
acos(10)
atan(10)
acot(10)
asec(10)
acsc(10)
asinh(10)
acosh(10)
atanh(10)
acoth(10)
asech(10)
acsch(10)
sinc(10)
cosc(10)
# and much more

# we can imply moltiplication
z = 5
println(2x)

#multiply all elements in an array by 3 with the dot operator
a15 = [1,2,3]
prinltn(a15 .* 3)


#enumerated types
@enum Color begin
    red = 1
    blue = 2
    green = 4
end
favColor = green::Color
println(favColor)


#symbols - immutable strings that represent variable as a data 
:George
println(:George)

#symbols are commonly used as keys in dictionaries
d9 = Dict(:George => 29, :x => 25, :y => 23)
pritnln(d9[:x])


#structs
# structs are immutable by default
struct Customer
    name::String
    balance::Float32
    id::Int
end

customer1 = Customer("George Makroglou", 1050, 123)
println(customer1.name)


# a struct can be mutable if it is declared with the mutable keyword
mutable struct Pet
    type::String
    name::String
end

pet1 = Pet("Dog", "MyDog")
println(pet1.name)
pet1.name = "Paco"
println(pet1.name)


#abstract types
#Abstract types are just the blue print of a struct.
#We can create multiple different structs each one
#with different properties, all deriving from the same
#abstract type. It's like abstract types are Julia's way
#of inheritance
abstract type Animal end

struct Dog <: Animal
    name::String
    bark::String
end

struct Cat <: Animal
    name::String
    meow::String
end

paco = Dog("Paco", "Ruff")
cat = Cat("a cat", "meow")
#we can create functions that use those derived structs as parameters
#and extract each structs properties.
function makeSound(animal::Dog)
    println("$(animal.name) says $(animal.bark)")
end

function makeSound(animal::Cat)
    println("$(animal.name) says $(animal.meow)")
end

makeSound(paco)
makeSound(cat)

#exception handling and user input
print("Enter a number")
num1 = chomp(readline()) # chomp gets rid of the new line \n at the end of readline()
print("Enter another number")
num2 = chomp(readline())

try 
    val = (parse(Int32, num1)) / (parse(Int32, num2))
    if(val == Inf)
        error("Can't divide by zero")
    else
        println(val)
    end
catch e
    println(e)
end


#file IO

#opens a file or creates it if does not exist
#and write to eat whatever we passed to write()
open("random2.txt", "w") do file
    write(file, "Here is some random text\nIt is great\n")
end

#opens a file and assigns its' content to the data variable
#with the use of read() and prints all the content at once
open("random2.txt") do file
    data = read(file, String)
    println(data)
end

#opens a file and prints the content one line at a time
# with the use of eachline()
open("random2.txt") do file
    for line in eachline(file)
        println(line)
    end
end



#macros
#macros generate code for us before a program is round

#this macro executes an expression exp n times
macro doMore(n, exp)
    quote #quote represents the begining and ending of the code block to be run
        for i = 1:$(esc(n)) #$(esc()) is goind to hide everything until what it contains is ready to be executed
            $(esc(exp))
        end
    end
end
#to run the macro
@doMore(2, println("Hello"))


#this macro creates a custom do-while loop
macro doWhile(exp)
    @assert exp.head == :while
    esc(quote
        $(exp.args[2])
        $exp
end)    
end

p = 0
@doWhile while z < 10
    global p +=1
    println(p)
end



