meals =
  "smallChicken": "id": "Small Chicken Naan", "price": 3.80
  "smallChips": "id": "Small Chips", "price": 1.30

module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->
     sender   = msg.message.user.name.toLowerCase()
     msg.reply "#{sender}"
