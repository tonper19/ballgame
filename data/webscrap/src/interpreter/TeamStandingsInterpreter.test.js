import { JSDOM } from 'jsdom';
import { describe, expect, it } from 'vitest';
import { TeamStandingInterpreter } from './TeamStandingsInterpreter.js';

function createTeamStandingInstance(data) {
	return new TeamStandingInterpreter(new JSDOM(
			'<body>' +
			'<table>' +
			'<tr>' +
			data +
			'</tr>' +
			'</table>' +
			'</body>'
	).window.document.body);
}

describe('TeamStandingInterpreter with correct data', () => {
	const teamStandingInterpreter = createTeamStandingInstance(
			'            <td>1</td>' +
			'            <td class="no-wrap">' +
			'                                <a href="https://www.baseballsoftball.be/en/events/2024-baseball-d1/teams/29024">' +
			'                    <img alt="Brasschaat Braves flag" class="flag-icon lazyloaded" src="https://static.wbsc.org/assets/cms/teams/logo/a39fd931-7c83-ffd7-63b9-d21f6f0851d9.jpg" title="Brasschaat Braves">' +
			'                </a>' +
			'            </td>' +
			'            <td>' +
			'                <a href="https://www.baseballsoftball.be/en/events/2024-baseball-d1/teams/29024">' +
			'                    <p class="team-name">' +
			'                        BRA' +
			'                        <br><small>Brasschaat Braves</small>' +
			'                    </p>' +
			'                </a>' +
			'            </td>' +
			'            <td>8</td>' +
			'            <td>3</td>' +
			'            <td>0</td>' +
			'                        <td>.727</td>' +
			'            <td>0</td>'
	);
	
	it('should return position of the team', () => {
		const position = teamStandingInterpreter.getPosition();
		expect(position).toBe('1');
	});
	
	it('should return logo image url of the team', () => {
		const url = teamStandingInterpreter.getTeamImageUrl();
		expect(url).toBe('https://static.wbsc.org/assets/cms/teams/logo/a39fd931-7c83-ffd7-63b9-d21f6f0851d9.jpg');
	});

	it('should return team url page', () => {
		const url = teamStandingInterpreter.getTeamUrl();
		expect(url).toBe('https://www.baseballsoftball.be/en/events/2024-baseball-d1/teams/29024');
	});

	it('should return team short name ', () => {
		const teamShortName = teamStandingInterpreter.getShortName();
		expect(teamShortName).toBe('BRA');
	});

	it('should return team full name', () => {
		const teamFullName = teamStandingInterpreter.getFullName();
		expect(teamFullName).toBe('Brasschaat Braves');
	});
	
	it('should return won games', () => {
		expect(teamStandingInterpreter.getW()).toBe('8');
	});

	it('should return lost games', () => {
		expect(teamStandingInterpreter.getL()).toBe('3');
	});

	it('should return tie games', () => {
		expect(teamStandingInterpreter.getT()).toBe('0');
	});

	it('should return percentage of games won', () => {
		expect(teamStandingInterpreter.getPCT()).toBe('0.727');
	});

	it('should return games behind', () => {
		expect(teamStandingInterpreter.getGB()).toBe('0');
	});
});
