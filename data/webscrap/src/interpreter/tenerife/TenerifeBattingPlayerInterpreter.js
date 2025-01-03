import { removeSpaces } from '../../utils.js';
import { TenerifePlayerInterpreter } from './TenerifePlayerInterpreter.js';

const regex = /(.+,)\s([A-Z,-\s]+)([\d.,\s]+)+(\d+-\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+([\d.]+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+([\d.]+)\s+(\d+)\s+(\d+)\s+([\d-]+)/i;

export class TenerifeBattingPlayerInterpreter extends TenerifePlayerInterpreter {

	constructor(container) {
		super(container, regex);
	}

	getAB() {
		return removeSpaces(this.playerStatsContainer[4]);
	}

	getR() {
		return removeSpaces(this.playerStatsContainer[5]);
	}

	getH() {
		return removeSpaces(this.playerStatsContainer[6]);
	}

	getH2() {
		return removeSpaces(this.playerStatsContainer[7]);
	}

	getH3() {
		return removeSpaces(this.playerStatsContainer[8]);
	}

	getHR() {
		return removeSpaces(this.playerStatsContainer[9]);
	}

	getRBI() {
		return removeSpaces(this.playerStatsContainer[10]);
	}

	getTB() {
		return removeSpaces(this.playerStatsContainer[11]);
	}

	getAVG() {
		return '';
	}

	getSLG() {
		return '';
	}

	getOBP() {
		return '';
	}

	getOPS() {
		return '';
	}

	getBB() {
		return this.playerStatsContainer[13];
	}

	getHBP() {
		return this.playerStatsContainer[14];
	}

	getSO() {
		return this.playerStatsContainer[15];
	}

	getGDP() {
		return this.playerStatsContainer[16];
	}

	getSF() {
		return this.playerStatsContainer[18];
	}

	getSH() {
		return this.playerStatsContainer[19];
	}

	getSB() {
		return this.playerStatsContainer[20].split('-')[0];
	}

	getCS() {
		const sb_att = this.playerStatsContainer[20].split('-');
		const sb = sb_att[0];
		const att = sb_att[1];
		return `${att - sb}`;
	}
}