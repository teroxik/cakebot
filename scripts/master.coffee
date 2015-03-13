module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->

     sender = msg.message.user.name.toLowerCase()
     if sender == "michal"
       msg.reply "My beloved master!"
     else if sender == "cornel"
       msg.reply "Bloody Romanian, not gypsy at least!"
     else if sender == "petr"
       msg.reply "Bloody Czech, evil!"
     else if sender == "damien"
       msg.reply "Très sympathique et compatriote raisonnable."           
     else
       msg.reply "Poor human being!"
