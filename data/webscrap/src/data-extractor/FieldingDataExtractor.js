import { FieldingPlayerInterpreter } from '../interpreter/FieldingPlayerInterpreter.js';

function extractFieldingPlayerData(container) {
	const playerInterpreter = new FieldingPlayerInterpreter(container);
	const playerSurName = playerInterpreter.getPlayerSurName();
	const playerFirstName = playerInterpreter.getPlayerFirstName();

	if (playerSurName==='-' || playerFirstName==='-') {
		return;
	}
	
	const playerData = [
		playerSurName,
		playerFirstName,
		playerInterpreter.getTeam(),
		playerInterpreter.getG(),
		playerInterpreter.getC(),
		playerInterpreter.getPO(),
		playerInterpreter.getA(),
		playerInterpreter.getE(),
		playerInterpreter.getFLDP(),
		playerInterpreter.getDP(),
		playerInterpreter.getSBA(),
		playerInterpreter.getCSB(),
		playerInterpreter.getSBAP(),
		playerInterpreter.getPB(),
		playerInterpreter.getCI()
	]
	return playerData.join(',');
}

export function extractFieldingData(dom) {
	const elementNodeListOf = dom.window.document.querySelectorAll('.stats-content tbody tr');
	return [
		'Surname,First Name,Team,G,C,PO,A,E,FLDP,DP,SBA,CSB,SBAP,PB,CI',
		...[...elementNodeListOf].map(extractFieldingPlayerData)].filter(line => !!line);
}
