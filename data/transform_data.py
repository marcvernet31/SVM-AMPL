import pandas as pd


### Funcions per escriure la sortida
# vector y
def print_y(y):
    for i in range(1,len(y)+1):
        print(i, y[i-1])

# matriu X
def print_X(X):
    for i in range(1,len(X)+1):
        print(i, X.loc[i-1,"x1"], X.loc[i-1,"x2"], X.loc[i-1,"x3"], X.loc[i-1,"x4"])

def transform_y(y):
    for i in range(0,len(y)):
        if y[i] == '1.0*' or y[i] == '1.0':
            y[i] = 1
        elif y[i] == '-1.0*' or y[i] == '-1.0':
            y[i] = -1
    return y

def main():
    ## read the data from raw
    data = pd.read_csv('raw1234.dat', sep = " ", names = ["x1", "x2", "x3", "x4", "shit1", "shit2", "y"])

    # defineix el que volem
    X = data.loc[:, ["x1","x2", "x3","x4"]]
    y = list(data.loc[:, "y"])

    # transformem el vector
    y = transform_y(y)

    # escrivim com ho volem (sortida redirigida a un fitxer)
    print("param m := 1000;")
    print("param n := 4;")

    print("param y :=")
    print_y(y)
    print()
    print("param X: 1 2 3 4 :=")
    print_X(X)

main()
