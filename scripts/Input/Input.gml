global._inputObject = undefined;
function Input(){
	if(is_undefined(global._inputObject)){
		global._inputObject = new InputManager();
	}
	return global._inputObject;
}



function InputManager() constructor{
	
}