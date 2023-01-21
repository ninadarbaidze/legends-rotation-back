import Sequelize from 'sequelize';
import { sequelize } from '../config/database'

const User = sequelize.define('users', {
id:{
   type:Sequelize.INTEGER,
   primaryKey:true
},
name:{
    type: Sequelize.STRING
},
email:{
    type: Sequelize.STRING,
    unique: true
},
passwordddd:{
    type: Sequelize.STRING
},

},{
   timestamps:false
});

export default User;