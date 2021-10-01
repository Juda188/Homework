"""Product and basket classes"""


class Product:
    """ Product class
    Constructor and methods for product objects.

    """
    price = float
    category = str

    def __init__(self, name, price, category, unit):
        self.name = name
        self.price = price
        self.category = category
        self.unit = unit

    def is_eatable(self):
        """
        define "is object eatable".

        """
        self.category.lower()
        if self.category == "household chemicals":
            return False
        else:
            return True

    def price_total(self, count):
        return self.price * count


class Basket:
    def __init__(self):
        self.items = {}

    def add_product(self, item, count=1):
        """
        Method for adding objects to dict.

        """
        if count > 0:
            if item in self.items:
                self.items[item] += count
            else:
                self.items[item] = count
        else:
            print("This product is unable")

    def total(self):
        """
        Method for counting price of all objects in dict

        """
        sum = 0
        for item in self.items:
            count = self.items[item]
            sum += item.price * count
        return sum

    def total_eatable(self):
        """
        Method which define edibility of all products

        """
        i = "household chemicals"
        temp = []
        for item in self.items:
            temp.append(item.category)
        if i in temp:
            return False
        else:
            return True


if __name__ == "__main__":

    meat = Product("meatball", 120, "food", "kg")
    print(meat.is_eatable())
    print(meat.price_total(2))
    salt = Product("salt", 30, "food", "kg")
    milk = Product("milk", 70, "food", "l")
    soap = Product("soap", 15, "household chemicals", "un")
    basket = Basket()
    basket.add_product(salt, 2)
    basket.add_product(meat, 4)
    basket.add_product(milk, 3)
    basket.add_product(soap, 2)
    print(basket.total())
    print(basket.total_eatable())
