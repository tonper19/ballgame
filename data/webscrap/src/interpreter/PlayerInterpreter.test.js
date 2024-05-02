import { PlayerInterpreter } from './PlayerInterpreter';
import { describe, expect, it } from 'vitest';
import { JSDOM } from 'jsdom';

function createPlayerInstance(data) {
	return new PlayerInterpreter(new JSDOM('<body>' +
			'<table>' +
			'<tr>' +
			data +
			'</tr>' +
			'</table>' +
			'</body>').window.document.body);
}

describe('PlayerInterpreter with correct data', () => {
	const playerInterpreter = createPlayerInstance(
			'<td class="player"><strong>PAULA</strong><br> José-Andres, Gregorio</td>PAVARANI</strong><br> Aldo</td>' +
			'<td class="team">NET</td>'
	);

	describe('getPlayerSurName', () => {
		it('should return the player\'s surname', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('PAULA');
		});
	});

	describe('getPlayerFirstName', () => {
		it('should return the player\'s first name', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('José-Andres Gregorio');
		});
	});

	describe('getTeam', () => {
		it('should return the player\'s team', () => {
			const result = playerInterpreter.getTeam();
			expect(result).toBe('NET');
		});
	});
});

describe('PlayerInterpreter with no data', () => {
	const playerInterpreter = createPlayerInstance('');

	describe('getPlayerSurName', () => {
		it('should return "-"', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('-');
		});
	});

	describe('getPlayerFirstName', () => {
		it('should return "-"', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('-');
		});
	});

	describe('getTeam', () => {
		it('should return undefined', () => {
			const result = playerInterpreter.getTeam();
			expect(result).toBeUndefined;
		});
	});
});

describe('PlayerInterpreter with empty player data', () => {
	const playerInterpreter = createPlayerInstance('<td class="player"></td>');

	describe('getPlayerSurName', () => {
		it('should return "-"', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('-');
		});
	});

	describe('getPlayerFirstName', () => {
		it('should return "-"', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('-');
		});
	});
});

describe('PlayerInterpreter with player name including coma and without space after the coma', () => {
	const playerInterpreter = createPlayerInstance(
			'<td class="player"><strong>PAULA</strong><br> José-Andres,Gregorio</td>PAVARANI</strong><br> Aldo</td>' +
			'<td class="team">NET</td>'
	);
	describe('getPlayerFirstName', () => {
		it('should return the player\'s name', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('José-Andres Gregorio');
		});
	});
});
