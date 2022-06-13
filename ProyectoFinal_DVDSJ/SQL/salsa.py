items1 = "Burrito de carnitas, Burrito al pastor, Burrito de barbacoa, Burrito de suadero, Burrito de cabeza, Burrito de tripas, Burrito de cecina, Burrito de chilorio, Burrito de requesón, Burrito de pescado, Burrito de tuétano, Burrito de nopal asado, Burrito de chapulines, Burrito de cochinita pibil, Burrito de bistec, Burrito de chorizo, Burrito de lengua"
items2 = ", Quesadilla de carnitas, Quesadilla al pastor, Quesadilla de barbacoa, Quesadilla de suadero, Quesadilla de cabeza, Quesadilla de tripas, Quesadilla de cecina, Quesadilla de chilorio, Quesadilla de requesón, Quesadilla de pescado, Quesadilla de tuétano, Quesadilla de nopal asado, Quesadilla de chapulines, Quesadilla de cochinita pibil, Quesadilla de bistec, Quesadilla de chorizo, Quesadilla de lengua"
items3 = ", Gringa de carnitas, Gringa al pastor, Gringa de barbacoa, Gringa de suadero, Gringa de cabeza, Gringa de tripas, Gringa de cecina, Gringa de chilorio, Gringa de requesón, Gringa de pescado, Gringa de tuétano, Gringa de nopal asado, Gringa de chapulines, Gringa de cochinita pibil, Gringa de bistec, Gringa de chorizo, Gringa de lengua"
items4 = ", Torta de carnitas, Torta al pastor, Torta de barbacoa, Torta de suadero, Torta de cabeza, Torta de tripas, Torta de cecina, Torta de chilorio, Torta de requesón, Torta de pescado, Torta de tuétano, Torta de nopal asado, Torta de chapulines, Torta de cochinita pibil, Torta de bistec, Torta de chorizo, Torta de lengua"


items = items1 + items2 + items3 + items4

items = items.split(", ")

nombres2 = []
id_categoria = []

for s in items:
    aux_s = s.split()
    aux_s.insert(1, "relleno")
    aux_s.append("con o sin verdura.")
    
    if s[0] == 'B':
        id_categoria.append('2')
    elif s[0] == 'Q':
        id_categoria.append('3')
    elif s[0] == 'G':
        id_categoria.append('4')
    else:
        id_categoria.append('5')
    
    nombres2.append(' '.join(aux_s))

ids = [str(i+18) for i in range(len(items))]

df = list(zip(items, ids, id_categoria, nombres2))

for s, id, id_c, s2 in df:
    print(s + "," + id  + "," + id_c +  "," + s2)




