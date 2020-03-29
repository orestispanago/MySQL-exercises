The following are the requirements for the Gym Fitness Database

* For each MEMBER we keep track of the unique MemdID, a well as Name, Zip, and the Date
the membership was paid

* For each MEMBERSHIP type we keep track of the unique Mid, as well as MNameandPrice
* For each PASS CATEGORY we keep track of the unique PassCatID, as well as PCNameand
Price

* For each ONE DAY PASS we keep track of the unique PassIDand Date

* For each MERCHANDISE item we keep track of the unique MrchID, as well as Name and
Price •For each sale TRANSACTION we keep track of the unique Tidand Date

* Each member pays for exactly one membership type; each membership type has at least
one member but can have many members

* Each member can buy many day passes but does not have to buy any, each day pass was
bought by exactly one member

* Each day pass belongs to exactly one pass category; a pass category can have many
individual day passes issued for it but does not have to have any

* Each sale transaction involves exactly one member; each member can be involved in many
sale transactions but does not have to be involved in any

* Each merchandise item is sold via at least one sale transaction but it can be sold via many
sale transactions; each sale transaction involves at least one merchandise item but can
involve many merchandise items

* Every time a merchandise item is sold via a sale transaction, we keep track of the quantity
(how many instances of that particular merchandise item were sold via that particular sale
transaction)

Your task is to create and ER Diagram based on these requirements and then map it into a
Relational Schema
