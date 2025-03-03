window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.action === "updateHUD") {
        const playerNameElement = document.getElementById("player-name");
        playerNameElement.textContent = data.playerName;

        playerNameElement.style.maxWidth = `${window.innerWidth - 40}px`;

        if (data.gameTime) {
            document.getElementById("game-time").textContent = data.gameTime;
        }
			
        const fps = data.fps.toString();
        document.getElementById("fps-value").textContent = fps;
    }

    if (data.action === "updatePlayerCount") {
        document.getElementById("player-count").textContent = `${data.playersOnline}/${data.maxPlayers}`;
    }

    if (data.action === "toggleHUD") {
        document.getElementById("hud").style.display = data.show ? "flex" : "none";
    }
	
    if (data.action === "updateGameTime") {
        document.getElementById("game-time").innerText = data.time;
    }
});