import { removeSpaces } from '../../utils.js';
import { PlayerInterpreter } from '../PlayerInterpreter.js';

const TEAM_CODE_LENGTH = 5;
/**
 * Interpreter for player statistics specific to Tenerife team.
 */
export class TenerifePlayerInterpreter extends PlayerInterpreter {

    /**
     * @param {HTMLElement} container - HTML element containing player data.
     * @param {RegExp} regex - Regular expression to extract player data.
     * @throws {Error} If input format is invalid.
     */
	constructor(container, regex) {
		super(container);

        if (typeof regex !== 'object' || !(regex instanceof RegExp)) {
            throw new TypeError('Provided regex is not a valid RegExp object');
        }

        const containerText = container.textContent.replace(/\n+/g, '').replaceAll('\ufffd', 'ñ');
		const match = containerText.match(regex);

		if (!match) {
			throw new Error(`Invalid input format: ${containerText}`);
		}

		this.playerStatsContainer = match.slice(1);

		if (this.playerStatsContainer.length < 2) {
			throw new Error('Player stats container does not have the required data structure.');
		}
	}

	/**
	 * Extracts and returns the player's surname.
	 * @returns {string} Player's surname.
	 */	
	getPlayerSurName() {
		const playerSurnameCandidate = this.playerStatsContainer[0].replaceAll(',', ' ').replaceAll('  ', ' ').trim();
		return playerSurnameCandidate.split(' ').slice(1).join(' ');
	}

    /**
     * Extracts and returns the player's first name.
     * @returns {string} Player's first name.
     */
	getPlayerFirstName() {
		const playerSurnameCandidate = this.playerStatsContainer[0].replaceAll(',', ' ').replaceAll('  ', ' ').trim();
		return playerSurnameCandidate.split(' ')[0];
	}

    /**
     * Extracts and returns the team code.
     * @returns {string} Team code.
     */
	getTeam() {
        return removeSpaces(this.playerStatsContainer[1].replace(/,+/g, ' ')).slice(0, TEAM_CODE_LENGTH);
	}
}