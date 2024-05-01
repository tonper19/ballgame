export class PlayerInterpreter {

	_surNameMatcher = /<strong>(.*)<\/strong><br>\s(.*)/

	constructor(container) {
		this.container = container;
	}

	_getProperty(prop) {
		return this.container.querySelector(prop)?.textContent;
	}

	_getPropertyAsHTML(prop) {
		return this.container.querySelector(prop)?.innerHTML;
	}

	getPlayerSurName() {
		const playerName = this._getPropertyAsHTML('.player');
		return playerName.match(this._surNameMatcher)?.[1] || '-';
	}

	getPlayerFirstName() {
		let playerName = this._getPropertyAsHTML('.player');
		return playerName.match(this._surNameMatcher)?.[2] || '-';
	}

	getTeam() {
		return this._getProperty('.team');
	}
}