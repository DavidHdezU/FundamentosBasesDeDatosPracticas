import pandas as pd
from random import randint
import numpy as np
import random

from urllib3 import Retry

dfs = []
for i in range(10):
    dfs.append(pd.read_csv("Tickets/Ticket" + str(i+1) + ".csv"))
    
df = pd.concat(dfs)


def SQL_INSERT_STATEMENT_FROM_DATAFRAME(SOURCE, TARGET):
    sql_texts = []
    for _, row in SOURCE.iterrows():       
        sql_texts.append('insert into '+TARGET+' ('+ str(', '.join(SOURCE.columns))+ ') values '+ str(tuple(row.values)) + ';')        
    return sql_texts

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def generate_digit_sequece_array(n):
    i = 0
    seen = set()
    res = []
    while i <  n:
        sequence = random.sample(range(0, 10), 8)
        sequence_str = ''.join([str(x) for x in sequence])
        
        while sequence_str in seen:
            sequence = random.sample(range(0, 10), 8)
            sequence_str = ''.join([str(x) for x in sequence])
            
        seen.add(sequence_str)
        res.append(sequence_str)
        i += 1
        
    return np.array(res)

def get_booleans_arrays(n):
    arr1, arr2, arr3 = [], [], []
    
    for _ in range(n//3):
        arr1.append(True)
        arr2.append(False)
        arr3.append(False)
        
    for _ in range(n//3):
        arr1.append(False)
        arr2.append(True)
        arr3.append(False)
        
    for _ in range(n//3):
        arr1.append(False)
        arr2.append(False)
        arr3.append(True)
        
    for _ in range(2):
        arr1.append(False)
        arr2.append(False)
        arr3.append(True)
        
    return arr1, arr2, arr3

sequences = generate_digit_sequece_array(len(df['id']))
df['id'] = sequences

arr1, arr2, arr3 = get_booleans_arrays(len(df['id']))

df['Es_Efectivo'] = arr1
df['Es_Tarjeta'] = arr2
df['Es_Puntos'] = arr3


sql_queries = SQL_INSERT_STATEMENT_FROM_DATAFRAME(df, "ticket")

with open(r'tickets.sql', 'w') as fp:
    for item in sql_queries:
        # write each item on a new line
        fp.write("%s\n" % item)
        
        
df.to_csv("tickets.csv")


