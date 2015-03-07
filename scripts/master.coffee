module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->

     sender = msg.message.user.name.toLowerCase()
     if sender == "michal"
       msg.reply "My beloved master!"
     else
       msg.reply "Poor human being!"
