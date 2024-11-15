// Base class
class Animal {
  // Method to be overridden by derived classes
  void makeSound() {
    print("Animal makes a sound");
  }
}
 
// Derived class Dog that overrides makeSound method
class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}
 
// Derived class Cat that overrides makeSound method
class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows");
  }
}
 
void main() {
  // Creating instances of Animal, Dog, and Cat
  Animal animal = Animal();
  Dog dog = Dog();
  Cat cat = Cat();
 
  // Calling makeSound method for each instance
  animal.makeSound(); // Calls Animal's version
  dog.makeSound();    // Calls Dog's version
  cat.makeSound();    // Calls Cat's version
}
