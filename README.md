Stack: 
- React v17+
- RRDv6+
- Node.js
- Express.js
- MongoDB
- Mongoose ODM


## Vagrant
Create VMs:
- `cd ./local_deploy`
- `vagrant up`

Setup Frontend:
- Login to Frontend: `vagrant ssh front`
- Copy ./front/ to other dir, e.g front-1
- cd `front-1`
- Run `npm install`
- Copy ./build to /usr/share/nginx/html: `cp ./build/* /usr/share/nginx/html/`

Create Database and User:
- Login to Database machine: `vagrant ssh db`
- Run command `mongosh`
- Create and use database MERN: `use MERN`
- Create user:
    ```
    db.createUser(
    {
        user: "<user>",
        pwd:  "<password>",
        roles: [ { role: "readWrite", db: "MERN" } ]
    }
    )

Seed Database:
- Install Mongoimport on a machine: https://www.mongodb.com/docs/database-tools/installation/?operating-system=linux&package-type=deb#std-label-dbtools_installation
- Run this command: `mongoimport --uri mongodb://<user>:<password>>@<database_address>/MERN --collection Cruds --type json --file Cruds.json --jsonArray`

Run 

## Docker-Compose
- Create ./local_deploy/db directory. It will be binded to /data/db for MongoDB files persistent storage. 

## Ansible
`cd local_deploy/ansible`
Run `ansible-playbook local.yml -i hosts`