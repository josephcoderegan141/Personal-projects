import matplotlib.pyplot as plt

stars = {#dictonary called stars
    "Sirius": (1, 3),
    "Betelgeuse": (4, 7),
    "Rigel": (8, 6),
    "Procyon": (2, 8),
    "Aldebaran": (6, 3),
    "Castor": (9, 9),
    "Pollux": (7, 10)
}

# Define constellations as lists of star names
constallations = {
    "Orion": ["Betelgeuse", "Rigel"],
    "Canis Major": ["Sirius", "Procyon"],
    "Gemini": ["Castor", "Pollux"]
}

plt.figure(figsize=(8,8))
plt.title("Star graph")


for star, (x,y) in stars.items():# fetches items from star dictonary
    plt.scatter(x,y,color = 'green')
    plt.text(x, y,f' {star}',fontsize = 10 ,color = 'blue')


for constallations, star_names in constallations.items():
    for i in range(len(star_names)-1):
        star1, star2 = star_names[i], star_names[i + 1]
        x_values = [stars[star1][0], stars[star2][0]]
        y_values = [stars[star1][1], stars[star2][1]]
        plt.plot(x_values, y_values, color='maroon')

plt.gca().set_facecolor('black')
plt.gca().set_xlim(0, 15)
plt.gca().set_ylim(0, 15)

plt.show()