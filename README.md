Stack: 
- React v17+
- RRDv6+
- Node.js
- Express.js
- MongoDB
- Mongoose ODM

Create Database and User:
- Login to Database machine
- Run command `mongosh`
- Create and use database MERN: `use MERN`
- Create user:
    ```
    db.createUser(
    {
        user: "<user>",
        pwd:  "<password>",   // or cleartext password
        roles: [ { role: "readWrite", db: "MERN" } ]
    }
    )

Seed Database:
- Install Mongoimport on a machine: https://www.mongodb.com/docs/database-tools/installation/?operating-system=linux&package-type=deb#std-label-dbtools_installation
- Run this command: `mongoimport --uri mongodb://<user>:<password>>@<database_address>/MERN --collection Cruds --type json --file Cruds.json --jsonArray`