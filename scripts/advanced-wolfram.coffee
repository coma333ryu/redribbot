# Description:
#   Allows hubot to answer almost any question by asking Wolfram Alpha
#
# Dependencies:
#   "wolfram": "0.2.2"
#
# Configuration:
#   HUBOT_WOLFRAM_APPID - your AppID
#
# Commands:
#   hubot question <question> - Searches Wolfram Alpha for the answer to the question
#
# Author:
#   iMaZiNe

Wolfram = require('wolfram').createClient(process.env.HUBOT_WOLFRAM_APPID)

module.exports = (robot) ->
  robot.respond /(who|where|when|what|why|how) (.*)$/i, (msg) ->
    #console.log "#{msg.match[1]} #{msg.match[2]}"
    Wolfram.query "#{msg.match[1]} #{msg.match[2]}", (e, result) ->
      #console.log result
      if result and result.length > 0
        msg.send result[1]['subpods'][0]['value']
      else
        msg.send 'Hmm...not sure'
