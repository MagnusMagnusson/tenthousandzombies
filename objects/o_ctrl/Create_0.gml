ctrl_startd3d();
ctrl_gameplay();
difficultyScaling = [0.5, 0.75, 1, 1.5, 2];

setDifficulty = function(difficulty){
	
}

getScore = function(){
	return ceil(difficultyScaling[difficulty] * (zombiesKilled * 10 + producePicked * 0.1 + 2*timeBonus + bonusSkips * 150 + 220 * (zombiesKilled div 100)));
}