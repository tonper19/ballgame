import { removeSpaces } from '../../utils.js';
import { TenerifePlayerInterpreter } from './TenerifePlayerInterpreter.js';

const regex = /([\w\s]+),\s+([A-Z-]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)\s+([\d.\-\/]+)/i;

export class TenerifePitchingPlayerInterpreter extends TenerifePlayerInterpreter {

	constructor(container) {
		super(container, regex);
	}
	
	getW() {
		return removeSpaces(this.playerStatsContainer[3].split('-')[0]);
	}

	getL() {
		return removeSpaces(this.playerStatsContainer[3].split('-')[1]);
	}

	getERA() {
		return '';
	}

	getAPP() {
		return removeSpaces(this.playerStatsContainer[4].split('-')[0]);
	}

	getGS() {
		return removeSpaces(this.playerStatsContainer[4].split('-')[1]);
	}

	getSV() {
		return removeSpaces(this.playerStatsContainer[7]);
	}

	getCG() {
		return removeSpaces(this.playerStatsContainer[5]);
	}

	getSHO() {
		return removeSpaces(this.playerStatsContainer[6].split('/')[0]);
	}

	getIP() {
		return removeSpaces(this.playerStatsContainer[8]);
	}

	getH() {
		return removeSpaces(this.playerStatsContainer[9]);
	}

	getR() {
		return removeSpaces(this.playerStatsContainer[10]);
	}

	getER() {
		return removeSpaces(this.playerStatsContainer[11]);
	}

	getBB() {
		return removeSpaces(this.playerStatsContainer[12]);
	}

	getSO() {
		return removeSpaces(this.playerStatsContainer[13]);
	}

	get2B() {
		return removeSpaces(this.playerStatsContainer[14]);
	}

	get3B() {
		return removeSpaces(this.playerStatsContainer[15]);
	}

	getHR() {
		return removeSpaces(this.playerStatsContainer[16]);
	}

	getAB() {
		return removeSpaces(this.playerStatsContainer[17]);
	}

	getBAVG() {
		return '';
	}

	getWP() {
		return removeSpaces(this.playerStatsContainer[19]);
	}

	getHB() {
		return removeSpaces(this.playerStatsContainer[20]);
	}

	getBK() {
		return removeSpaces(this.playerStatsContainer[21]);
	}

	getSFA() {
		return '';
	}

	getSHA() {
		return '';
	}

	getGO() {
		return '';
	}

	getFO() {
		return '';
	}
}