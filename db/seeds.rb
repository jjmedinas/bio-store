# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suplementos, belleza,comestibles, vitaminas/minerales, deporte, decoración
  path = Rails.root.join("seeds/images")

  belleza = Category.create(name: "Belleza")
  belleza.image.attach(io: File.open("#{path}/categories/belleza.jpg"), filename: 'belleza.jpg')

  suplementos = Category.create(name: "Suplementos")
  suplementos.image.attach(io: File.open("#{path}/categories/suplementos.jpg"), filename: 'suplementos.jpg')

  alimentos = Category.create(name: "Alimentos")
  alimentos.image.attach(io: File.open("#{path}/categories/alimentos.jpg"), filename: 'alimentos.jpg')

  vitaminas_minerales = Category.create(name: "Vitaminas/Minerales")
  vitaminas_minerales.image.attach(io: File.open("#{path}/categories/vitaminas-minerales.jpg"), filename: 'vitaminas-minerales.jpg')

  decoracion = Category.create(name: "Decoración")
  decoracion.image.attach(io: File.open("#{path}/categories/decoracion.jpg"), filename: 'decoracion.jpg')

  vendedor = User.create(name: 'Pepito Perez', nickname: 'pperez', email: 'pepe@perez.com', role: 'seller', password: '1232e3455')

  huevos = Product.create(name: "Huevos de granja", category: alimentos, user: vendedor,
                          description: "Huevos organicos de granja, tamaño AA, sin hormonas de crecimiento.",
                          stock: 20, price: 16.000)
  huevos.images.attach(io: File.open("#{path}/products/huevos/huevos1.jpg"), filename: 'huevos1.jpg')
  huevos.images.attach(io: File.open("#{path}/products/huevos/huevos2.jpg"), filename: 'huevos2.jpg')


  matera = Product.create(name: "Matera rústica", category: decoracion, user: vendedor,
                          description: "Matera rústica de roble, sin pintura con toxicos, para decoración de cualquier espacio.",
                          stock: 8, price: 65.000)
  matera.images.attach(io: File.open("#{path}/products/matera/matera1.jpg"), filename: 'matera1.jpg')
  matera.images.attach(io: File.open("#{path}/products/matera/matera2.jpg"), filename: 'matera2.jpg')

  aceite_almendras = Product.create(name: "Aceite Almendras Organico", category: decoracion, user: vendedor,
                          description: "Aceite Almendras Organico. Ideal para remover maquillaje en las noches, Ayuda a la elasticidad, brillo y humectación de nuestra piel.",
                          stock: 12, price: 27.000)
  aceite_almendras.images.attach(io: File.open("#{path}/products/aceite-almendras-organico/aceite-almendras-organico1.jpg"), filename: 'aceite-almendras-organico1.jpg')
  aceite_almendras.images.attach(io: File.open("#{path}/products/aceite-almendras-organico/aceite-almendras-organico2.jpg"), filename: 'aceite-almendras-organico2.jpg')

