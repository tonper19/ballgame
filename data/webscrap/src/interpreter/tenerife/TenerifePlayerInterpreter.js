import { removeSpaces } from '../../utils.js';
import { PlayerInterpreter } from '../PlayerInterpreter.js';

export class TenerifePlayerInterpreter extends PlayerInterpreter {

	constructor(container, regex) {
		super(container);
		const containerText = container.textContent.replaceAll('\n', '')
		const match = containerText.match(regex);

		if (!match) {
			throw new Error(`Invalid input format: ${containerText}`);
		}

		this.playerStatsContainer = match.slice(1);
	}
	
	getPlayerSurName() {
		const playerSurnameCandidate = this.playerStatsContainer[0].replaceAll(',', ' ').replaceAll('  ', ' ').trim();
		return playerSurnameCandidate.split(' ').splice(1).join(' ');
	}

	getPlayerFirstName() {
		const playerSurnameCandidate = this.playerStatsContainer[0].replaceAll(',', ' ').replaceAll('  ', ' ').trim();
		return playerSurnameCandidate.split(' ').toSpliced(1)[0];
	}

	getTeam() {
		return removeSpaces(this.playerStatsContainer[1].replaceAll(',', ' ')).slice(0, 7);
	}
}