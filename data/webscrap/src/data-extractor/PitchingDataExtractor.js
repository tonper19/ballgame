import { PitchingPlayerInterpreter } from '../interpreter/PitchingPlayerInterpreter.js';

/**
 * Pitching, el field WHIP no lo necesito:
 * Player,Team,W,L,ERA,APP,GS,SV,CG,SHO,IP,H,R,ER,BB,SO,H2,H3,HR,AB,BAVG,WP,HBP,BK,SFA,SHA,GO,FO
 * BALLARDINI
 * Lino,BRA,0,0,0.00,2,0,0,0,0,4.2,5,0,0,2,4,1,0,0,19,0.263,0,1,0,0,0,4,6
 * CLESSE
 * Tashi,MSG,0,0,7.71,1,0,0,0,0,2.1,2,2,2,0,0,1,0,1,9,0.222,0,0,0,0,0,3,4
 */

function extractPitchingPlayerData(container) {
	const playerInterpreter = new PitchingPlayerInterpreter(container);
	const playerData = [
		playerInterpreter.getPlayerName(),
		playerInterpreter.getTeam(),
		playerInterpreter.getW(),
		playerInterpreter.getL(),
		playerInterpreter.getERA(),
		playerInterpreter.getAPP(),
		playerInterpreter.getGS(),
		playerInterpreter.getSV(),
		playerInterpreter.getCG(),
		playerInterpreter.getSHO(),
		playerInterpreter.getIP(),
		playerInterpreter.getH(),
		playerInterpreter.getR(),
		playerInterpreter.getER(),
		playerInterpreter.getBB(),
		playerInterpreter.get2B(),
		playerInterpreter.get3B(),
		playerInterpreter.getHR(),
		playerInterpreter.getAB(),
		playerInterpreter.getBAVG(),
		playerInterpreter.getWP(),
		playerInterpreter.getHB(),
		playerInterpreter.getBK(),
		playerInterpreter.getSFA(),
		playerInterpreter.getGO(),
		playerInterpreter.getFO()
	]
	return playerData.join(',');
}

export function extractPitchingData(dom) {
	const elementNodeListOf = dom.window.document.querySelectorAll('.stats-content tbody tr');
	return [...elementNodeListOf].map(extractPitchingPlayerData);
}