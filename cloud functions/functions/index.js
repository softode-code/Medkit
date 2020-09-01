const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

exports.setReminder = functions.firestore
        .document('users/{userId}/medication/{medication}')
        .onCreate( async (snap, context) =>{
            const value = snap.data();
            // const hour = value.hour;
            // const minute = value.minute;
            const name = value.name;

            var tokens = [];
            var id = context.params.userId;

            const deviceTokens = await admin.firestore()
                .collection('users/'+id+'/tokens').get();
            

            deviceTokens.forEach(doc => {
                tokens.push(doc.data().token);
            });

            var payload = {
                notification: { title: 'New Medication', body: name, sound: 'default'},
                data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'}
            };

            try{
                admin.messaging().sendToDevice(tokens, payload);
                console.log('Messages sent');
            } catch(e){
                console.log('error: ' + e);
            }
            
            return name;
        });