const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

exports.setReminder = functions.firestore
        .document('users/{usersId}/medication/{medication}')
        .onCreate((snap, context) =>{
            const value = snap.data();
            const name = value.name;
            console.log(name);
            return name;
        });