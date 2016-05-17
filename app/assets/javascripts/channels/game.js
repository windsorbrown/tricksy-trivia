App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function() {
    return this.printMessage('Waiting for opponent...');

    printMessage: function(message) {
    return $("#messages").append("<p>" + message + "</p>");
  }
    },
  
  disconnected: function() {},
  
  received: function(data) {
    switch (data.action) {
      case "game_start":
        App.board.position("start");
        App.board.orientation(data.msg);
        return this.printMessage("Game started! You play as " + data.msg + ".");
    }
  }
});
