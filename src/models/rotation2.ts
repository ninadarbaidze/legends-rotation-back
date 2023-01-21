import Sequelize from 'sequelize';
import { sequelize } from '../config/database'

const Surname = sequelize.define('surname', {
id:{
   type:Sequelize.INTEGER,
   primaryKey:true,
   autoIncrement: true
},
surname:{
    type: Sequelize.STRING
}

},{
   timestamps:false
});

export default Surname;