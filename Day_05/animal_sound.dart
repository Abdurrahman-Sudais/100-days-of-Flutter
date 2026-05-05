void main() {
  Dog dog1 = Dog("benny", 2, "german shepherd");
  dog1.AnimalSound();
  Cat cat1 = Cat("Alexa", 5, "Mountain Cat");
  cat1.AnimalSound();
}

class Animal {
  String? name;
  int? age;

  Animal(this.name, this.age) {
    print("$name is $age years old");
  }

  void AnimalSound() {
    print("this animal makes a sound");
  }
}

class Dog extends Animal {
  String? breed;
  Dog(String name, int age, this.breed) : super(name, age);
  @override
  void AnimalSound() {
    print("$name barks");
  }
}

class Cat extends Animal {
  String? breed;
  Cat(String name, int age, this.breed) : super(name, age);
  @override
  void AnimalSound() {
    print("$name meows");
  }
}
