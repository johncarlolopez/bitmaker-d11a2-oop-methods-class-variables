require "./vampire.rb"


nosferatu=Vampire.create("Nosferatu",1000)
dracula=Vampire.create("Dracula",1000)
countess=Vampire.create("Countess",900)
blade=Vampire.create("Blade",100)

print Vampire.show

Vampire.sunset

nosferatu.drink_blood
dracula.drink_blood

nosferatu.go_home
countess.go_home

Vampire.sunrise
puts "\nThe sun has risen"
print Vampire.show
#Nosferatu lives as he both drank blood and returned
#Dracula lived because he drank blood
#Countess lived because she returned to coffin
#blade died because he did not drink blood or go back to coffin
