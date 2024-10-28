import { formatLeadingZero } from '../utils.js';
import { Interpreter } from './Interpreter.js';

export class TeamStandingInterpreter extends Interpreter {

	_fullNameMatcher = /(.*)\s.*.\s<br><small>(.*)<\/small>/

	getPosition() {
		return this._getProperty('td:nth-child(1)');
	}

	getTeamImageUrl() {
		return this._getPropertyNode('td:nth-child(2) a img')?.getAttribute('src');
	}

	getTeamUrl() {
		return this._getPropertyNode('td:nth-child(2) a')?.getAttribute('href');
	}

	getShortName() {
		const nameContainer = this._getPropertyAsHTML('td:nth-child(3) a p');
		return nameContainer?.match(this._fullNameMatcher)?.[1]?.trim();
	}

	getFullName() {
		const nameContainer = this._getPropertyAsHTML('td:nth-child(3) a p');
		return nameContainer?.match(this._fullNameMatcher)?.[2]?.trim();
	}

	getW() {
		return this._getProperty('td:nth-child(4)');
	}

	getL() {
		return this._getProperty('td:nth-child(5)');
	}

	getT() {
		return this._getProperty('td:nth-child(6)');
	}

	getPCT() {
		return formatLeadingZero(this._getProperty('td:nth-child(7)'));
	}

	getGB() {
		return this._getProperty('td:nth-child(8)');
	}
}
