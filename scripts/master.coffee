objects = 
 	michal: "My beloved master!"
	cornel: "Bloody Romanian, not gypsy at least!"
        petr:	"Evil czech person. I don't like him."
	damien: "Très sympathique et compatriote raisonnable."
	mario: "Donut eater."
names = ["michal","cornel","petr","damien","mario"]

/*
        duc: 
	sam: 
	charles:
	david: 
	mario: 
	sasha:
	james: 
	martin: 
	pallay: 
	carl:
	mostafa:
	tamer:
*/	



module.exports = (robot) ->
   robot.respond /who am I/i, (msg) ->

     sender = msg.message.user.name.toLowerCase()
     if names.indexof(sender) > -1
       msg.reply objects[sender]
     else
       msg.reply "Poor human being!"
