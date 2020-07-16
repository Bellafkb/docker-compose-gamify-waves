const socket = io => {
  io.on("connection", function(socket) {
    //TODO: save to database
    console.log(`user ${socket.id} connected`);
    socket.on("disconnect", () => {
      console.log(`user ${socket.id} disconnected`);
    });
  });
};

module.exports = socket;
