using JSON

obj1 = JSON.parse("""{"username": "username", "password": "1234567890"}""")
println(obj1["username"])
obj1 = JSON.json(obj1)
println(obj1)