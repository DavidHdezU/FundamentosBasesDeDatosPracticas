sabores = ['limon con chia', 'horchata', 'jamaica', 'tamarindo', 'piña', 'embotellada', 'mineral']

s = "Agua de "

bebidas = []
i = 94
for sabor in sabores:
    new_s = s + sabor
    descripcion = "Refrescante " + s.lower() + sabor
    bebidas.append((str(i), new_s, descripcion))
    i += 1
    

refrescos = ["Coca cola", "Sprite", "Fanta", "Sidral Mundel", "Yoli"]

for r in refrescos:
    descripcion = "Refresco " + r.lower()
    bebidas.append((str(i), r, descripcion))
    i += 1
    
cervezas = ["XX Ambar", "Corona", "Tecate", "Pacifico", "Heineken", "Modelo"]

for c in cervezas:
    descripcion = "Cerveza " + c.lower()
    bebidas.append((str(i), c, descripcion))
    i += 1
    
for id, bebida, descripcion in bebidas:
    print(id  + "," + bebida + "," + descripcion)


print(len(bebidas))