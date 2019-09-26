Question 1: What classes does each implementation include? Are the lists the same?
Answer: Implementation A and Implementation B both include CartEntry, ShoppingCart and Order classes. 

Question 2: Write down a sentence to describe each class.
Answer: Implementation A - The CartEntry class creates a single CartEntry object and defines its unit_price and quantity. The ShoppingCart class keeps track of all the CartEntry objects. The Order class calculates the total price of all the entries in the ShoppingCart by iterating through ShoppingCart's array, pulling out the unit_price and quantity attributes from each CartEntry object and then multiplying the sales_tax to the entries' subtotal.
Answer: Implementation B - The CartEntry class now stores a state AND a behavior. It is instantiated with unit_price and quantity, and holds a method that calculates and returns the item/s subtotal. The ShoppingCart class keeps track of the CartEntry objects, and now holds a method that calls on CartEntry to return the sum price of all its entry objects. The Order class holds a method that returns the total price of all the entries. Now, instead of calculating the subtotal itself, the class simply asks the ShoppingCart class for the sum price of all the entry objects and then multiplies the sales_tax to that subtotal to return the total_price. 

Question 3: How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
Answer: In both implementations, the Order class has one ShoppingCart object, and the ShoppingCart class has many cart entry objects. 


Question 4: What data does each class store? How (if at all) does this differ between the two implementations?
Answer: Each class in both implementations store the same data. The CartEntry class stores unit_price and quantity. The ShoppingCart class stores an array of CartEntry objects. The Order class stores a ShoppingCart object.

Question 5: What methods does each class have? How (if at all) does this differ between the two implementations?
Answer: Implementation A - The CartEntry and ShoppingCart classes do not hold methods. The Order class holds one "total_price" method. 
Answer: Implementation B - The CartEntry and Shopping classes now each hold one method called "price." The Order class still holds one method called "total_price." 

Question 6: Consider the Order#total_price method.
Answer: Implementation A - Logic to compute the price is retained in Order. The Order class knows too much about the ShoppingCart and CartEntry classes and also manipulates both of those classes' states (instance variables) to calculate the total_price. 
Answer: Implementation B - Unlike the former implementation, this version does not manipulate states of other classes. Instead, it allows the other classes to handle the logic, and then simply calls on those classes to provide an answer. 

Question 7: If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Answer: In both implementations, we'd have to alter the initialize method of the CartEntry class to determine the "unit_price" if the quantity given was over a certain amount. However, since the Order class directly manipulates the CartEntry attributes in Implementation A, we would also have to make changes to Order's "total_price" method. Therefore, implementation B is easier to modify since CartEntry is solely responsible for manipulating its own state and logic. 

Question 8: Which implementation better adheres to the single responsibility principle? 
Answer: Implementation B. Unlike Implementation A, Implementation B does not store all of the logic in the Order class. Instead it assigns logic to a class depending on which instance variables are modified.

Question 9: 
Answer: Implementation B is more loosely coupled. Implementation A's Order class knows too much about the ShoppingCart and CartEntry classes. It has to dig through class objects to get the data it needs. If the "unit_price" and "entry" names change in CartEntry, it will break the code in Order. 
