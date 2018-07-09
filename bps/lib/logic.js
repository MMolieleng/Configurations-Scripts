'use strict';
/**
 * Get profile from the database
 * @param {fsi.zone.bps.transactions.fundWastePlan} fund - explanation
 * @transaction
 */
async function fundWastePlan( fund ) {
    
    let profiles = await query('getDeveloperProfileByUsername', {username:fund.username});
    try {

        if (profiles !== null && profiles.length > 0){

            let profile = profiles[0];
            let factory = getFactory()
            let participantReg = await getParticipantRegistry('fsi.zone.bps.developer.DeveloperProfile');
    
            fund.oldBalance = profile.balance;
            profile.balance = fund.newBalance;
    
            await participantReg.update(profile);
            console.log('@debug last message', 'transaction executed')

            var notification         = factory.newEvent('fsi.zone.bps.transactions','fundWastePlanEvent')
            notification.profile     = profile
            notification.newBalance  = fund.newBalance
            notification.description = fund.description
            notification.oldBalance  = profile.balance
            emit(notification)
            console.log('@debug emiting event', profile.balance)
        }else{
            console.log('@debug Error happend', 'Some error just occured')
            throw new Error('User was not found');
        }
        
    } catch (error) {
        throw new Error(error.message)
    }
}