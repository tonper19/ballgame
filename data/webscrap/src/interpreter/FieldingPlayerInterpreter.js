import { formatLeadingZero } from '../utils.js';
import { PlayerInterpreter } from './PlayerInterpreter.js';

export class FieldingPlayerInterpreter extends PlayerInterpreter {

	getG() {
		return this._getProperty('.field_g');
	}

	getC() {
		return this._getProperty('.field_c');
	}

	getPO() {
		return this._getProperty('.field_po');
	}

	getA() {
		return this._getProperty('.field_a');
	}

	getE() {
		return this._getProperty('.field_e');
	}

	getFLDP() {
		return formatLeadingZero(this._getProperty('.fldp'));
	}

	getDP() {
		return this._getProperty('.field_dp');
	}

	getSBA() {
		return this._getProperty('.field_sba');
	}

	getCSB() {
		return this._getProperty('.field_csb');
	}

	getSBAP() {
		const sbap = this._getProperty('.sbap');
		return sbap==='-' ? '':sbap;
	}

	getPB() {
		return this._getProperty('.field_pb');
	}

	getCI() {
		return this._getProperty('.field_ci');
	}
}