# Description:
#   Funky charecterization of each employee
#
# Commands:
#   hubot who am I <phrase> - Lookup for the funky phrase by name and then prints that bad boy out.

obj =
    michal: "My beloved master"
    cornel: "Bloody Romanian, not gypsy at least!"
    petr: "Evil czech person. I don't like him."
    damien: "Très sympathique et compatriote raisonnable."
    mario: "Donut eater."
#    duc:
#    sam:
#    charles:
#    david:
#    sasha:
#    james:
    		
#    laura: "Pretty descendant of brave vampire slayer family."
#    oliver:
   
        
names = ["michal","cornel","petr","damien","mario"]
#,"duc","sam","charles","david","sasha","james","jan","martin","pallay","mostafa","tamer","carl","sohum","olivier","rintcius"]
module.exports = (robot) ->
    robot.respond /who am I/i, (msg) ->
        sender = msg.message.user.name.toLowerCase()
        if names.indexOf(sender) > -1
          msg.reply obj[sender]
        else
          msg.reply "Please wait, something very offensive will be added soon!"
