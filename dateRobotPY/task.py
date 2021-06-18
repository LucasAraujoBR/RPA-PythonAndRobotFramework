"""Template robot with Python."""
import  json as j

def minimal_task():
    x =  '{ "name":"João", "age":30, "city":"New York"}'
    y = j.loads(x)
    z= j.dump(y)
    print(z)



if __name__ == "__main__":
    minimal_task()
