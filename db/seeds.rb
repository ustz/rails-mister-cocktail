file = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
json = JSON.parse(file.read.to_s)
json["drinks"].each do |hash|
  Ingredient.create(name: hash["strIngredient1"])
end
