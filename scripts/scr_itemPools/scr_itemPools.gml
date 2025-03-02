function Loot(item, weight) constructor{
	self.item = item;
	self.weight = weight;
}

function ItemPool(items) constructor{
	self.items = items;
	
	static getRandomItem = function(){
		var totalWeight = 0;
		for(var i = 0; i < array_length(items); i++){
			totalWeight += items[i].weight;
		}
		if(totalWeight > 0){
			var r = random(totalWeight);
			for(var i = 0; i < array_length(items); i++){
				r -= items[i].weight;
				if(r <= 0){
					return items[i].item;
				}
			}
		} else{
			return undefined;
		}
	}
}