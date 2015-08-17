# Description:
#   If you feel that you don't have anything to do. Lets ask the bot!
#
# Commands:
#   hubot manage me - Lookup for the funky management phrase.

module.exports = (robot) ->
   robot.respond /manage me/i, (msg) ->
     messages = ['What story are you working on?','How are you getting on?','What is the estimate of your current task?','Can you please focus on the reviews.'] 
     rand = Math.floor(Math.random()*messages.length)
     msg.reply messages[rand]
