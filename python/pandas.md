# Import
```
F = pd.read_csv("./SOURCE_DATA/FLUID_VALUES.csv")
```

# Create DataFrame
```
df = pd.DataFrame({"y":np.arange(1,11),"x":[0,1,0,0,0,1,1,2,2,1]})
```

# View properties
```
F.columns #(varnames)
F.index   #(rownames)
```
# Access

## get a column
```
F.fluidFlag
F['fluidFlag']   # same as above?
df2.loc[: , "2005"] # gives a series
df2["2005"]         # same as above
df2[["2004","2005"]] # get multiple columns
```

## get a value
```
F['fluidFlag'][2]
```

## set row names (index names) 
```
df2 = df1.set_index("State", drop = False)  # drop = False prevents it from being deleted later if you change the index again

df2.loc[startrow:endrow, startcolumn:endcolumn]  #subset of df
df2.loc["Alaska":"Arkansas","2005":"2007"] #example of the above
```
https://pythonhow.com/accessing-dataframe-columns-rows-and-cells/


# GROUPING

## case 1
```
df = pd.DataFrame({"y":np.arange(1,11),"x":[0,1,0,0,0,1,1,2,2,1]})
df.groupby(by='x').sum()                             # or...
pd.pivot_table(df,values='y',index='x',aggfunc=sum)

#   # FROM:
#      x   y
#   0  0   1
#   1  1   2
#   2  0   3
#   3  0   4
#   4  0   5
#   5  1   6
#   ...
#   
#   TO:
#       y
#   x    
#   0  13
#   1  25
#   2  17
```

## case 2:
```
df[['x','y']].groupby(by='x').sum()
pd.pivot_table(df,values='y',index='x',aggfunc=sum)
```

# Multiple functions:
```
pd.pivot_table(H,index='alicatHeliumReading',aggfunc=(np.mean,np.std))  # EQUIVALENT of MATLAB accumanddofun
```

# Chaining
```
dfmi['one']['second']          # chained: don't do that
dfmi.loc[:,('one','second')]   # much better, apparently
```

# Operating on some column's rows
```
mask = T.fluidFlag==2
T.loc[mask, 'Qstp'] = T.loc[mask, 'Qstp'].map(correctorfunction)      # YES, GOOD
T[mask, 'Qstp'] = T[mask, 'Qstp'].map(correctorfunction)              #NO, DOESNT WORK
```

# Merging

## merge on range
```
s = pd.IntervalIndex.from_arrays(dfb.lowerbound_ip_address, dfb.upperbound_ip_address, 'both')
dfa.assign(country=dfb.set_index(s).loc[dfa.ip_address].country.values)
```
https://stackoverflow.com/questions/46179362/fastest-way-to-merge-pandas-dataframe-on-ranges
