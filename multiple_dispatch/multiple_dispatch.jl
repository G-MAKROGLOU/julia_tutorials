#import the plus (+) operator in order to define a new functionality for it. e.g. to concatenate
import Base: + 
+(x::String, y::String) = string(x, y)

@which 3 + 3 # returns the types of the involved members as T
@which 3.0 + 3.0 # returns the types of the involved members as Float64
@which 3.0 + 3 # returns the types of the involved members as Number
@which "hello" + "world"

println("Hello " + "world") # now + can be used for concatenation as well

#almost like java's method overloading but faster, shorter and more efficient
foo(x,y) = println("Duck-typed foo!")
foo(x::Int, y::Float64) = println("foo with an integer and a float")
foo(x::Float64, y::Float64) = println("foo with two floats")
foo(x::Int, y::Int) = println("foo with two integers")

foo(true, false) #call to duck typed foo that has no specific typed parameters
foo(1, 1.0) #call to int-float foo
foo(1.0, 1.0) #call to float-float foo
foo(1,1) #call to int-int foo