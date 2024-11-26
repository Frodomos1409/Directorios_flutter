const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phone: { type: String, required: false },
  institution: { type: String, required: false },
  residence: { type: String, required: false },
}, { timestamps: true });

module.exports = mongoose.model('User', userSchema);
