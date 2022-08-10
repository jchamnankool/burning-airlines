# Setup for Burning Airlines backend
## Creating the Rails server
```shell
$ rails new airlines-server -d postgresql
$ cd airlines-server
```

## Scaffolds
### Airplane
* `name:text`
* `rows:integer`
* `cols:integer`
```shell
~airlines-server$ rails g scaffold Airplane name:text rows:integer cols:integer
```
Using *24B* as an example of a seat number, this indicates a seat in the **24th row** and the **B column**, or the second column. Therefore, the number of columns determines how many letters there are.
### Flight
* `name:text`
* `date:date`
* `to:text`
* `from:text`
* `plane:text`
```shell
~airlines-server$ rails g scaffold Flight name:text date:date to:text from:text plane:text
```
Even though flight numbers and planes are given numbers as names (i.e. 747), we are not performing any mathematical operations on them, so it's fine to keep them stored as text.

### User
* `email:text`
* `password_digest:string`
* `admin:boolean`
```shell
~airlines-server$ rails g scaffold User email:text password_digest:string admin:boolean
```
Note that the admin boolean must have a default value of `false`.
### Reservation
* `user_id:integer`
* `flight_id:integer`
* `row:integer`
* `col:integer`
```shell
~airlines-server$ rails g scaffold Reservation user_id:integer flight_id:integer row:integer col:integer
```
`Reservation` will act as both a model and a join table between users and flights.

## Established associations
### 1:many
* **User:Reservation**
* **Flight:Reservation**
* **Airplane:Flight**
### many:many
* **User:Flights** (through Reservation)

Because users have many reservations, they have many flights through reservations.
```rb
class User ApplicationRecord
    has_many :reservations
    has_many :flights, :through => :reservations
end
```

## For the front end
`seats` can have a column for an array of objects, structured like so:
```rb
seats = [
    {
        name: "24B",
        user: undefined
    },
    {
        name: "14A",
        user: 22 # this is their ID, but we can also store email instead
    },
    ...
]
```
The length of the `seats` array will determine how many available seats there are on the plane to begin with. Whether or not the `user` attribute is undefined will determine the *availability* of the seat itself. The seat name will be generated based on the rows and columns of the associated plane as they are pushed into the `seats` array.

## Resources
* [Rails API User Authenticationin React](https://dev.to/diiiiana99/connecting-javascript-react-and-ruby-on-rails-user-authentication-and-authorization-2le3)