import { PlayerInterpreter } from './PlayerInterpreter.js';
import { formatLeadingZero } from '../utils.js';

export class PitchingPlayerInterpreter extends PlayerInterpreter {

	getW() {
		return this._getProperty('.pitch_win');
	}

	getL() {
		return this._getProperty('.pitch_loss');
	}

	getERA() {
		return formatLeadingZero(this._getProperty('.era'));
	}

	getAPP() {
		return this._getProperty('.pitch_appear');
	}

	getGS() {
		return this._getProperty('.pitch_gs');
	}

	getSV() {
		return this._getProperty('.pitch_save');
	}

	getCG() {
		return this._getProperty('.pitch_cg');
	}

	getSHO() {
		return this._getProperty('.pitch_sho');
	}

	getIP() {
		return this._getProperty('.pitch_ip');
	}

	getH() {
		return this._getProperty('.pitch_h');
	}

	getR() {
		return this._getProperty('.pitch_r');
	}

	getER() {
		return this._getProperty('.pitch_er');
	}

	getBB() {
		return this._getProperty('.pitch_bb');
	}

	getSO() {
		return this._getProperty('.pitch_so');
	}

	get2B() {
		return this._getProperty('.pitch_double');
	}

	get3B() {
		return this._getProperty('.pitch_triple');
	}

	getHR() {
		return this._getProperty('.pitch_hr');
	}

	getAB() {
		return this._getProperty('.pitch_ab');
	}

	getBAVG() {
		return formatLeadingZero(this._getProperty('.bavg'));
	}

	getWP() {
		return this._getProperty('.pitch_wp');
	}

	getHB() {
		return this._getProperty('.pitch_hbp');
	}

	getBK() {
		return this._getProperty('.pitch_bk');
	}

	getSFA() {
		return this._getProperty('.pitch_sfa');
	}

	getSHA() {
		return this._getProperty('.pitch_sha');
	}

	getGO() {
		return this._getProperty('.pitch_ground');
	}

	getFO() {
		return this._getProperty('.pitch_fly');
	}
}