import { formatLeadingZero, removeSpaces } from '../../utils.js';
import { TenerifePlayerInterpreter } from './TenerifePlayerInterpreter.js';

const regex = /([\w\s]+),\s+([A-Z-]+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+([\d.\-\/]+)\s+(\d+)\s+(\d+)\s+(\d+)\s+([\d.\-\/]+)\s(\d+)\s(\d+)/i;

export class TenerifeFieldingPlayerInterpreter extends TenerifePlayerInterpreter {

	constructor(container) {
		super(container, regex);
	}

	getG() {
		return '';
	}

	getC() {
		return removeSpaces(this.playerStatsContainer[2]);
	}

	getPO() {
		return removeSpaces(this.playerStatsContainer[3]);
	}

	getA() {
		return removeSpaces(this.playerStatsContainer[4]);
	}

	getE() {
		return removeSpaces(this.playerStatsContainer[5]);
	}

	getFLDP() {
		return '';
	}

	getDP() {
		return removeSpaces(this.playerStatsContainer[7]);
	}

	getSBA() {
		return removeSpaces(this.playerStatsContainer[8]);
	}

	getCSB() {
		return removeSpaces(this.playerStatsContainer[9]);
	}

	getSBAP() {
		return '';
	}

	getPB() {
		return removeSpaces(this.playerStatsContainer[11]);
	}

	getCI() {
		return removeSpaces(this.playerStatsContainer[12]);
	}
	
}