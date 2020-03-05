class Test:
    def __init__(self, some_data_source):
        self._a = 5
        self._b = some_data_source['c']

data_source = {
    'c': 'some data'
}

x = Test(data_source)
x._a = 3
print(x)
