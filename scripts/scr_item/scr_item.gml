function Item(name, description, icon, cost = 10, onPurchase = undefined, onRoundStart = undefined, onRoundEnd = undefined) constructor{
	self.name = name;
	self.icon = icon;
	self.onPurchase = onPurchase;
	self.onRoundStart = onRoundStart;
	self.onRoundEnd = onRoundEnd;
	self.cost = cost;
	self.bought = false;
	
	static canPurchase = function(){
		return !bought && o_ctrl.gold >= cost;
	}
	
	static purchase = function(){
		o_ctrl.gold -= cost;
		if(onPurchase){
			onPurchase.effect();
		}
		if(onRoundStart){
			array_push(o_ctrl.onRoundStartEffects, onRoundStart);
		}
		if(onRoundEnd){
			array_push(o_ctrl.onRoundEndEffects, onRoundEnd);
		}
	}
	
	static copy = function(){
		return new Item(name, description, icon, cost, onPurchase, onRoundStart, onRoundEnd);
	}
}

function Effect(effect, duration = 100) constructor{
	self.effect = effect;
	self.duration = duration;
}