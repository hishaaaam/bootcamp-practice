import pandas as pd

df = pd.DataFrame({
    'A': [1, 2, None, 4],
    'B': [None, 2, 3, 4],
    'C': [1, None, None, 4]
})

# Detecting null values
print(df.isnull())

# Detecting null values in a specific column
print(df['A'].isnull())
     
# Detecting non-null values
print(df.notnull())

# Detecting non-null values in a specific column
print(df['A'].notnull())
     
# Drop rows with any null values
print(df.dropna())

# Drop columns with any null values
print(df.dropna(axis=1))

# Drop rows where all values are null
print(df.dropna(how='all'))
     
# Fill null values with a constant
print(df.fillna(0))

# Fill null values with the mean of the column
print(df.fillna(df.mean()))

# Fill null values forward (propagate last valid observation forward)
print(df.fillna(method='ffill'))

# Fill null values backward (propagate next valid observation backward)
print(df.fillna(method='bfill'))
     
# Replace null values with a specific value
print(df.replace(to_replace=None, value=0))

# Replace null values in a specific column
df['A'] = df['A'].replace(to_replace=None, value=100)
print(df)

# Replace null values with a different placeholder
print(df.replace(to_replace=None, value='Unknown'))
     
# Interpolate missing values using linear method
print(df.interpolate())

# Interpolate missing values using quadratic method
print(df.interpolate(method='quadratic'))

# Interpolate missing values using polynomial method
print(df.interpolate(method='polynomial', order=2))
     
# Check if any null values exist in the DataFrame
print(df.isnull().values.any())

# Check if any null values exist in a specific column
print(df['A'].isnull().values.any())
     
# Get the count of null values in each column
print(df.isnull().sum())

# Get the count of null values in a specific column
print(df['A'].isnull().sum())

# Get the total count of null values in the DataFrame
print(df.isnull().sum().sum())
     
import pandas as pd

data = {
    'Name': ['John', 'Anna', 'Peter', None, 'Linda'],
    'Age': [28, 24, None, 35, 32],
    'Salary': [None, 54000, 58000, 61000, None]
}

df = pd.DataFrame(data)

# Detecting null values
print(df.isnull())
print(df['Age'].isnull())
     

# Dropping null values
# Drop rows with any null values
print(df.dropna())          
# Drop columns with any null values
print(df.dropna(axis=1))    
# Drop rows where all values are null
print(df.dropna(how='all')) 
     

# Filling null values
# Fill null values with a constant
print(df.fillna(0))  
# Fill null values with column mean      
print(df.fillna(df.mean())) 
# Fill null values forward
print(df.fillna(method='ffill')) 
# Fill null values backward
print(df.fillna(method='bfill')) 
     

# Replacing null values
print(df.replace(to_replace=None, value=0))
df['Name'] = df['Name'].replace(to_replace=None, value='Unknown')
print(df)
     

# Interpolating missing values
print(df.interpolate())
print(df.interpolate(method='quadratic'))
print(df.interpolate(method='polynomial', order=2))
     

# Checking for any null values
print(df.isnull().values.any())
print(df['Age'].isnull().values.any())
     

# Summarizing null values
print(df.isnull().sum())
print(df['Age'].isnull().sum())
print(df.isnull().sum().sum())
     