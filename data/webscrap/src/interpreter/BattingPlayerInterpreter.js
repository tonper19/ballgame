import { PlayerInterpreter } from './PlayerInterpreter.js';
import { formatLeadingZero } from '../utils.js';

export class BattingPlayerInterpreter extends PlayerInterpreter {

	getAB() {
		return this._getProperty('.ab');
	}

	getR() {
		return this._getProperty('.r');
	}

	getH() {
		return this._getProperty('.h');
	}

	getH2() {
		return this._getProperty('.double');
	}

	getH3() {
		return this._getProperty('.triple');
	}

	getHR() {
		return this._getProperty('.hr');
	}

	getRBI() {
		return this._getProperty('.rbi');
	}

	getTB() {
		return this._getProperty('.tb');
	}

	getAVG() {
		return formatLeadingZero(this._getProperty('.avg'));
	}

	getSLG() {
		return formatLeadingZero(this._getProperty('.slg'));
	}
	
	getOBP() {
		return formatLeadingZero(this._getProperty('.obp'));
	}
	
	getOPS() {
		return formatLeadingZero(this._getProperty('.ops'));
	}
	
	getBB() {
		return this._getProperty('.bb');
	}
	
	getHBP() {
			return this._getProperty('.hbp');
	}
	
	getSO() {
		return this._getProperty('.so');
	}
	
	getGDP() {
		return this._getProperty('.gdp');
	}
	
	getSF() {
		return this._getProperty('.sf');
	}
	
	getSH() {
		return this._getProperty('.sh');
	}
	
	getSB() {
		return this._getProperty('.sb');
	}
	
	getCS() {
		return this._getProperty('.cs');
	}
}
