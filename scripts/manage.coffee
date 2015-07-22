module.exports = (robot) ->
   robot.respond /manage me/i, (msg) ->
     messages = ['What story are you working on?','How are you getting on?','What is the estimate of your current task?','Can you please focus on the reviews.'] 
     //rand = Math.floor(Math.random()*messages.length)
     msg.reply messages[0]
