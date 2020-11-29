using Plots
using DataFrames
using CSV

oilSpills = CSV.read("C://Users/GMKRG/Desktop/julia_test/data/oilspills.csv", DataFrame) #opens and reads a csv file
typeof(oilSpills) #gets the type of the csv file
CSV.size(oilSpills) #gets the size of the csv file
names(oilSpills) #gets the names of the columns of the csv
describe(oilSpills)# gets a description of the csv
first(oilSpills, 10) # gets the specified number of first rows of the csv
last(oilSpills, 10) # gets the specified number of last rows of the csv
oilSpills[:, 1:3] # all rows from columns 1 to 3
oilSpills[1:3, 1:4] #rows 1 to 3 for columns 1 to 4
oilSpills[1:5, :] #rows 1 to 5 for all columns

#different types of plots that can be instantiated by themeselves
#or together combined in a plot with layout parameters

plot() #creates an empty plot
x = 1:15; y = rand(15)
plot(x,y) #creates a plot with the specified values
z = rand(15)
plot!(x,z) #adds a dataset to the plot

#or add a dataset to the plot like thise 
p = plot(x, y)
plot!(p, x, z)

#a plot with custom title and label for the dataset
#more than one labels can be passed, one for each dataset
#in an array e.g ["Line chart 1", "Line chart 2"]
plot(x, y, title="A basic plot", label="Line chart 1")

#plot with specific to axis labels
plot(x, y, xlabel="x axis label", ylabel="y axis label")


#creation of dashboard like plot
p1 = histogram(oilSpills.P_TPT)
p2 = scatter(oilSpills.P_TPT)
p3 = bar(oilSpills.P_TPT)
p4 = pie(oilSpills.P_TPT)
p5 = plot(oilSpills.P_TPT)
p6 = heatmap(oilSpills.P_TPT)
plot(p1, p2, p3, p4,p5, p6, layout =(2,3), legend = false)


#creation of stacked charts
m = rand(15, 4) #4 datasets of random values up to 15
plot(x, m, layout=(4,1)) #stack the plots in 4 rows and 1 column