const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

exports.lowInventory = functions.firestore
        .document('users/{userId}/medication/{medication}')
        .onUpdate( async (change, context) =>{
            const value = change.after.data();
            const name = value.name;
            const inventory =  value.inventory;

            if (inventory < 10){
                var tokens = [];
                var id = context.params.userId;

                const deviceTokens = await admin.firestore()
                    .collection('users/'+id+'/tokens').get();
                

                deviceTokens.forEach(doc => {
                    tokens.push(doc.data().token);
                });

                var payload = {
                    notification: { title: 'Low inventory', body: 'Running low on ' + name +'. '+ inventory + ' dosages left.', sound: 'default'},
                    data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'}
                };

                try{
                    admin.messaging().sendToDevice(tokens, payload);
                    console.log('Messages sent');
                } catch(e){
                    console.log('error: ' + e);
                }
                
                return name;
            }
            return null;            
        });