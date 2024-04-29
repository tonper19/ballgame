import PitchingPlayerInterpreter from '../interpreter/PitchingPlayerInterpreter';

/**
 * Fielding player interpreter
 *
 * Player,Team,G,C,PO,A,E,FLDP,DP,SBA,CSB,SBAP,PB,CI
 * AICHER
 * Kai,DOI,2,1,1,0,0,1.000,0,3,0,100.0,0,0
 * ALZINGER
 * Richard,VM,34,79,74,4,1,0.987,2,0,0,,0,0
 */

function extractPitchingPlayerData(container) {
	const playerInterpreter = new PitchingPlayerInterpreter(container);
	const playerData = [
		playerInterpreter.getPlayerName(),
		playerInterpreter.getTeam(),
		playerInterpreter.getG,
		playerInterpreter.getR(),
		playerInterpreter.getH(),
		playerInterpreter.getH2(),
		playerInterpreter.getH3(),
		playerInterpreter.getHR(),
		playerInterpreter.getRBI(),
		playerInterpreter.getTB(),
		playerInterpreter.getAVG(),
		playerInterpreter.getSLG(),
		playerInterpreter.getOBP(),
		playerInterpreter.getOPS(),
		playerInterpreter.getBB(),
		playerInterpreter.getHBP(),
		playerInterpreter.getSO(),
		playerInterpreter.getGDP(),
		playerInterpreter.getSF(),
		playerInterpreter.getSH(),
		playerInterpreter.getSB(),
		playerInterpreter.getCS()
	]
	return playerData.join(',');
}

function extractPitchingData(dom) {
	const elementNodeListOf = dom.window.document.querySelectorAll('.stats-content tbody tr');
	return [...elementNodeListOf].map(extractPitchingPlayerData);
}

module.exports = {
	extractPitchingData,
}