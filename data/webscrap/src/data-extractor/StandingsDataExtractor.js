import { TeamStandingInterpreter } from '../interpreter/TeamStandingsInterpreter.js';

export function extractTeamStandingData(container) {
	const teamStandingInterpreter = new TeamStandingInterpreter(container);

	return [
		teamStandingInterpreter.getPosition(),
		teamStandingInterpreter.getTeamImageUrl(),
		teamStandingInterpreter.getTeamUrl(),
		teamStandingInterpreter.getShortName(),
		teamStandingInterpreter.getFullName(),
		teamStandingInterpreter.getW(),
		teamStandingInterpreter.getL(),
		teamStandingInterpreter.getT(),
		teamStandingInterpreter.getPCT(),
		teamStandingInterpreter.getGB()
	].join(',');
}

export function extractTeamStandingsData(dom) {
	const elementNodeListOf = dom.querySelectorAll('table.standings-print tbody tr')
	return [
		'Position,Image,Link,ShorName,FullName,W,L,T,PCT,GB',
		...[...elementNodeListOf].filter((line) => !line.innerHTML.includes('</th>')).map(extractTeamStandingData)].filter(line => !!line);
}

export function extractStandingData(dom) {
	const standingTablesIdentifiers = Array.from(dom.querySelectorAll('ul.nav-tabs li a')).map(getStandingTablesIdentifiers);
	
	
	
	return standingTablesIdentifiers;
}

function getStandingTablesIdentifiers(entry) {
	const id = entry.getAttribute('href').replaceAll('#', '');
	const name = entry.textContent;

	return { id, name }
}