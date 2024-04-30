import { PitchingPlayerInterpreter } from '../interpreter/PitchingPlayerInterpreter.js';

function extractPitchingPlayerData(container) {
	const playerInterpreter = new PitchingPlayerInterpreter(container);
	const playerData = [
		playerInterpreter.getPlayerSurName(),
		playerInterpreter.getPlayerFirstName(),
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
		playerInterpreter.getSO(),
		playerInterpreter.get2B(),
		playerInterpreter.get3B(),
		playerInterpreter.getHR(),
		playerInterpreter.getAB(),
		playerInterpreter.getBAVG(),
		playerInterpreter.getWP(),
		playerInterpreter.getHB(),
		playerInterpreter.getBK(),
		playerInterpreter.getSFA(),
		playerInterpreter.getSHA(),
		playerInterpreter.getGO(),
		playerInterpreter.getFO()
	]
	return playerData.join(',');
}

export function extractPitchingData(dom) {
	const elementNodeListOf = dom.window.document.querySelectorAll('.stats-content tbody tr');
	return [
		'Surname,First Name,Team,W,L,ERA,APP,GS,SV,CG,SHO,IP,H,R,ER,BB,SO,H2,H3,HR,AB,BAVG,WP,HBP,BK,SFA,SHA,GO,FO',
		...[...elementNodeListOf].map(extractPitchingPlayerData)];
}