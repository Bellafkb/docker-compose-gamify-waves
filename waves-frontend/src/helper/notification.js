export default   notificationConstructor = function (notification){
    switch(notification.type){
        case 'PE_NEW':
        return `a new event added: ${notification.poolevent_id}`
    }
}