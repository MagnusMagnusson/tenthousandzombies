function ctrl_gameplay(){
	maxHp = 100;
	hp = maxHp;
	zombiesKilled = 0;
	producePicked = 0;
	timeBonus = 0;
	difficulty = 0;
	zombieLevel = 5;
	level = 0;
	killsToNextLevel = 10;
	lastLevelKillTotal = 0;
	bonusSkips = 0;
	
	time = 150;

	paused = false;
	storeOpen = false;
}