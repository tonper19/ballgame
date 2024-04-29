export class PlayerInterpreter {

	constructor(container) {
		this.container = container;
	}

	_getProperty(prop) {
		return this.container.querySelector(prop)?.textContent;
	}

	getPlayerName() {
		return this._getProperty('.player');
	}

	getTeam() {
		return this._getProperty('.team');
	}
}