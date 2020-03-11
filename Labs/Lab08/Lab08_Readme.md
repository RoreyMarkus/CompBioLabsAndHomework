1. Make a new markdown document explaining the script. This markdown document should also be in the directory for Lab08. This markdown document will be the metadata file that explains the script, the model it contains, what it does, and the specific data that were written to the data file. Use headings, bulleted lists, and other capabilities of markdown as you see fit. Make the document look good, easily readable, and functional.

# Lab 08 
## Purpose of this script
This script has a function I wrote that allows the user to insert different numbers in for the variables of the Discrete-Time Logistic Growth Equation
The function plots the output, with Time on the x-axis and Abundance on the y-axis. 

The variables involved in the function are:

     r = rate of growth  
     K = carrying capacity  
     Time(timeend) = total number of generations 
     Abundance(n) = initial abundance

## Information specific to "Markus_lab8" file.
In this specific case, the variables represented:

    r = 0.6 
    K = 5000
    timeend = 14 
    n = 2500
When this was plugged into growfunc, it was exported into the repository as Generation_Abundances.csv
growfunc also created a plot of the data.

