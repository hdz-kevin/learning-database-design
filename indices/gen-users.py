def gen_users(init: int = 0) -> str:
    return ",\n".join([
        f"('Kevin', 'kevin{i+1}@gmail.com', 'kevin123')"
        for i in range(init, init + 10_000)
    ])

sql = ""

for i in range(10):
    values = gen_users(i * 10_000)
    sql += f"INSERT INTO users (name, email, password) VALUES\n{values};\n"

sql+="INSERT INTO users (name, email, password) VALUES ('Nate', 'nate@gmail.com', 'nate123');\n"
print(sql)
