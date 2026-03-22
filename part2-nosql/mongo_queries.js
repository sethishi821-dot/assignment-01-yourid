// =====================================
// OP1: insertMany() — insert sample documents
// =====================================

db.products.insertMany([
  {
    product_id: 1,
    product_name: "Laptop",
    category: "Electronics",
    price: 60000
  },
  {
    product_id: 2,
    product_name: "Smartphone",
    category: "Electronics",
    price: 25000
  },
  {
    product_id: 3,
    product_name: "Milk",
    category: "Groceries",
    price: 50,
    expiry_date: new Date("2024-12-01")
  }
]);


// =====================================
// OP2: find() — Electronics with price > 20000
// =====================================

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// =====================================
// OP3: find() — Groceries expiring before 2025-01-01
// =====================================

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// =====================================
// OP4: updateOne() — add discount_percent
// =====================================

db.products.updateOne(
  { product_id: 1 },   // condition
  { 
    $set: { discount_percent: 10 } 
  }
);


// =====================================
// OP5: createIndex() — index on category
// =====================================

db.products.createIndex({ category: 1 });

/*
Explanation:
- This creates an index on the "category" field.
- It improves query performance when filtering by category.
- Example: Faster for queries like:
    db.products.find({ category: "Electronics" })
*/
