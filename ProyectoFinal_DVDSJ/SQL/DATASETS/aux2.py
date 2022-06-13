s = [str(i) for i in range(1, 9)]

s1 = "Taco, Burrito, Quesadilla, Gringa, Torta, Platillo mexicano, Salsa, Bebida"
s1 = s1.split(', ')


s2 = list(zip(s, s1))

for c, p in s2:
    print(c + ", " + p)