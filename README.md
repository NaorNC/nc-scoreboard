## ScreenShot

![nc-scoreboard](https://i.ibb.co/ZHZQJ0T/Screenshot-1.png)

# nc-scoreboard

Briefly about the scoreboard.
- The scoreboard was ready 9 months ago (it was in WildStar - which I own), and now it's time to release it.
- The scoreboard is ready for use, everything works at %100.
- If you run into a problem, you are always welcome to contact me at Discord (found on my github profile)

This script was created by jaredscar and many changes have been made to it.

# Installation

- Download the scripts and put them in the ```[resource] or [standalone]``` folder.
- Add the following code to your ```server.cfg/resouces.cfg```

```
ensure Discord_API
ensure nc-scoreboard
```

# Configuration

In the ```Discord_API``` folder you will need to go to ```config.lua``` and follow the following code.

```lua 
  Config = {
	Guild_ID = 'Put Discord Server ID',
	Bot_Token = 'Put Your Bot Token',
	RoleList = {Member}, -- Discord Role
}
```
- that's it! Best of luck.
