module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->

     sender = msg.message.user.name.toLowerCase()
     lastName = msg.message.user.lastName.toLowerCase()
     if sender == "michal"
       msg.reply "My beloved master!"
     else if sender == "cornel"
       msg.reply "Bloody Romanian, not gypsy at least!"     
     else
       msg.reply "Poor human being!"
