import { Interpreter } from './Interpreter.js';

export class PlayerInterpreter  extends Interpreter {

	_surNameMatcher = /<strong>(.*)<\/strong><br>\s(.*)/
	
	_playerNameCleanup(playerName){
		return playerName?.replaceAll(',', ' ').replaceAll('  ',' ');
	}

	getPlayerSurName() {
		const playerNameContainer = this._getPropertyAsHTML('.player');
		const playerName = playerNameContainer?.match(this._surNameMatcher)?.[1];
		return this._playerNameCleanup(playerName) || '-';
	}

	getPlayerFirstName() {
		let playerNameContainer = this._getPropertyAsHTML('.player');
		const playerName = playerNameContainer?.match(this._surNameMatcher)?.[2];
		return this._playerNameCleanup(playerName) || '-';
	}

	getTeam() {
		return this._getProperty('.team');
	}
}