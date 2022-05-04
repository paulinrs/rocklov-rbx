const express = require('express');
const multer = require('multer');
const uploadConfig = require('./config/upload');

const SessionController = require('./controllers/SessionController');
const EquipoController = require('./controllers/EquipoController');
const RentingController = require('./controllers/RentingController');
const ApprovalController = require('./controllers/ApprovalController');
const RejectionController = require('./controllers/RejectionController');

const routes = express.Router();
const upload = multer(uploadConfig);

/**
 * @typedef ResponseLogin
 * @property {string} user_token - Object ID
 */

/**
 * @typedef Login
 * @property {string} email.required - User email
 * @property {string} password.required  - User password
 */

/**
 * Login 
 * @route POST /sessions
 * @group LOGIN - Resource for login.
 * @param {Login.model} Login.body.required - Login payload.
 * @returns {ResponseLogin.model} 200 - User data.
 * @returns {Error} 401 - Unauthorized.
 * @returns {Error} 412 - Precondition Failed
 * @returns {Error} 500 - Internal server error.
*/
routes.post('/sessions', SessionController.login);

/**
 * @typedef ResponseUser
 * @property {string} _id - Object ID
 * @property {string} name - User name
 * @property {string} email - User email
 * @property {string} password - User password
 */

/**
 * @typedef Signup
 * @property {string} name.required - User name
 * @property {string} email.required - User email
 * @property {string} password.required - User password
 */

/**
 * Signup 
 * @route POST /signup
 * @group SIGNUP - Resource for signup.
 * @param {Signup.model} Signup.body.required - Signup payload.
 * @returns {ResponseUser.model} 200 - User data.
 * @returns {Error} 409 - Business error
 * @returns {Error} 412 - Precondition Failed
 * @returns {Error} 500 - Internal server error.
*/
routes.post('/signup', SessionController.store);

/**
 * @typedef ResponseEquipo
 * @property {string} _id - Object ID
 * @property {string} user - Object ID
 * @property {string} name - Equipo Name
 * @property {string} category - Category
 * @property {number} price - Price
 * @property {string} thumbnail_url - Thumb Equipo
 * 
 */

/**
 * Find My Equipos
 * @route GET /equipos
 * @group EQUIPOS - Resource for equipos.
 * @param {string} user_token.header.required - User ID
 * @returns {Array.<ResponseEquipo>} 200 - Array of Equipos
 * @returns {Error} 401 - Unauthorized.
 * @returns {Error} 500 - Internal server error.
*/
routes.get('/equipos', EquipoController.index);

// /**
//  * Find Equipos 
//  * @route GET /equipos/show
//  * @group EQUIPOS - Resource for equipos.
//  * @param {string} name.query.required - Equipo name
//  * @param {string} user_token.header.required - User ID
//  * @returns {Array.<ResponseEquipo>} 200 - Equipo List.
//  * @returns {Error} 401 - Unauthorized.
//  * @returns {Error} 500 - Internal server error.
// */
// routes.get('/equipos/show', EquipoController.show);

/**
 * @typedef CreateEquipo
 * @property {string} thumbnail.required - Thumb Equipo
 * @property {string} name.required - Equipo Name
 * @property {string} category.required - Equipo Category
 * @property {number} price.required - Equipo Price
 */

/**
 * Create Equipo
 * @route POST /equipos
 * @group EQUIPOS - Resource for equipos.
 * @param {string} user_token.header.required - User ID
 * @param {CreateEquipo.model} CreateEquipo.body.required - Create Equipo Payload
 * @returns {ResponseEquipo.model} 200 - Equipo data.
 * @returns {Error} 401 - Unauthorized.
 * @returns {Error} 409 - Business error
 * @returns {Error} 412 - Precondition Failed
 * @returns {Error} 500 - Internal server error.
*/
routes.post('/equipos', upload.single('thumbnail'), EquipoController.store);

/**
 * Find Equipo by ID
 * @route GET /equipos/{equipo_id}
 * @group EQUIPOS - Resource for equipos.
 * @param {string} equipo_id.path.required - Equipo ID
 * @param {string} user_token.header.required - User ID
 * @returns {ResponseEquipo.model} 200 - Equipo data.
 * @returns {Error} 401 - Unauthorized.
 * @returns {Error} 404 - Not found.
 * @returns {Error} 500 - Internal server error.
*/
routes.get('/equipos/:equipo_id', EquipoController.unique);

/**
 * Remove Equipo by ID
 * @route DELETE /equipos/{equipo_id}
 * @group EQUIPOS - Resource for equipos.
 * @param {string} equipo_id.path.required - Equipo Equipo ID
 * @param {string} user_token.header.required - User ID
 * @returns {Object} 204 - No Content
 * @returns {Error} 401 - Unauthorized.
 * @returns {Error} 404 - Not found.
 * @returns {Error} 500 - Internal server error.
*/
routes.delete('/equipos/:equipo_id', EquipoController.remove);

/**
 * @typedef CreateRenting
 * @property {string} date - Renting date
 */

// /**
//  * @typedef ResponseRenting
//  * @property {string} equipo_id - Object ID
//  */

//  /**
//  * Create renting for Equipo
//  * @route POST /equipos/{equipo_id}/renting
//  * @group EQUIPOS - Resource for equipos.
//  * @param {string} equipo_id.path.required - Equipo Equipo ID
//  * @param {string} user_token.header.required - User ID
//  * @param {CreateRenting.model} CreateRenting.body.required - CreateRenting Payload
//  * @returns {ResponseRenting.model} 200 - ResponseRenting
//  * @returns {Error} 401 - Unauthorized.
//  * @returns {Error} 404 - Not found.
//  * @returns {Error} 409 - Business error.
//  * @returns {Error} 500 - Internal server error.
// */
routes.post('/equipos/:equipo_id/renting', RentingController.store);

routes.post('/renting/:rent_id/approvals', ApprovalController.store);
routes.post('/renting/:rent_id/rejections', RejectionController.store);

module.exports = routes;
