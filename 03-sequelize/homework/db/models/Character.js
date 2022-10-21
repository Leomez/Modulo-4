const { DataTypes } = require('sequelize');

module.exports = sequelize => {
  sequelize.define('Character', {
   code: {
    type: DataTypes.STRING(5),
    primaryKey: true
   },
   name: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true
   }
   
  })
}

// code*: string (Máximo 5 caracteres) [PK]
// name*: string (Debe ser único)
// age: integer
// race: enum (Posibles valores: 'Human', 'Elf', 'Machine', 'Demon', 'Animal', 'Other')
// hp*: float
// mana*: float
// date_added: timestamp without time
// En el caso de no setear una raza ("race") por default deberían asignarle "Other" y si no damos valor para "date_added" debería tomar la fecha actual. Adicionalmente queremos quitar los timestamps automáticos de createdAt y updatedAt.