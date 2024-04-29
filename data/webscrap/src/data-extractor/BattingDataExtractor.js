import { BattingPlayerInterpreter } from '../interpreter/BattingPlayerInterpreter.js';

// Player,Team,AB,R,H,H2,H3,HR,RBI,TB,AVG,SLG,OBP,OPS,BB,HBP,SO,GDP,SF,SH,SB,CS

function extractBattingPlayerData(container) {
	const playerInterpreter = new BattingPlayerInterpreter(container);
	return [
		playerInterpreter.getPlayerSurName(),
		playerInterpreter.getPlayerFirstName(),
		playerInterpreter.getTeam(),
		playerInterpreter.getAB(),
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
	].join(',')
}

export function extractBattingData(dom) {
	const elementNodeListOf = dom.window.document.querySelectorAll('.stats-content tbody tr');
	return [
		'Surname,First Name,Team,AB,R,H,H2,H3,HR,RBI,TB,AVG,SLG,OBP,OPS,BB,HBP,SO,GDP,SF,SH,SB,CS',
		...[...elementNodeListOf].map(extractBattingPlayerData)];
}